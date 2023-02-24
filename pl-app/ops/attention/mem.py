import torch
from torch import nn

torch.set_num_threads(1)
encoder_layer = nn.TransformerEncoderLayer(d_model=512, nhead=2)
x = torch.rand(7 * 24 * 6, 64, 512)

print(encoder_layer)

y = encoder_layer(x)
y.size()
