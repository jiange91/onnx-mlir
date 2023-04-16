#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <pthread.h>
#include "tensor.h"

#define M 64512
#define K 512
#define N 512

DECL_TENSOR(float, 2);
DEF_TENSOR_UTILS(float)

const static int64_t strides2[2] = {N, 1};
static inline float *pin2(float *buf, int64_t a, int64_t b) {
  return buf + a * strides2[0] + b;
}

struct T_pack {
  Tensor_float_2 *C;
  Tensor_float_2 *A;
  Tensor_float_2 *B;
};

extern "C" void _mlir_ciface_main_graph(Tensor_float_2 *C, Tensor_float_2 *A, Tensor_float_2 *B);

void * _mlir_ciface_main_graph(void * data) {
  T_pack *p = (T_pack *) data;
  _mlir_ciface_main_graph(p->C, p->A, p->B);
  return NULL;
}

const int num_thread = 8;

int main () {
  float *bufA[num_thread];
  float *bufB;

  int64_t shapeA[] = {M, K};
  int64_t shapeB[] = {K, N};

  for (int i = 0; i < num_thread; ++ i) {
    bufA[i] = read_tensor_float("/users/Zijian/onnx-mlir/pl-app/ops/gemm/A.dat", shapeA, 2);
  }
  bufB = read_tensor_float("/users/Zijian/onnx-mlir/pl-app/ops/gemm/B.dat", shapeB, 2);

  Tensor_float_2 A[num_thread];
  Tensor_float_2 C[num_thread];
  Tensor_float_2 B = make_tensor_float_2(bufB, shapeB);
  T_pack p[num_thread];

  for (int i = 0; i < num_thread; ++ i) {
    A[i] = make_tensor_float_2(bufA[i], shapeA);
    p[i].A = A + i;
    p[i].B = &B;
    p[i].C = C + i;
  }


  int64_t shapeC[] = {M, N};
  // float *C_truth = read_tensor_float("/users/Zijian/new_runtime/cpy_new_rt/apps/bench-matmul-new/C.dat", shapeC, 2);

  pthread_t t[num_thread];
  uint64_t start = microtime();
  for (int i = 0; i < num_thread; ++ i) {
    pthread_create(t+i, NULL, _mlir_ciface_main_graph, p+i);
  }
  for (int i = 0; i < num_thread; ++ i) {
    pthread_join(t[i], NULL);
  }
  uint64_t end = microtime();
  printf("time: %.5f s\n", (float)(end-start)/1e6);

  for (int i = 0; i < 2; ++ i)
    printf("%ld\n", p[0].C->shapes[i]);
  return 0;
}
