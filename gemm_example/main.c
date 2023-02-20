#include <OnnxMlirRuntime.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>

static inline uint64_t getCurNs() {
  struct timespec ts;
  clock_gettime(CLOCK_REALTIME, &ts);
  uint64_t t = ts.tv_sec*1000*1000*1000 + ts.tv_nsec;
  return t;
}

OMTensorList *run_main_graph(OMTensorList *);

int main() {
  // Shared shape & rank.
  int64_t A_shape[] = {10000, 728};
  int64_t B_shape[] = {728, 128};
  int64_t rank = 2;
  // Construct x1 omt filled with 1.
  float *A_Data = (float *) malloc(sizeof(float) * 10000 * 728);
  for (int i = 0; i < 10000 * 728; ++ i)
    A_Data[i] = 1.f;
  OMTensor *x1 = omTensorCreate(A_Data, A_shape, rank, ONNX_TYPE_FLOAT);

  // Construct x2 omt filled with 2.
  float *B_Data = (float *) malloc(sizeof(float) * 728 * 128);
  for (int i = 0; i < 728 * 128; ++ i)
    B_Data[i] = 1.f;
  OMTensor *x2 = omTensorCreate(B_Data, B_shape, rank, ONNX_TYPE_FLOAT);

  // Construct a list of omts as input.
  OMTensor *list[2] = {x1, x2};
  OMTensorList *input = omTensorListCreate(list, 2);
  // Call the compiled onnx model function.
  uint64_t start_ns = getCurNs();
  OMTensorList *outputList = run_main_graph(input);
  uint64_t end_ns = getCurNs();
  printf("Exec time %.6f us\n", (float)(end_ns - start_ns)/1e3);
  // Get the first omt as output.
  OMTensor *y = omTensorListGetOmtByIndex(outputList, 0);

  float *outputPtr = (float *) omTensorGetDataPtr(y);
  // Print its content, should be all 3.
  printf("%f \n", outputPtr[0]);
  // for (int i = 0; i < 6; i++)
    // printf("%f ", outputPtr[i]);
  // printf("\n");
  return 0;
}
