#include <iostream>
#include <vector>
#include "utils.hpp"
#include "common.h"
#include <string>

#define NUM_PAST 12

extern "C" void _mlir_ciface_main_graph(
  StridedMemRefType<float,3> *,
  StridedMemRefType<float,3> *,
  StridedMemRefType<float,2> *
  );

int main() {
  // get A
  int64_t A_shape[] = {64, 1, 768};
  StridedMemRefType<float,3> AS(A_shape);
  DynamicMemRefType<float> dA(AS);
  read_tensor("A.dat", dA);

  // get B
  int64_t B_shape[] = {768, 50264};
  StridedMemRefType<float,2> BS(B_shape);
  DynamicMemRefType<float> dB(BS);
  read_tensor("B.dat", dB);

  // flush local
  int64_t flush_size = (1LL << 10); // MB
  flush_local(flush_size);

  StridedMemRefType<float,3> output;

  uint64_t start_ns = getCurNs();
  _mlir_ciface_main_graph(
    &output, &AS, &BS);
  uint64_t end_ns = getCurNs();

  printf("Exec time %.6f s\n", (float)(end_ns - start_ns)/1e9); 
  DynamicMemRefType<float> dO(output);
  print_tensor(dO, false);

  return 0;
}