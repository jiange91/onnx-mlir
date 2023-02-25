#include <iostream>
#include <vector>
#include "common.h"

#include "OnnxMlirRuntime.h"

// Declare the inference entry point.
extern "C" OMTensorList *run_main_graph(OMTensorList *);

int main() {
  // Create an input tensor list of 1 tensor.
  int inputNum = 1;
  OMTensor **inputTensors = (OMTensor **)malloc(inputNum * sizeof(OMTensor *));
  // The first input is of tensor<1x1x28x28xf32>.
  int64_t rank = 3;
  int64_t shape[] = {1008, 64, 512};
  float *input = read_tensor("dummy_in.dat", shape, 3);
  // float *output = read_tensor("dummy_out.dat", shape, 3);

  OMTensor *tensor = omTensorCreate(input, shape, rank, ONNX_TYPE_FLOAT);
  // Create a tensor list.
  inputTensors[0] = tensor;
  OMTensorList *tensorListIn = omTensorListCreate(inputTensors, inputNum);
  
  uint64_t start_ns = getCurNs();
  // Compute outputs.
  OMTensorList *tensorListOut = run_main_graph(tensorListIn);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f s\n", (float)(end_ns - start_ns)/1e9);


  // Extract the output. The model defines one output of type tensor<1x10xf32>.
  OMTensor *y = omTensorListGetOmtByIndex(tensorListOut, 0);
  float *prediction = (float *)omTensorGetDataPtr(y);

  // Analyze the output.
 //  check_output(prediction, output, shape, rank);
  return 0;
}
