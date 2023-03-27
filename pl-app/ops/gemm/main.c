#include <OnnxMlirRuntime.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include "common.h"

OMTensorList *run_main_graph(OMTensorList *);

int main() {
  // Shared shape & rank.
  int64_t A_shape[] = {64512, 512};
  int64_t B_shape[] = {512, 512};
  int64_t rank = 2;
  // Construct x1 omt filled with 1.
  float *A_Data = read_tensor("/users/Zijian/onnx-mlir/pl-app/ops/matmul/A.dat", A_shape, 2);
  OMTensor *x1 = omTensorCreate(A_Data, A_shape, rank, ONNX_TYPE_FLOAT);

  // Construct x2 omt filled with 2.
  float *B_Data = read_tensor("/users/Zijian/onnx-mlir/pl-app/ops/matmul/B.dat", B_shape, 2);
  OMTensor *x2 = omTensorCreate(B_Data, B_shape, rank, ONNX_TYPE_FLOAT);

  // flush_local(1024);

  // Construct a list of omts as input.
  OMTensor *list[2] = {x1, x2};
  OMTensorList *input = omTensorListCreate(list, 2);
  // Call the compiled onnx model function.
  uint64_t start_ns = getCurNs();
  OMTensorList *outputList = run_main_graph(input);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f s\n", (float)(end_ns - start_ns)/1e9);
  // Get the first omt as output.
  OMTensor *y = omTensorListGetOmtByIndex(outputList, 0);

  float *outputPtr = (float *) omTensorGetDataPtr(y);
  // float *C_Data = read_tensor("C.dat", A_shape, 2);
  // check_output(outputPtr, C_Data, A_shape, 2);
  return 0;
}
