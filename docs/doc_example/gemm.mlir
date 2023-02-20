#map = affine_map<(d0) -> (-d0 + 728, 256)>
#map1 = affine_map<(d0) -> (-d0 + 10000, 32)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> (d0 + 64)>
#map4 = affine_map<(d0) -> (d0 + 32, 10000)>
#map5 = affine_map<(d0, d1) -> (-d0 + d1)>
#map6 = affine_map<(d0) -> (d0 + 1)>
#map7 = affine_map<(d0) -> (d0 + 2)>
#map8 = affine_map<(d0) -> (d0 + 3)>
#set = affine_set<(d0) : (1 >= 0, 1 >= 0, -d0 + 472 >= 0)>
#set1 = affine_set<() : (1 >= 0)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func.func @main_graph(%arg0: memref<10000x728xf32>, %arg1: memref<728x128xf32>) -> memref<10000x128xf32> attributes {input_names = ["X1", "X2"], llvm.emit_c_interface, output_names = ["Y"]} {
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<10000x128xf32>
    affine.for %arg2 = 0 to 10000 {
      affine.for %arg3 = 0 to 128 {
        affine.store %cst, %alloc[%arg2, %arg3] : memref<10000x128xf32>
      }
    }
    %alloc_0 = memref.alloc() {alignment = 128 : i64} : memref<32x256xf32>
    %alloc_1 = memref.alloc() {alignment = 128 : i64} : memref<256x64xf32>
    affine.for %arg2 = 0 to 128 step 64 {
      affine.for %arg3 = 0 to 728 step 256 {
        affine.for %arg4 = 0 to min #map(%arg3) {
          affine.for %arg5 = 0 to 64 {
            %0 = affine.load %arg1[%arg3 + %arg4, %arg2 + %arg5] : memref<728x128xf32>
            affine.store %0, %alloc_1[%arg4, %arg5] : memref<256x64xf32>
          }
        }
        affine.for %arg4 = 0 to 10000 step 32 {
          affine.for %arg5 = 0 to min #map1(%arg4) {
            affine.for %arg6 = 0 to min #map(%arg3) {
              %0 = affine.load %arg0[%arg4 + %arg5, %arg3 + %arg6] : memref<10000x728xf32>
              affine.store %0, %alloc_0[%arg5, %arg6] : memref<32x256xf32>
            }
          }
          affine.for %arg5 = #map2(%arg2) to #map3(%arg2) step 16 {
            affine.for %arg6 = #map2(%arg4) to min #map4(%arg4) step 4 {
              %0 = affine.apply #map5(%arg4, %arg6)
              %1 = affine.apply #map5(%arg2, %arg5)
              affine.if #set(%arg3) {
                %alloca = memref.alloca() {alignment = 64 : i64} : memref<4xvector<16xf32>>
                %2 = vector.load %alloc[%arg6, %arg5] : memref<10000x128xf32>, vector<16xf32>
                affine.store %2, %alloca[0] : memref<4xvector<16xf32>>
                %3 = arith.addi %arg6, %c1 : index
                %4 = vector.load %alloc[%3, %arg5] : memref<10000x128xf32>, vector<16xf32>
                affine.store %4, %alloca[1] : memref<4xvector<16xf32>>
                %5 = arith.addi %arg6, %c2 : index
                %6 = vector.load %alloc[%5, %arg5] : memref<10000x128xf32>, vector<16xf32>
                affine.store %6, %alloca[2] : memref<4xvector<16xf32>>
                %7 = arith.addi %arg6, %c3 : index
                %8 = vector.load %alloc[%7, %arg5] : memref<10000x128xf32>, vector<16xf32>
                affine.store %8, %alloca[3] : memref<4xvector<16xf32>>
                affine.for %arg7 = 0 to 256 step 4 {
                  %13 = memref.load %alloc_0[%0, %arg7] : memref<32x256xf32>
                  %14 = vector.broadcast %13 : f32 to vector<16xf32>
                  %15 = vector.load %alloc_1[%arg7, %1] : memref<256x64xf32>, vector<16xf32>
                  %16 = affine.load %alloca[0] : memref<4xvector<16xf32>>
                  %17 = vector.fma %14, %15, %16 : vector<16xf32>
                  affine.store %17, %alloca[0] : memref<4xvector<16xf32>>
                  %18 = affine.apply #map6(%arg7)
                  %19 = memref.load %alloc_0[%0, %18] : memref<32x256xf32>
                  %20 = vector.broadcast %19 : f32 to vector<16xf32>
                  %21 = vector.load %alloc_1[%18, %1] : memref<256x64xf32>, vector<16xf32>
                  %22 = affine.load %alloca[0] : memref<4xvector<16xf32>>
                  %23 = vector.fma %20, %21, %22 : vector<16xf32>
                  affine.store %23, %alloca[0] : memref<4xvector<16xf32>>
                  %24 = affine.apply #map7(%arg7)
                  %25 = memref.load %alloc_0[%0, %24] : memref<32x256xf32>
                  %26 = vector.broadcast %25 : f32 to vector<16xf32>
                  %27 = vector.load %alloc_1[%24, %1] : memref<256x64xf32>, vector<16xf32>
                  %28 = affine.load %alloca[0] : memref<4xvector<16xf32>>
                  %29 = vector.fma %26, %27, %28 : vector<16xf32>
                  affine.store %29, %alloca[0] : memref<4xvector<16xf32>>
                  %30 = affine.apply #map8(%arg7)
                  %31 = memref.load %alloc_0[%0, %30] : memref<32x256xf32>
                  %32 = vector.broadcast %31 : f32 to vector<16xf32>
                  %33 = vector.load %alloc_1[%30, %1] : memref<256x64xf32>, vector<16xf32>
                  %34 = affine.load %alloca[0] : memref<4xvector<16xf32>>
                  %35 = vector.fma %32, %33, %34 : vector<16xf32>
                  affine.store %35, %alloca[0] : memref<4xvector<16xf32>>
                  %36 = arith.addi %0, %c1 : index
                  %37 = memref.load %alloc_0[%36, %arg7] : memref<32x256xf32>
                  %38 = vector.broadcast %37 : f32 to vector<16xf32>
                  %39 = vector.load %alloc_1[%arg7, %1] : memref<256x64xf32>, vector<16xf32>
                  %40 = affine.load %alloca[1] : memref<4xvector<16xf32>>
                  %41 = vector.fma %38, %39, %40 : vector<16xf32>
                  affine.store %41, %alloca[1] : memref<4xvector<16xf32>>
                  %42 = memref.load %alloc_0[%36, %18] : memref<32x256xf32>
                  %43 = vector.broadcast %42 : f32 to vector<16xf32>
                  %44 = vector.load %alloc_1[%18, %1] : memref<256x64xf32>, vector<16xf32>
                  %45 = affine.load %alloca[1] : memref<4xvector<16xf32>>
                  %46 = vector.fma %43, %44, %45 : vector<16xf32>
                  affine.store %46, %alloca[1] : memref<4xvector<16xf32>>
                  %47 = memref.load %alloc_0[%36, %24] : memref<32x256xf32>
                  %48 = vector.broadcast %47 : f32 to vector<16xf32>
                  %49 = vector.load %alloc_1[%24, %1] : memref<256x64xf32>, vector<16xf32>
                  %50 = affine.load %alloca[1] : memref<4xvector<16xf32>>
                  %51 = vector.fma %48, %49, %50 : vector<16xf32>
                  affine.store %51, %alloca[1] : memref<4xvector<16xf32>>
                  %52 = memref.load %alloc_0[%36, %30] : memref<32x256xf32>
                  %53 = vector.broadcast %52 : f32 to vector<16xf32>
                  %54 = vector.load %alloc_1[%30, %1] : memref<256x64xf32>, vector<16xf32>
                  %55 = affine.load %alloca[1] : memref<4xvector<16xf32>>
                  %56 = vector.fma %53, %54, %55 : vector<16xf32>
                  affine.store %56, %alloca[1] : memref<4xvector<16xf32>>
                  %57 = arith.addi %0, %c2 : index
                  %58 = memref.load %alloc_0[%57, %arg7] : memref<32x256xf32>
                  %59 = vector.broadcast %58 : f32 to vector<16xf32>
                  %60 = vector.load %alloc_1[%arg7, %1] : memref<256x64xf32>, vector<16xf32>
                  %61 = affine.load %alloca[2] : memref<4xvector<16xf32>>
                  %62 = vector.fma %59, %60, %61 : vector<16xf32>
                  affine.store %62, %alloca[2] : memref<4xvector<16xf32>>
                  %63 = memref.load %alloc_0[%57, %18] : memref<32x256xf32>
                  %64 = vector.broadcast %63 : f32 to vector<16xf32>
                  %65 = vector.load %alloc_1[%18, %1] : memref<256x64xf32>, vector<16xf32>
                  %66 = affine.load %alloca[2] : memref<4xvector<16xf32>>
                  %67 = vector.fma %64, %65, %66 : vector<16xf32>
                  affine.store %67, %alloca[2] : memref<4xvector<16xf32>>
                  %68 = memref.load %alloc_0[%57, %24] : memref<32x256xf32>
                  %69 = vector.broadcast %68 : f32 to vector<16xf32>
                  %70 = vector.load %alloc_1[%24, %1] : memref<256x64xf32>, vector<16xf32>
                  %71 = affine.load %alloca[2] : memref<4xvector<16xf32>>
                  %72 = vector.fma %69, %70, %71 : vector<16xf32>
                  affine.store %72, %alloca[2] : memref<4xvector<16xf32>>
                  %73 = memref.load %alloc_0[%57, %30] : memref<32x256xf32>
                  %74 = vector.broadcast %73 : f32 to vector<16xf32>
                  %75 = vector.load %alloc_1[%30, %1] : memref<256x64xf32>, vector<16xf32>
                  %76 = affine.load %alloca[2] : memref<4xvector<16xf32>>
                  %77 = vector.fma %74, %75, %76 : vector<16xf32>
                  affine.store %77, %alloca[2] : memref<4xvector<16xf32>>
                  %78 = arith.addi %0, %c3 : index
                  %79 = memref.load %alloc_0[%78, %arg7] : memref<32x256xf32>
                  %80 = vector.broadcast %79 : f32 to vector<16xf32>
                  %81 = vector.load %alloc_1[%arg7, %1] : memref<256x64xf32>, vector<16xf32>
                  %82 = affine.load %alloca[3] : memref<4xvector<16xf32>>
                  %83 = vector.fma %80, %81, %82 : vector<16xf32>
                  affine.store %83, %alloca[3] : memref<4xvector<16xf32>>
                  %84 = memref.load %alloc_0[%78, %18] : memref<32x256xf32>
                  %85 = vector.broadcast %84 : f32 to vector<16xf32>
                  %86 = vector.load %alloc_1[%18, %1] : memref<256x64xf32>, vector<16xf32>
                  %87 = affine.load %alloca[3] : memref<4xvector<16xf32>>
                  %88 = vector.fma %85, %86, %87 : vector<16xf32>
                  affine.store %88, %alloca[3] : memref<4xvector<16xf32>>
                  %89 = memref.load %alloc_0[%78, %24] : memref<32x256xf32>
                  %90 = vector.broadcast %89 : f32 to vector<16xf32>
                  %91 = vector.load %alloc_1[%24, %1] : memref<256x64xf32>, vector<16xf32>
                  %92 = affine.load %alloca[3] : memref<4xvector<16xf32>>
                  %93 = vector.fma %90, %91, %92 : vector<16xf32>
                  affine.store %93, %alloca[3] : memref<4xvector<16xf32>>
                  %94 = memref.load %alloc_0[%78, %30] : memref<32x256xf32>
                  %95 = vector.broadcast %94 : f32 to vector<16xf32>
                  %96 = vector.load %alloc_1[%30, %1] : memref<256x64xf32>, vector<16xf32>
                  %97 = affine.load %alloca[3] : memref<4xvector<16xf32>>
                  %98 = vector.fma %95, %96, %97 : vector<16xf32>
                  affine.store %98, %alloca[3] : memref<4xvector<16xf32>>
                }
                %9 = affine.load %alloca[0] : memref<4xvector<16xf32>>
                vector.store %9, %alloc[%arg6, %arg5] : memref<10000x128xf32>, vector<16xf32>
                %10 = affine.load %alloca[1] : memref<4xvector<16xf32>>
                vector.store %10, %alloc[%3, %arg5] : memref<10000x128xf32>, vector<16xf32>
                %11 = affine.load %alloca[2] : memref<4xvector<16xf32>>
                vector.store %11, %alloc[%5, %arg5] : memref<10000x128xf32>, vector<16xf32>
                %12 = affine.load %alloca[3] : memref<4xvector<16xf32>>
                vector.store %12, %alloc[%7, %arg5] : memref<10000x128xf32>, vector<16xf32>
              } else {
                affine.if #set1() {
                  %alloca = memref.alloca() {alignment = 64 : i64} : memref<1xvector<16xf32>>
                  affine.for %arg7 = 0 to 4 {
                    %2 = arith.addi %arg7, %arg6 : index
                    %3 = vector.load %alloc[%2, %arg5] : memref<10000x128xf32>, vector<16xf32>
                    affine.store %3, %alloca[0] : memref<1xvector<16xf32>>
                    affine.for %arg8 = 0 to min #map(%arg3) {
                      %5 = arith.addi %arg7, %0 : index
                      %6 = memref.load %alloc_0[%5, %arg8] : memref<32x256xf32>
                      %7 = vector.broadcast %6 : f32 to vector<16xf32>
                      %8 = vector.load %alloc_1[%arg8, %1] : memref<256x64xf32>, vector<16xf32>
                      %9 = affine.load %alloca[0] : memref<1xvector<16xf32>>
                      %10 = vector.fma %7, %8, %9 : vector<16xf32>
                      affine.store %10, %alloca[0] : memref<1xvector<16xf32>>
                    }
                    %4 = affine.load %alloca[0] : memref<1xvector<16xf32>>
                    vector.store %4, %alloc[%2, %arg5] : memref<10000x128xf32>, vector<16xf32>
                  }
                }
              }
            }
          }
        }
      }
    }
    return %alloc : memref<10000x128xf32>
  }
  "krnl.entry_point"() {func = @main_graph, numInputs = 2 : i32, numOutputs = 1 : i32, signature = "[    { \22type\22 : \22f32\22 , \22dims\22 : [10000 , 728] , \22name\22 : \22X1\22 }\0A ,    { \22type\22 : \22f32\22 , \22dims\22 : [728 , 128] , \22name\22 : \22X2\22 }\0A\0A]\00@[   { \22type\22 : \22f32\22 , \22dims\22 : [10000 , 128] , \22name\22 : \22Y\22 }\0A\0A]\00"} : () -> ()
}

