#include <iostream>
#include <vector>
#include "utils.h"
#include "common.h"

#include "OnnxMlirRuntime.h"

// Declare the inference entry point.
extern "C" OMTensorList *run_main_graph(OMTensorList *);

int main(int argc, char **argv) {
  int64_t rank = 3;
  int64_t shape[] = {1008, 64, 512};
  StridedMemRefType<float, 3> X(shape);
  DynamicMemRefType<float> dX(X);
  read_tensor("dummy_in.dat", dX);


  OMTensor *tensor = omTensorCreate(X.data, shape, rank, ONNX_TYPE_FLOAT);
  // Create a tensor list.
  OMTensorList *tensorListIn = omTensorListCreate(&tensor, 1);
  
  uint64_t start_ns = getCurNs();
  // Compute outputs.
  OMTensorList *tensorListOut = run_main_graph(tensorListIn);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f s\n", (float)(end_ns - start_ns)/1e9);


  // Extract the output. The model defines one output of type tensor<1x10xf32>.
  OMTensor *y = omTensorListGetOmtByIndex(tensorListOut, 0);
  float *prediction = (float *)omTensorGetDataPtr(y);
  float *output = read_tensor("dummy_out.dat", shape, 3);
  check_output(prediction, output, shape, 3);

  // Analyze the output.
 //  check_output(prediction, output, shape, rank);
  return 0;
}
