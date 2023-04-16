#include <iostream>
#include <vector>
#include "utils.hpp"
#include "common.h"
#include <string>

#define NUM_PAST 1

extern "C" void _mlir_ciface_main_graph(
  StridedMemRefType<int64_t,3> *, 
  StridedMemRefType<int64_t,2> *, 
  StridedMemRefType<float,4> *,
  StridedMemRefType<float,4> *);

int main() {
  // get input id
  int64_t input_id_shape[] = {64, 1};
  StridedMemRefType<int64_t,2> input_id(input_id_shape);
  DynamicMemRefType<int64_t> did(input_id);
  read_tensor("input_ids.dat", did);

  // get past_key_values
  std::string basePath = "past_key_values/past.";
  int64_t past_rank = 4;
  int64_t past_shape[] = {64, 12, 255, 64};
  StridedMemRefType<float,4> pasts[NUM_PAST][2];

  for (int i = 0; i < 1; ++ i) {
    std::string kdat = basePath + std::to_string(i) + std::string(".key");
    StridedMemRefType<float, 4> pkey(past_shape);
    DynamicMemRefType<float> dpkey(pkey);
    read_tensor(kdat.c_str(), dpkey);

    std::string vdat = basePath + std::to_string(i) + std::string(".value");
    StridedMemRefType<float, 4> pval(past_shape);
    DynamicMemRefType<float> dpval(pval);
    read_tensor(vdat.c_str(), dpval);

    pasts[i][0] = pkey;
    pasts[i][1] = pval;
  }

  StridedMemRefType<int64_t,3> output;
  uint64_t start_ns = getCurNs();
  _mlir_ciface_main_graph(&output, &input_id, &pasts[0][0], &pasts[0][1]);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f s\n", (float)(end_ns - start_ns)/1e9); 
  DynamicMemRefType<int64_t> dO(output);
  print_tensor<int64_t>(dO, false);

  return 0;
}