#include "utils.h"

extern "C" {
  void _mlir_ciface_print_tensor_i64(UnrankedMemRefType<int32_t> *m) {
    print_tensor(DynamicMemRefType<int32_t>(*m));
  }

  void _mlir_ciface_print_tensor_i64(UnrankedMemRefType<int64_t> *m) {
    print_tensor(DynamicMemRefType<int64_t>(*m));
  }

  void _mlir_ciface_print_tensor_f32(UnrankedMemRefType<float> *m) {
    print_tensor(DynamicMemRefType<float>(*m));
  }

  void _mlir_ciface_print_tensor_f32(UnrankedMemRefType<double> *m) {
    print_tensor(DynamicMemRefType<double>(*m));
  }

  void _mlir_ciface_read_tensor_i64(const char *file, UnrankedMemRefType<int32_t> *m) {
    read_tensor(file, DynamicMemRefType<int32_t>(*m));
  }

  void _mlir_ciface_read_tensor_i64(const char *file, UnrankedMemRefType<int64_t> *m) {
    read_tensor(file, DynamicMemRefType<int64_t>(*m));
  }

  void _mlir_ciface_read_tensor_f32(const char *file, UnrankedMemRefType<float> *m) {
    read_tensor(file, DynamicMemRefType<float>(*m));
  }

  void _mlir_ciface_read_tensor_f32(const char *file, UnrankedMemRefType<double> *m) {
    read_tensor(file, DynamicMemRefType<double>(*m));
  }
}