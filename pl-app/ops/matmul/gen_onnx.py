import onnx
from onnx import helper
from onnx import AttributeProto, TensorProto, GraphProto

# Create one input (ValueInfoProto)
X1 = helper.make_tensor_value_info('X1', TensorProto.FLOAT, [64, 12, 1, 257])
X2 = helper.make_tensor_value_info('X2', TensorProto.FLOAT, [64, 12, 257, 64])

# Create one output (ValueInfoProto)
Y = helper.make_tensor_value_info('Y', TensorProto.FLOAT, [64, 12, 1, 64])

# Create a node (NodeProto) - This is based on Pad-11
node_def = helper.make_node(
  'MatMul', # node name
  ['X1', 'X2'], # inputs
  ['Y'], # outputs
)

# Create the graph (GraphProto)
graph_def = helper.make_graph(
  [node_def],
  'test-model',
  [X1, X2],
  [Y],
)

# Create the model (ModelProto)
model_def = helper.make_model(graph_def, producer_name='onnx-example')

print('The model is:\n{}'.format(model_def))
onnx.checker.check_model(model_def)
onnx.save(model_def, "matmul.onnx")
print('The model is checked!')
