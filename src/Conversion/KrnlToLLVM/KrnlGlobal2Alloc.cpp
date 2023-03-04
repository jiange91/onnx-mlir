/*
 * SPDX-License-Identifier: Apache-2.0
 */

//===------ KrnlGlobal2memref.cpp - Convert KrnlGlobalOp to memref ---------------------------===//
//
// Copyright 2023-2026 Zijian He
//
// =============================================================================
//
#include "mlir/Analysis/DataLayoutAnalysis.h"
#include "mlir/Conversion/LLVMCommon/Pattern.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/BuiltinAttributes.h"
#include "mlir/IR/DialectResourceBlobManager.h"
#include "llvm/ADT/TypeSwitch.h"
#include "llvm/Support/Debug.h"

#include "src/Dialect/Krnl/KrnlOps.hpp"
#include "src/Conversion/KrnlToLLVM/KrnlToLLVMHelper.hpp"
#include "src/Dialect/Mlir/DialectBuilder.hpp"
#include "src/Dialect/Krnl/KrnlHelper.hpp"
#include "src/Dialect/Krnl/KrnlOps.hpp"
#include "src/Support/KrnlSupport.hpp"
#include "src/Pass/Passes.hpp"
#include "mlir/Pass/Pass.h"
#include "mlir/Target/LLVMIR/ModuleTranslation.h"
#include "mlir/Transforms/DialectConversion.h"
#include "llvm/ADT/Sequence.h"
#include <iostream>
#include <fstream>
#include <map>

#define DEBUG_TYPE "krnlgbl_to_memref"

using namespace mlir;

namespace onnx_mlir {
namespace krnl {

class EliderRegistry;
class EliderAPI final {
  friend class EliderRegistry;
public:
  enum class ID {
    READ_I32,
    READ_I64,
    READ_F32,
    READ_DBL,

    ECHO_I32,
    ECHO_I64,
    ECHO_F32,
    ECHO_DBL,
  };

private:
  EliderAPI(ID id, StringRef name, ArrayRef<Type> output, ArrayRef<Type> input) : id(id), name(name), outputTy(output), inputTypes(input.begin(), input.end()) {}
  ID id;
  StringRef name;
  llvm::SmallVector<Type, 2> outputTy;
  llvm::SmallVector<Type, 2> inputTypes;
};

class EliderRegistry final {
public:

  EliderRegistry(mlir::ModuleOp &module): module(module) {
    MLIRContext *context = module.getContext();
    auto voidTy = LLVM::LLVMVoidType::get(context);
    auto int8Ty = IntegerType::get(context, 8);
    auto int32Ty = IntegerType::get(context, 32);
    auto int64Ty = IntegerType::get(context, 64);
    auto floatTy = FloatType::getF32(context);
    auto dblTy = FloatType::getF64(context);
    auto opaquePtrTy = LLVM::LLVMPointerType::get(int8Ty);
    auto mI32 = UnrankedMemRefType::get(int32Ty, 0);
    auto mI64 = UnrankedMemRefType::get(int64Ty, 0);
    auto mf32 = UnrankedMemRefType::get(floatTy, 0);
    auto mdbl = UnrankedMemRefType::get(dblTy, 0);

    using ID = EliderAPI::ID;
    registry.emplace(ID::READ_I32, EliderAPI(ID::READ_I32, "read_tensor_i32", {}, {  opaquePtrTy, mI32 }));
    registry.emplace(ID::READ_I64, EliderAPI(ID::READ_I64, "read_tensor_i64", {}, {  opaquePtrTy, mI64 }));
    registry.emplace(ID::READ_F32, EliderAPI(ID::READ_F32, "read_tensor_f32", {}, {  opaquePtrTy, mf32 }));
    registry.emplace(ID::READ_DBL, EliderAPI(ID::READ_DBL, "read_tensor_dbl", {}, {  opaquePtrTy, mdbl }));

    registry.emplace(ID::ECHO_I32, EliderAPI(ID::ECHO_I32, "print_tensor_i32", {}, { mI32 }));
    registry.emplace(ID::ECHO_I64, EliderAPI(ID::ECHO_I64, "print_tensor_i64", {}, { mI64 }));
    registry.emplace(ID::ECHO_F32, EliderAPI(ID::ECHO_F32, "print_tensor_f32", {}, { mf32 }));
    registry.emplace(ID::ECHO_DBL, EliderAPI(ID::ECHO_DBL, "print_tensor_dbl", {}, { mdbl }));
  }

