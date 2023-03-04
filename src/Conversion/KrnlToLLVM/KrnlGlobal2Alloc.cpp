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

#define DEBUG_TYPE "krnlgbl_to_memref"

using namespace mlir;

namespace onnx_mlir {
namespace krnl {

class KrnlGlobalOp2Alloc : public ConvertOpToLLVMPattern<KrnlGlobalOp> {
public:
  using ConvertOpToLLVMPattern<KrnlGlobalOp>::ConvertOpToLLVMPattern;

  LogicalResult matchAndRewrite(KrnlGlobalOp krnlGlobalOp, KrnlGlobalOpAdaptor adaptor,
      ConversionPatternRewriter &rewriter) const override {
    MLIRContext *context = krnlGlobalOp.getContext();
    Location loc = krnlGlobalOp.getLoc();
    ModuleOp module = krnlGlobalOp->getParentOfType<ModuleOp>();
    MultiDialectBuilder<LLVMBuilder, MemRefBuilder> create(rewriter, loc);

    // The element type of the array.
    const Type type = krnlGlobalOp->getResult(0).getType();
    const MemRefType memRefTy = type.cast<mlir::MemRefType>();
    const Type constantElementType =
        typeConverter->convertType(memRefTy.getElementType());
    Type globalType = constantElementType;

    assert(krnlGlobalOp.getValue().has_value() &&
           "Krnl Global must always have a value");

    // create file symbol
    LLVM::GlobalOp fileGlob;
    StringRef sym = krnlGlobalOp.getName();
    {
      OpBuilder::InsertionGuard insertGuard(rewriter);
      rewriter.setInsertionPointToStart(module.getBody());

      auto fileNameType = LLVM::LLVMArrayType::get(IntegerType::get(context, 8), sym.size());
      fileGlob = create.llvm.globalOp(fileNameType, true, LLVM::Linkage::Internal, sym, krnlGlobalOp.getNameAttr());

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
    rewriter.replaceOp(krnlGlobalOp, { alloc.getMemref() });
    return mlir::success();
  }

private:
  static int64_t ArrayAttrIntVal(ArrayAttr a, int i) {
    return (a.getValue()[i]).cast<IntegerAttr>().getInt();
  }

  int64_t computeSizeInBytes(KrnlGlobalOp &krnlGlobalOp) const {
    // Compute total number of elements.
    const auto shape = (krnlGlobalOp.getShape()).dyn_cast<ArrayAttr>();
    int64_t numElements = 1;
    for (unsigned int i = 0; i < shape.size(); ++i)
      numElements *= ArrayAttrIntVal(shape, i);

    const auto type = krnlGlobalOp.getResult().getType();
    const auto memRefTy = type.cast<mlir::MemRefType>();

    return numElements * getMemRefEltSizeInBytes(memRefTy);
  }

  // Store the given address into a MemRefDescriptor (a struct).
  MemRefDescriptor createMemRefDescriptor(Value address, MemRefType memRefType,
      Location loc, OpBuilder &builder) const {
    Type elementType = memRefType.getElementType();
    LLVMTypeConverter &typeConverter = *getTypeConverter();
    Type llvmElemType = typeConverter.convertType(elementType);
    MultiDialectBuilder<LLVMBuilder> create(builder, loc);

    // Prepare data to be inserted into a MemRefDescriptor (a struct).
    auto ptrType = LLVM::LLVMPointerType::get(llvmElemType);
    // Bitcast the address to the MemRefType's element type.
    Value bitCastOp = create.llvm.bitcast(ptrType, address);
    // Create llvm MemRef from original MemRef and fill the data pointers.
    return MemRefDescriptor::fromStaticShape(
        builder, loc, typeConverter, memRefType, bitCastOp);
  }

  // Generate a global string for each krnlGlobalOp string value, and store
  // the address of the global strings into an array. Return the array address.
  LLVM::GlobalOp lowerStringLiteral(
      KrnlGlobalOp &krnlGlobalOp, Type globalType, OpBuilder &builder) const {
    assert(krnlGlobalOp.getValue().value().isa<DenseElementsAttr>() &&
           "Expecting a dense value");

    Location loc = krnlGlobalOp.getLoc();
    MultiDialectBuilder<LLVMBuilder> create(builder, loc);

    ModuleOp module = krnlGlobalOp->getParentOfType<ModuleOp>();
    DenseElementsAttr denseAttr =
        krnlGlobalOp.getValue().value().cast<DenseElementsAttr>();

    Type i8Type = IntegerType::get(builder.getContext(), 8);
    Type i8PtrType = LLVM::LLVMPointerType::get(i8Type);

    // Generate LLVM GlobalOps for each string in the KrnlGlobalOp dense
    // attribute.
    SmallVector<LLVM::GlobalOp> globalOps;
    for (StringRef str : denseAttr.getValues<StringRef>()) {
      LLVM::GlobalOp globalOp = krnl::getOrCreateGlobalString(
          str, loc, builder, module, getTypeConverter());
      globalOps.push_back(globalOp);
    }

    // Generate an LLVM GlobalOps with an initializer region containing one
    // block.
    auto arrayType = LLVM::LLVMArrayType::get(i8PtrType, globalOps.size());
    auto global = create.llvm.globalOp(arrayType,
        /*isConstant=*/true, LLVM::Linkage::Internal, krnlGlobalOp.getName(),
        Attribute());
    Region &region = global.getInitializerRegion();
    Block *block = builder.createBlock(&region);

    // Initialize an array with the addresses of the global strings.
    builder.setInsertionPoint(block, block->begin());
    Value array = builder.create<LLVM::UndefOp>(loc, arrayType);

    int32_t index = 0;
    Value lastValue = array;
    for (const LLVM::GlobalOp &globalOp : globalOps) {
      Value strAddr = krnl::getPtrToGlobalString(globalOp, loc, builder);
      lastValue =
          create.llvm.insertValue(arrayType, lastValue, strAddr, {index++});
    }

    create.llvm._return(lastValue);
    return global;
  }
};

void populateKrnlGlobalToAllocPattern(LLVMTypeConverter &typeConverter,
    RewritePatternSet &patterns) {
  patterns.insert<KrnlGlobalOp2Alloc>(typeConverter);
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

  void runOnOperation() final;
};

void KrnlGlobToAllocPass::runOnOperation() {
  ModuleOp module = getOperation();
  MLIRContext *ctx = &getContext();
  const auto &dataLayoutAnalysis = getAnalysis<DataLayoutAnalysis>();
  LowerToLLVMOptions options(ctx, dataLayoutAnalysis.getAtOrAbove(module));

  // Delete entry point
  OpBuilder b(module);
  module->walk([&](KrnlEntryPointOp op) {
    op.erase();
  });

  // Define the target for this lowering i.e. the LLVM dialect.
  ConversionTarget target(*ctx);
  target.addLegalDialect<LLVM::LLVMDialect>();
  target.addLegalDialect<memref::MemRefDialect>();
  target.addLegalOp<ModuleOp>();
  target.addLegalDialect<func::FuncDialect>();
  target.addIllegalOp<KrnlGlobalOp>();
  target.markUnknownOpDynamicallyLegal([](Operation *op) {
    return true;
  });

  // Convert types to legal types for the LLVM dialect.
  LLVMTypeConverter typeConverter(ctx, options);
  customizeTypeConverter(typeConverter);

  RewritePatternSet patterns(ctx);
  populateKrnlGlobalToAllocPattern(typeConverter, patterns);
  if (failed(
          applyFullConversion(getOperation(), target, std::move(patterns)))) {
    signalPassFailure();
  }
}

std::unique_ptr<mlir::Pass> createKrnlGlobToAllocPass() {
  return std::make_unique<KrnlGlobToAllocPass>();
}

} // namespace krnl
} // namespace onnx_mlir
