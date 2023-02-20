#include <OnnxMlirRuntime.h>
#include "common.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define abs(X) ((X) < 0 ? -1.f * (X) : (X))
OMTensorList *run_main_graph(OMTensorList *);

float *read_tensor(const char* file, int64_t shape[], int rank) {
  size_t num_ele = 1;
  for (int i = 0; i < rank; ++ i)
    num_ele *= shape[i];

  float *dat_buf = (float *) malloc(sizeof(float) * num_ele);

  FILE *datfile = fopen(file, "r");
  size_t read = fread(dat_buf, sizeof(float), num_ele, datfile);
  if (read < num_ele)
    printf("Error reading input np array from %s\n", file);

  fclose(datfile);
  return dat_buf;
}

int main(int argc, char *argv[]) {
  // Build the inputs, starts with shared shape & rank.
  int64_t in_shape[] = {10000, 1, 28, 28};
  int64_t out_shape[] = {10000, 10};
  int64_t rank = 4;

  float *in_buf = read_tensor("dummy_64_fminist_in.dat", in_shape, rank);
  float *out_buf = read_tensor("dummy_64_fminist_out.dat", out_shape, 2);

  // Construct a list of omts as input.
  OMTensor *input = omTensorCreate(in_buf, in_shape, rank, ONNX_TYPE_FLOAT);
  OMTensor *list[] = {input};
  OMTensorList *inputL = omTensorListCreate(list, 1);

  // Compute outputs.
  uint64_t start_ns = getCurNs();
  OMTensorList *tensorListOut = run_main_graph(inputL);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f us\n", (float)(end_ns - start_ns)/1e3);

  // Get the first omt as output.
  printf("Verify output ---- \n");
  OMTensor *y = omTensorListGetOmtByIndex(tensorListOut, 0);
  float *outputPtr = (float *)omTensorGetDataPtr(y);
  for (int64_t e = 0; e < out_shape[0] * out_shape[1]; ++ e) {
    float diff = abs(outputPtr[e] - out_buf[e]);
    if (diff >= 1e-5)
      printf("pred: %f, y: %f, diff: %f\n", outputPtr[e], out_buf[e], diff);
  }
  printf(" ---- Complete\n");
  return 0;
}
