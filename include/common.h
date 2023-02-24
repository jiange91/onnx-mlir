#include <stdint.h>
#include <time.h>
#include <stdlib.h>

static inline uint64_t getCurNs() {
  struct timespec ts;
  clock_gettime(CLOCK_REALTIME, &ts);
  uint64_t t = ts.tv_sec*1000*1000*1000 + ts.tv_nsec;
  return t;
}

#define DEF_TENSOR(r) \
typedef struct { \
  float *_alloc_ptr; \
  float *_aligned_ptr; \
  int64_t offset; \
  int64_t shapes[r]; \
  int64_t strides[r]; \
} Tensor_R##r

#define MAKE_TENSOR(t, data, shape, r) \
  Tensor_R##r _T_##t; \
  do { \
    _T_##t._alloc_ptr = data; \
    _T_##t._aligned_ptr = data; \
    _T_##t.offset = 0; \
    for (int i = r-1; i >= 0; -- i) { \
      _T_##t.shapes[i] = shape[i]; \
      if (i == (r-1)) \
        _T_##t.strides[i] = 1; \
      else \
        _T_##t.strides[i] = shape[i+1] * _T_##t.strides[i+1];  \
    } \
  } while (0)

float *dummy_tensor(int64_t shape[], int rank) {
  size_t num_ele = 1;
  for (int i = 0; i < rank; ++ i)
    num_ele *= shape[i];

  float *dat_buf = (float *) aligned_alloc(4096, sizeof(float) * num_ele);
  for (int64_t e = 0; e < num_ele; ++ e) {
    dat_buf[e] = 1.0f;
  }
  return dat_buf;
}
