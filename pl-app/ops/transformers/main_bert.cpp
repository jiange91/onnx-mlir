#include <iostream>
#include <vector>
#include "utils.h"
#include "common.h"

#include "OnnxMlirRuntime.h"

// Declare the inference entry point.
extern "C" OMTensorList *run_main_graph(OMTensorList *);

int main(int argc, char **argv) {
  int64_t rank = 2;
  int64_t shape[] = {64, 20};
  StridedMemRefType<int64_t, 2> X(shape);
  DynamicMemRefType<int64_t> dX(X);
  read_tensor("dummy_in.dat", dX);

  OMTensor *tensor = omTensorCreate(X.data, shape, rank, ONNX_TYPE_FLOAT);
  // Create a tensor list.
  OMTensor *inputTensors[1] = {tensor};
  OMTensorList *tensorListIn = omTensorListCreate(inputTensors, 1);
  
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
