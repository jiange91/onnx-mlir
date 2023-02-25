#include "common.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>

DEF_TENSOR(3);
#define reset_swap_stat 330

void _mlir_ciface_main_graph(Tensor_R3 *y, Tensor_R3 *input);

int main(int argc, char *argv[]) {
  int64_t in_shape[] = {1008, 64, 512};
  int64_t rank = 3;

  float *in_buf = read_tensor("dummy_in.dat", in_shape, 3);
 // float *out_buf = read_tensor("dummy_out.dat", in_shape, 3);

  MAKE_TENSOR(x, in_buf, in_shape, 3);
  Tensor_R3 output;
  syscall(reset_swap_stat); 

  // Compute outputs.
  uint64_t start_ns = getCurNs();
  _mlir_ciface_main_graph(&output, &_T_x);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f us\n", (float)(end_ns - start_ns)/1e3);

 // check_output(output._aligned_ptr, out_buf, in_shape, rank);
  return 0;
}
