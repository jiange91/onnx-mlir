#include "common.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>

DEF_TENSOR(4);
#define reset_swap_stat 330

 void _mlir_ciface_main_graph(Tensor_R4 *y, Tensor_R4 *input);

int main(int argc, char *argv[]) {
  // int64_t in_shape[] = {10000, 1, 28, 28};
  int64_t in_shape[] = {10000, 32, 26, 26};
  int64_t rank = 4;

  float *in_buf = dummy_tensor(in_shape, rank);

  MAKE_TENSOR(x, in_buf, in_shape, 4);
  Tensor_R4 output;
  syscall(reset_swap_stat); 

  // Compute outputs.
  uint64_t start_ns = getCurNs();
  _mlir_ciface_main_graph(&output, &_T_x);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f us\n", (float)(end_ns - start_ns)/1e3);

  // Get the first omt as output.
  // printf("Verify output ---- \n");
  // float *outputPtr = output._aligned_ptr;
  // for (int64_t e = 0; e < out_shape[0] * out_shape[1]; ++ e) {
  //   float diff = abs(outputPtr[e] - out_buf[e]);
  //   if (diff >= 1e-5)
  //     printf("pred: %f, y: %f, diff: %f\n", outputPtr[e], out_buf[e], diff);
  // }
  // printf(" ---- Complete\n");
  return 0;
}
