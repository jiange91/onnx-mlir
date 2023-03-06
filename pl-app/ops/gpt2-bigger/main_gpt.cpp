#include <iostream>
#include <vector>
#include "utils.h"
#include "common.h"
#include "OnnxMlirRuntime.h"
#include <string>

// Declare the inference entry point.
extern "C" OMTensorList *run_main_graph(OMTensorList *);

#define NUM_LAYERS 24

int main(int argc, char **argv) {
  OMTensor *inputTensors[2 * NUM_LAYERS + 1];
  // get input id
  int64_t input_id_rank = 2;
  int64_t shape[] = {64, 1};
  StridedMemRefType<int64_t, 2> input_id(shape);
  DynamicMemRefType<int64_t> diid(input_id);
  read_tensor("input_ids.dat", diid);
  inputTensors[0] = omTensorCreate(input_id.data, shape, input_id_rank, ONNX_TYPE_INT64);
  
  // get past_key_values
  std::string basePath = "past_key_values/past.";
  int64_t past_rank = 4;
  int64_t past_shape[] = {64, 16, 256, 64};
  for (int i = 0; i < NUM_LAYERS; ++ i) {
    std::string kdat = basePath + std::to_string(i) + std::string(".key");
    StridedMemRefType<float, 4> pkey(past_shape);
    DynamicMemRefType<float> dpkey(pkey);
    read_tensor(kdat.c_str(), dpkey);

    std::string vdat = basePath + std::to_string(i) + std::string(".value");
    StridedMemRefType<float, 4> pval(past_shape);
    DynamicMemRefType<float> dpval(pval);
    read_tensor(vdat.c_str(), dpval);
    
    inputTensors[i * 2 + 1] = omTensorCreate(pkey.data, past_shape, past_rank, ONNX_TYPE_FLOAT);
    inputTensors[i * 2 + 2] = omTensorCreate(pval.data, past_shape, past_rank, ONNX_TYPE_FLOAT);
  }

  OMTensorList *tensorListIn = omTensorListCreate(inputTensors, 2 * NUM_LAYERS + 1);
  
  uint64_t start_ns = getCurNs();
  // Compute outputs.
  OMTensorList *tensorListOut = run_main_graph(tensorListIn);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f s\n", (float)(end_ns - start_ns)/1e9);


  // Extract the output. The model defines one output of type tensor<1x10xf32>.
  OMTensor *y = omTensorListGetOmtByIndex(tensorListOut, 0);
  int64_t outrank = omTensorGetRank(y);
  int64_t *outshapes = omTensorGetShape(y);
  for (int64_t i = 0; i < outrank; ++i ) {
    printf("%ld\n", outshapes[i]);
  }
  
 // float *prediction = (float *)omTensorGetDataPtr(y);

  // Analyze the output.
 //  check_output(prediction, output, shape, rank);
  return 0;
}
