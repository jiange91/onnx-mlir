#include <errno.h>
#include <iostream>

#include <OnnxMlirRuntime.h>
#include <utils.h>

extern "C" OMTensorList *run_main_graph(OMTensorList *);

int main(int argc, char *argv[]) {
  int64_t rank = 2;
  int64_t X_shape[] = {4, 2};
  StridedMemRefType<float, 2> X(X_shape);
  DynamicMemRefType<float> dX(X);
  read_tensor("dummy_in.dat", dX);

  int64_t Y_shape[] = {4, 3};
  StridedMemRefType<float, 2> Y(Y_shape);
  DynamicMemRefType<float> dY(Y);
  read_tensor("dummy_out.dat", dY);

  OMTensor *x = omTensorCreate(X.data, X_shape, rank, ONNX_TYPE_FLOAT);

  // Construct a list of omts as input.
  OMTensor *list[1] = {x};
  OMTensorList *input = omTensorListCreate(list, 1);

  // Call the compiled onnx model function.
  OMTensorList *outputList = run_main_graph(input);
  
  // Get the first omt as output.
  OMTensor *y = omTensorListGetOmtByIndex(outputList, 0);
  omTensorPrint("Result tensor: ", y);
  std::cout << "Ground Truth: " << std::endl;
  print_tensor(dY);
  return 0;
}
