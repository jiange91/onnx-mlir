import numpy as np

np.random.seed(2333)

ashape = [64, 1, 768]
bshape = [768, 50264]

A = np.random.randn(*ashape).astype('f')
B = np.random.randn(*bshape).astype('f')

C = A @ B

def save_to(p, x):
    print(x.dtype, x.shape)
    with open(p, 'wb') as f:
        x.tofile(f)

save_to("A.dat", A)
save_to("B.dat", B)
save_to("C.dat", C)