  void declareAPI(EliderAPI::ID id, OpBuilder &builder) {
    const EliderAPI &api = registry.at(id);
    if (!module.lookupSymbol<func::FuncOp>(api.name)) {
      OpBuilder::InsertionGuard guard(builder);
      builder.setInsertionPointToStart(module.getBody());
      auto funcType = builder.getFunctionType(api.inputTypes, api.outputTy);
          // mlir::FunctionType::get(builder.getContext(), api.inputTypes, {api.outputTy});
      StringAttr vis = StringAttr::get(builder.getContext(), "private");
      auto funcOp = builder.create<func::FuncOp>(module.getLoc(), api.name, funcType);
      funcOp.setSymVisibilityAttr(vis);
    }
  }

  Operation::result_range callAPI(EliderAPI::ID id, OpBuilder &builder, Location loc, ValueRange params) {
    assert((registry.find(id) != registry.end()) &&
        "apiId not found in registry");
    const EliderAPI &api = registry.at(id);
    auto symbol = mlir::SymbolRefAttr::get(builder.getContext(), api.name);
    auto callOp = builder.create<func::CallOp>(
      loc, symbol, api.outputTy, params
    );
    return callOp->getResults();
  }

private:
  std::map<EliderAPI::ID, EliderAPI> registry;
  mlir::ModuleOp &module;
};

static int64_t ArrayAttrIntVal(ArrayAttr a, int i) {
  return (a.getValue()[i]).cast<IntegerAttr>().getInt();
}

static int64_t computeSizeInBytes(KrnlGlobalOp &krnlGlobalOp) {
  // Compute total number of elements.
  const auto shape = (krnlGlobalOp.getShape()).dyn_cast<ArrayAttr>();
  int64_t numElements = 1;
  for (unsigned int i = 0; i < shape.size(); ++i)
    numElements *= ArrayAttrIntVal(shape, i);

  const auto type = krnlGlobalOp.getResult().getType();
  const auto memRefTy = type.cast<mlir::MemRefType>();

  return numElements * getMemRefEltSizeInBytes(memRefTy);
}

static void allocAndRead(KrnlGlobalOp krnlGlobalOp, OpBuilder &builder, EliderRegistry &reg) {
  MLIRContext *context = krnlGlobalOp.getContext();
  Location loc = krnlGlobalOp.getLoc();
  ModuleOp module = krnlGlobalOp->getParentOfType<ModuleOp>();
  IRRewriter rewriter(builder);
  MultiDialectBuilder<LLVMBuilder, MemRefBuilder> create(rewriter, loc);

  // The element type of the array.
  const Type type = krnlGlobalOp->getResult(0).getType();
  const MemRefType memRefTy = type.cast<mlir::MemRefType>();

  assert(krnlGlobalOp.getValue().has_value() &&
          "Krnl Global must always have a value");

  // create file symbol
  LLVM::GlobalOp fileGlob;
  StringRef sym = krnlGlobalOp.getName();
  {
    OpBuilder::InsertionGuard insertGuard(rewriter);
    rewriter.setInsertionPointToStart(module.getBody());
    
    
    StringAttr fileNameAttr = StringAttr::get(context, sym.str() + '\0');
    auto fileNameType = LLVM::LLVMArrayType::get(IntegerType::get(context, 8), sym.size() + 1);
    fileGlob = create.llvm.globalOp(fileNameType, true, LLVM::Linkage::Internal, sym, fileNameAttr);

    // write to file
    ArrayRef<char> rawData;
    int64_t sizeInBytes = computeSizeInBytes(krnlGlobalOp);
    auto value = krnlGlobalOp.getValue().value();
    if (auto attr = value.dyn_cast<DenseResourceElementsAttr>()) {
      rawData = attr.getRawHandle().getBlob()->getData();
    } else {
      rawData = value.cast<DenseElementsAttr>().getRawData();
    }
    assert(((int64_t)rawData.size() == sizeInBytes) && "Data size mismatch.");
    std::ofstream wf(sym.data(), std::ios::out | std::ios::binary);
    assert(wf && "cannot open file");
    wf.write(rawData.data(), sizeInBytes);
    wf.close();
  }
  auto alloc = create.mem.alignedAlloc(memRefTy);

  // insert func and read call
  Type eleType = memRefTy.getElementType();
  Value UM = rewriter.create<memref::CastOp>(loc, UnrankedMemRefType::get(eleType, 0), alloc.getMemref()).getDest();

  Type i8Type = IntegerType::get(context, 8);
  Type i64Type = IntegerType::get(context, 64);
  Type i8PtrTy = LLVM::LLVMPointerType::get(i8Type);
  Value address = create.llvm.addressOf(fileGlob);
  Value zeroI64 = create.llvm.constant(i64Type, (int64_t)0);
  Value strAddr = create.llvm.getElemPtr(i8PtrTy, address, {zeroI64, zeroI64});

  TypeSwitch<Type>(eleType)
    .Case<IntegerType>([&](IntegerType ty) {
      unsigned b = ty.getWidth();
      if (b == 32) {
        reg.declareAPI(EliderAPI::ID::READ_I32, rewriter);
        reg.callAPI(EliderAPI::ID::READ_I32, rewriter, loc, { strAddr, UM });
      } 
      else if (b == 64) {
      	reg.declareAPI(EliderAPI::ID::READ_I64, rewriter);
      	reg.callAPI(EliderAPI::ID::READ_I64, rewriter, loc, { strAddr, UM });
      }
      else {
        ty.dump();
        llvm_unreachable("Unsupported 2alloc type");
      }
    })
    .Case<FloatType>([&](FloatType ty) {
      unsigned b = ty.getWidth();
      if (b == 32) {
        reg.declareAPI(EliderAPI::ID::READ_F32, rewriter);
        reg.callAPI(EliderAPI::ID::READ_F32, rewriter, loc, { strAddr, UM });
      }
      else if (b == 64) {
        reg.declareAPI(EliderAPI::ID::READ_DBL, rewriter);
        reg.callAPI(EliderAPI::ID::READ_DBL, rewriter, loc, { strAddr, UM });
      }
      else {
        ty.dump();
        llvm_unreachable("Unsupported 2alloc type");
      }
    })
    .Default([&](Type ty) {
      ty.dump();
      llvm_unreachable("Unsupported 2alloc type");
    });
  rewriter.replaceOp(krnlGlobalOp, { alloc.getMemref() }); 
}

struct KrnlGlobToAllocPass : public PassWrapper<KrnlGlobToAllocPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(KrnlGlobToAllocPass)

