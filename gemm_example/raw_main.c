#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include "common.h"

#define abs(X) ((X) < 0 ? -1.f * (X) : (X))
#define reset_swap_stat 330

DEF_TENSOR(2);

void _mlir_ciface_main_graph(Tensor_R2 *C, Tensor_R2 *A, Tensor_R2 *B);

int main() {
  // Shared shape & rank.
  int64_t A_shape[] = {10000, 9216};
  int64_t B_shape[] = {9216, 128};
  int64_t rank = 2;
  // Construct x1 omt filled with 1.
  int64_t ele_A = A_shape[0] * A_shape[1];
  float *A_Data = (float *) malloc(sizeof(float) * ele_A);
  for (int64_t i = 0; i < ele_A; ++ i)
    A_Data[i] = 1.f;
  
  // create _T_A
  MAKE_TENSOR(A, A_Data, A_shape, 2);

  // Construct x2 omt filled with 2.
  int64_t ele_B = B_shape[0] * B_shape[1];
  float *B_Data = (float *) malloc(sizeof(float) * ele_B);
  for (int64_t i = 0; i < ele_B; ++ i)
    B_Data[i] = 1.f;

  // create _T_B
  MAKE_TENSOR(B, B_Data, B_shape, 2);

  // Call the compiled onnx model function.
  Tensor_R2 C;
  syscall(reset_swap_stat); 

  uint64_t start_ns = getCurNs();
  _mlir_ciface_main_graph(&C, &_T_A, &_T_B);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f us\n", (float)(end_ns - start_ns)/1e3);

  // int64_t ele_C = A_shape[0] * B_shape[1];
  // for (int64_t i = 0; i < ele_C; i++) {
  //   float diff = abs(C._aligned_ptr[i] - 9216.0);
  //   if (diff >= 1e-5)
  //     printf("C: %f, diff: %f\n", C._aligned_ptr[i], diff);
  // }
  return 0;
}