  KrnlGlobToAllocPass() = default;
  KrnlGlobToAllocPass(const KrnlGlobToAllocPass &pass)
      : PassWrapper<KrnlGlobToAllocPass, OperationPass<ModuleOp>>() {}

  StringRef getArgument() const override { return "convert-krnl-glob-to-alloc"; }

  StringRef getDescription() const override {
    return "Convert krnl.glob to memref.alloc and read from file";
  }
  Option<bool> omitEntryPoint{*this, "omit-entry-point", llvm::cl::desc(
    "Delete Krnl entry point to exclude runtime APIs.\n"
    "The generated IR is used for PL pass"),
    llvm::cl::init(false)};

  void runOnOperation() final;
};

void KrnlGlobToAllocPass::runOnOperation() {
  ModuleOp module = getOperation();
  MLIRContext *ctx = &getContext();
  const auto &dataLayoutAnalysis = getAnalysis<DataLayoutAnalysis>();
  LowerToLLVMOptions options(ctx, dataLayoutAnalysis.getAtOrAbove(module));

  // Delete entry point
  if (omitEntryPoint) {
    OpBuilder b(module);
    module->walk([&](KrnlEntryPointOp op) {
      op.erase();
    });
  }

  // convert krnl glob
  EliderRegistry reg(module);
  module->walk([&](KrnlGlobalOp op) {
    OpBuilder bb(op);
    allocAndRead(op, bb, reg);
  });
}

std::unique_ptr<mlir::Pass> createKrnlGlobToAllocPass() {
  return std::make_unique<KrnlGlobToAllocPass>();
}

} // namespace krnl
} // namespace onnx_mlir
