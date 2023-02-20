#map = affine_map<(d0) -> (-d0 + 728)>
#map1 = affine_map<(d0) -> (-d0 + 728, 256)>
#map2 = affine_map<(d0, d1) -> (d1 + d0)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d3 + d2)>
#map4 = affine_map<(d0) -> (-d0 + 10000)>
#map5 = affine_map<(d0) -> (-d0 + 10000, 32)>
#map6 = affine_map<(d0, d1) -> (-d1 + 728)>
#map7 = affine_map<(d0, d1) -> (-d1 + 728, 256)>
#map8 = affine_map<(d0) -> (d0)>
#map9 = affine_map<(d0) -> (d0 + 64)>
#map10 = affine_map<(d0) -> (d0 + 32, 10000)>
#map11 = affine_map<(d0, d1) -> (d1 - d0)>
#map12 = affine_map<(d0, d1, d2, d3, d4) -> (d4 - d3)>
#map13 = affine_map<(d0, d1, d2, d3, d4) -> (-d2 + 472)>
#map14 = affine_map<(d0, d1, d2, d3, d4) -> (-d2 + 728)>
#map15 = affine_map<(d0, d1, d2, d3, d4) -> (-d2 + 728, 256)>
#map16 = affine_map<(d0) -> (d0 + 1)>
#map17 = affine_map<(d0) -> (d0 + 2)>
#map18 = affine_map<(d0) -> (d0 + 3)>
#set = affine_set<(d0, d1, d2, d3, d4) : (1 >= 0, 1 >= 0, -d2 + 472 >= 0)>
#set1 = affine_set<(d0, d1, d2, d3, d4) : (1 >= 0)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  func.func @main_graph(%arg0: memref<10000x728xf32>, %arg1: memref<728x128xf32>) -> memref<10000x128xf32> attributes {input_names = ["X1", "X2"], llvm.emit_c_interface, output_names = ["Y"]} {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c10000 = arith.constant 10000 : index
    %c728 = arith.constant 728 : index
    %c128 = arith.constant 128 : index
    %alloc = memref.alloc() {alignment = 128 : i64} : memref<10000x128xf32>
    %c10000_1 = arith.constant 10000 : index
    %c128_2 = arith.constant 128 : index
    %c0_3 = arith.constant 0 : index
    affine.for %arg2 = 0 to 10000 {
      affine.for %arg3 = 0 to 128 {
        affine.store %cst, %alloc[%arg2, %arg3] : memref<10000x128xf32>
      }
    }
    %alloc_4 = memref.alloc() {alignment = 128 : i64} : memref<32x256xf32>
    %alloc_5 = memref.alloc() {alignment = 128 : i64} : memref<256x64xf32>
    affine.for %arg2 = 0 to 128 step 64 {
      affine.for %arg3 = 0 to 728 step 256 {
        %c256 = arith.constant 256 : index
        %c64 = arith.constant 64 : index
        %c728_6 = arith.constant 728 : index
        %c128_7 = arith.constant 128 : index
        %c1 = arith.constant 1 : index
        %c1_8 = arith.constant 1 : index
        %c0_9 = arith.constant 0 : index
        %0 = affine.apply #map(%arg3)
        %1 = affine.min #map1(%arg3)
        affine.for %arg4 = 0 to min #map1(%arg3) {
          affine.for %arg5 = 0 to 64 {
            %2 = affine.apply #map2(%arg3, %arg4)
            %3 = affine.apply #map3(%arg3, %arg4, %arg2, %arg5)
            %4 = affine.load %arg1[%2, %3] : memref<728x128xf32>
            affine.store %4, %alloc_5[%arg4, %arg5] : memref<256x64xf32>
          }
        }
        affine.for %arg4 = 0 to 10000 step 32 {
          %c32 = arith.constant 32 : index
          %c256_10 = arith.constant 256 : index
          %c10000_11 = arith.constant 10000 : index
          %c728_12 = arith.constant 728 : index
          %c1_13 = arith.constant 1 : index
          %c1_14 = arith.constant 1 : index
          %c0_15 = arith.constant 0 : index
          %2 = affine.apply #map4(%arg4)
          %3 = affine.min #map5(%arg4)
          %4 = affine.apply #map6(%arg4, %arg3)
          %5 = affine.min #map7(%arg4, %arg3)
          affine.for %arg5 = 0 to min #map5(%arg4) {
            affine.for %arg6 = 0 to min #map7(%arg4, %arg3) {
              %6 = affine.apply #map2(%arg4, %arg5)
              %7 = affine.apply #map3(%arg4, %arg5, %arg3, %arg6)
              %8 = affine.load %arg0[%6, %7] : memref<10000x728xf32>
              affine.store %8, %alloc_4[%arg5, %arg6] : memref<32x256xf32>
            }
          }
          affine.for %arg5 = #map8(%arg2) to #map9(%arg2) step 16 {
            affine.for %arg6 = #map8(%arg4) to min #map10(%arg4) step 4 {
              %c32_16 = arith.constant 32 : index
              %c256_17 = arith.constant 256 : index
              %c256_18 = arith.constant 256 : index
              %c64_19 = arith.constant 64 : index
              %c10000_20 = arith.constant 10000 : index
              %c128_21 = arith.constant 128 : index
              %c4 = arith.constant 4 : index
              %c16 = arith.constant 16 : index
              %c256_22 = arith.constant 256 : index
              %c10000_23 = arith.constant 10000 : index
              %c128_24 = arith.constant 128 : index
              %c728_25 = arith.constant 728 : index
              %c1_26 = arith.constant 1 : index
              %6 = affine.apply #map11(%arg4, %arg6)
              %c0_27 = arith.constant 0 : index
              %c0_28 = arith.constant 0 : index
              %7 = affine.apply #map12(%arg4, %arg6, %arg3, %arg2, %arg5)
              %c0_29 = arith.constant 0 : index
              %c0_30 = arith.constant 0 : index
              %c1_31 = arith.constant 1 : index
              %c1_32 = arith.constant 1 : index
              %c472 = arith.constant 472 : index
              %8 = affine.apply #map13(%arg4, %arg6, %arg3, %arg2, %arg5)
              %9 = affine.apply #map14(%arg4, %arg6, %arg3, %arg2, %arg5)
              %10 = affine.min #map15(%arg4, %arg6, %arg3, %arg2, %arg5)
              %c0_33 = arith.constant 0 : index
              affine.if #set(%arg4, %arg6, %arg3, %arg2, %arg5) {
                %alloca = memref.alloca() {alignment = 64 : i64} : memref<4xvector<16xf32>>
                %c0_34 = arith.constant 0 : index
                %c0_35 = arith.constant 0 : index
                %11 = arith.addi %c0, %arg6 : index
                %12 = arith.addi %c0_35, %arg5 : index
                %13 = vector.load %alloc[%11, %12] : memref<10000x128xf32>, vector<16xf32>
                affine.store %13, %alloca[%c0] : memref<4xvector<16xf32>>
                %14 = affine.apply #map16(%c0)
                %15 = arith.addi %14, %arg6 : index
                %16 = arith.addi %c0_35, %arg5 : index
                %17 = vector.load %alloc[%15, %16] : memref<10000x128xf32>, vector<16xf32>
                affine.store %17, %alloca[%14] : memref<4xvector<16xf32>>
                %18 = affine.apply #map17(%c0)
                %19 = arith.addi %18, %arg6 : index
                %20 = arith.addi %c0_35, %arg5 : index
                %21 = vector.load %alloc[%19, %20] : memref<10000x128xf32>, vector<16xf32>
                affine.store %21, %alloca[%18] : memref<4xvector<16xf32>>
                %22 = affine.apply #map18(%c0)
                %23 = arith.addi %22, %arg6 : index
                %24 = arith.addi %c0_35, %arg5 : index
                %25 = vector.load %alloc[%23, %24] : memref<10000x128xf32>, vector<16xf32>
                affine.store %25, %alloca[%22] : memref<4xvector<16xf32>>
                affine.for %arg7 = 0 to 256 step 4 {
                  %41 = arith.addi %c0, %6 : index
                  %42 = arith.addi %arg7, %c0_27 : index
                  %43 = memref.load %alloc_4[%41, %42] : memref<32x256xf32>
                  %44 = vector.broadcast %43 : f32 to vector<16xf32>
                  %45 = arith.addi %arg7, %c0_28 : index
                  %46 = arith.addi %c0_35, %7 : index
                  %47 = vector.load %alloc_5[%45, %46] : memref<256x64xf32>, vector<16xf32>
                  %48 = affine.load %alloca[%c0] : memref<4xvector<16xf32>>
                  %49 = vector.fma %44, %47, %48 : vector<16xf32>
                  affine.store %49, %alloca[%c0] : memref<4xvector<16xf32>>
                  %50 = affine.apply #map16(%arg7)
                  %51 = arith.addi %c0, %6 : index
                  %52 = arith.addi %50, %c0_27 : index
                  %53 = memref.load %alloc_4[%51, %52] : memref<32x256xf32>
                  %54 = vector.broadcast %53 : f32 to vector<16xf32>
                  %55 = arith.addi %50, %c0_28 : index
                  %56 = arith.addi %c0_35, %7 : index
                  %57 = vector.load %alloc_5[%55, %56] : memref<256x64xf32>, vector<16xf32>
                  %58 = affine.load %alloca[%c0] : memref<4xvector<16xf32>>
                  %59 = vector.fma %54, %57, %58 : vector<16xf32>
                  affine.store %59, %alloca[%c0] : memref<4xvector<16xf32>>
                  %60 = affine.apply #map17(%arg7)
                  %61 = arith.addi %c0, %6 : index
                  %62 = arith.addi %60, %c0_27 : index
                  %63 = memref.load %alloc_4[%61, %62] : memref<32x256xf32>
                  %64 = vector.broadcast %63 : f32 to vector<16xf32>
                  %65 = arith.addi %60, %c0_28 : index
                  %66 = arith.addi %c0_35, %7 : index
                  %67 = vector.load %alloc_5[%65, %66] : memref<256x64xf32>, vector<16xf32>
                  %68 = affine.load %alloca[%c0] : memref<4xvector<16xf32>>
                  %69 = vector.fma %64, %67, %68 : vector<16xf32>
                  affine.store %69, %alloca[%c0] : memref<4xvector<16xf32>>
                  %70 = affine.apply #map18(%arg7)
                  %71 = arith.addi %c0, %6 : index
                  %72 = arith.addi %70, %c0_27 : index
                  %73 = memref.load %alloc_4[%71, %72] : memref<32x256xf32>
                  %74 = vector.broadcast %73 : f32 to vector<16xf32>
                  %75 = arith.addi %70, %c0_28 : index
                  %76 = arith.addi %c0_35, %7 : index
                  %77 = vector.load %alloc_5[%75, %76] : memref<256x64xf32>, vector<16xf32>
                  %78 = affine.load %alloca[%c0] : memref<4xvector<16xf32>>
                  %79 = vector.fma %74, %77, %78 : vector<16xf32>
                  affine.store %79, %alloca[%c0] : memref<4xvector<16xf32>>
                  %80 = affine.apply #map16(%c0)
                  %81 = arith.addi %80, %6 : index
                  %82 = arith.addi %arg7, %c0_27 : index
                  %83 = memref.load %alloc_4[%81, %82] : memref<32x256xf32>
                  %84 = vector.broadcast %83 : f32 to vector<16xf32>
                  %85 = arith.addi %arg7, %c0_28 : index
                  %86 = arith.addi %c0_35, %7 : index
                  %87 = vector.load %alloc_5[%85, %86] : memref<256x64xf32>, vector<16xf32>
                  %88 = affine.load %alloca[%80] : memref<4xvector<16xf32>>
                  %89 = vector.fma %84, %87, %88 : vector<16xf32>
                  affine.store %89, %alloca[%80] : memref<4xvector<16xf32>>
                  %90 = affine.apply #map16(%arg7)
                  %91 = arith.addi %80, %6 : index
                  %92 = arith.addi %90, %c0_27 : index
                  %93 = memref.load %alloc_4[%91, %92] : memref<32x256xf32>
                  %94 = vector.broadcast %93 : f32 to vector<16xf32>
                  %95 = arith.addi %90, %c0_28 : index
                  %96 = arith.addi %c0_35, %7 : index
                  %97 = vector.load %alloc_5[%95, %96] : memref<256x64xf32>, vector<16xf32>
                  %98 = affine.load %alloca[%80] : memref<4xvector<16xf32>>
                  %99 = vector.fma %94, %97, %98 : vector<16xf32>
                  affine.store %99, %alloca[%80] : memref<4xvector<16xf32>>
                  %100 = affine.apply #map17(%arg7)
                  %101 = arith.addi %80, %6 : index
                  %102 = arith.addi %100, %c0_27 : index
                  %103 = memref.load %alloc_4[%101, %102] : memref<32x256xf32>
                  %104 = vector.broadcast %103 : f32 to vector<16xf32>
                  %105 = arith.addi %100, %c0_28 : index
                  %106 = arith.addi %c0_35, %7 : index
                  %107 = vector.load %alloc_5[%105, %106] : memref<256x64xf32>, vector<16xf32>
                  %108 = affine.load %alloca[%80] : memref<4xvector<16xf32>>
                  %109 = vector.fma %104, %107, %108 : vector<16xf32>
                  affine.store %109, %alloca[%80] : memref<4xvector<16xf32>>
                  %110 = affine.apply #map18(%arg7)
                  %111 = arith.addi %80, %6 : index
                  %112 = arith.addi %110, %c0_27 : index
                  %113 = memref.load %alloc_4[%111, %112] : memref<32x256xf32>
                  %114 = vector.broadcast %113 : f32 to vector<16xf32>
                  %115 = arith.addi %110, %c0_28 : index
                  %116 = arith.addi %c0_35, %7 : index
                  %117 = vector.load %alloc_5[%115, %116] : memref<256x64xf32>, vector<16xf32>
                  %118 = affine.load %alloca[%80] : memref<4xvector<16xf32>>
                  %119 = vector.fma %114, %117, %118 : vector<16xf32>
                  affine.store %119, %alloca[%80] : memref<4xvector<16xf32>>
                  %120 = affine.apply #map17(%c0)
                  %121 = arith.addi %120, %6 : index
                  %122 = arith.addi %arg7, %c0_27 : index
                  %123 = memref.load %alloc_4[%121, %122] : memref<32x256xf32>
                  %124 = vector.broadcast %123 : f32 to vector<16xf32>
                  %125 = arith.addi %arg7, %c0_28 : index
                  %126 = arith.addi %c0_35, %7 : index
                  %127 = vector.load %alloc_5[%125, %126] : memref<256x64xf32>, vector<16xf32>
                  %128 = affine.load %alloca[%120] : memref<4xvector<16xf32>>
                  %129 = vector.fma %124, %127, %128 : vector<16xf32>
                  affine.store %129, %alloca[%120] : memref<4xvector<16xf32>>
                  %130 = affine.apply #map16(%arg7)
                  %131 = arith.addi %120, %6 : index
                  %132 = arith.addi %130, %c0_27 : index
                  %133 = memref.load %alloc_4[%131, %132] : memref<32x256xf32>
                  %134 = vector.broadcast %133 : f32 to vector<16xf32>
                  %135 = arith.addi %130, %c0_28 : index
                  %136 = arith.addi %c0_35, %7 : index
                  %137 = vector.load %alloc_5[%135, %136] : memref<256x64xf32>, vector<16xf32>
                  %138 = affine.load %alloca[%120] : memref<4xvector<16xf32>>
                  %139 = vector.fma %134, %137, %138 : vector<16xf32>
                  affine.store %139, %alloca[%120] : memref<4xvector<16xf32>>
                  %140 = affine.apply #map17(%arg7)
                  %141 = arith.addi %120, %6 : index
                  %142 = arith.addi %140, %c0_27 : index
                  %143 = memref.load %alloc_4[%141, %142] : memref<32x256xf32>
                  %144 = vector.broadcast %143 : f32 to vector<16xf32>
                  %145 = arith.addi %140, %c0_28 : index
                  %146 = arith.addi %c0_35, %7 : index
                  %147 = vector.load %alloc_5[%145, %146] : memref<256x64xf32>, vector<16xf32>
                  %148 = affine.load %alloca[%120] : memref<4xvector<16xf32>>
                  %149 = vector.fma %144, %147, %148 : vector<16xf32>
                  affine.store %149, %alloca[%120] : memref<4xvector<16xf32>>
                  %150 = affine.apply #map18(%arg7)
                  %151 = arith.addi %120, %6 : index
                  %152 = arith.addi %150, %c0_27 : index
                  %153 = memref.load %alloc_4[%151, %152] : memref<32x256xf32>
                  %154 = vector.broadcast %153 : f32 to vector<16xf32>
                  %155 = arith.addi %150, %c0_28 : index
                  %156 = arith.addi %c0_35, %7 : index
                  %157 = vector.load %alloc_5[%155, %156] : memref<256x64xf32>, vector<16xf32>
                  %158 = affine.load %alloca[%120] : memref<4xvector<16xf32>>
                  %159 = vector.fma %154, %157, %158 : vector<16xf32>
                  affine.store %159, %alloca[%120] : memref<4xvector<16xf32>>
                  %160 = affine.apply #map18(%c0)
                  %161 = arith.addi %160, %6 : index
                  %162 = arith.addi %arg7, %c0_27 : index
                  %163 = memref.load %alloc_4[%161, %162] : memref<32x256xf32>
                  %164 = vector.broadcast %163 : f32 to vector<16xf32>
                  %165 = arith.addi %arg7, %c0_28 : index
                  %166 = arith.addi %c0_35, %7 : index
                  %167 = vector.load %alloc_5[%165, %166] : memref<256x64xf32>, vector<16xf32>
                  %168 = affine.load %alloca[%160] : memref<4xvector<16xf32>>
                  %169 = vector.fma %164, %167, %168 : vector<16xf32>
                  affine.store %169, %alloca[%160] : memref<4xvector<16xf32>>
                  %170 = affine.apply #map16(%arg7)
                  %171 = arith.addi %160, %6 : index
                  %172 = arith.addi %170, %c0_27 : index
                  %173 = memref.load %alloc_4[%171, %172] : memref<32x256xf32>
                  %174 = vector.broadcast %173 : f32 to vector<16xf32>
                  %175 = arith.addi %170, %c0_28 : index
                  %176 = arith.addi %c0_35, %7 : index
                  %177 = vector.load %alloc_5[%175, %176] : memref<256x64xf32>, vector<16xf32>
                  %178 = affine.load %alloca[%160] : memref<4xvector<16xf32>>
                  %179 = vector.fma %174, %177, %178 : vector<16xf32>
                  affine.store %179, %alloca[%160] : memref<4xvector<16xf32>>
                  %180 = affine.apply #map17(%arg7)
                  %181 = arith.addi %160, %6 : index
                  %182 = arith.addi %180, %c0_27 : index
                  %183 = memref.load %alloc_4[%181, %182] : memref<32x256xf32>
                  %184 = vector.broadcast %183 : f32 to vector<16xf32>
                  %185 = arith.addi %180, %c0_28 : index
                  %186 = arith.addi %c0_35, %7 : index
                  %187 = vector.load %alloc_5[%185, %186] : memref<256x64xf32>, vector<16xf32>
                  %188 = affine.load %alloca[%160] : memref<4xvector<16xf32>>
                  %189 = vector.fma %184, %187, %188 : vector<16xf32>
                  affine.store %189, %alloca[%160] : memref<4xvector<16xf32>>
                  %190 = affine.apply #map18(%arg7)
                  %191 = arith.addi %160, %6 : index
                  %192 = arith.addi %190, %c0_27 : index
                  %193 = memref.load %alloc_4[%191, %192] : memref<32x256xf32>
                  %194 = vector.broadcast %193 : f32 to vector<16xf32>
                  %195 = arith.addi %190, %c0_28 : index
                  %196 = arith.addi %c0_35, %7 : index
                  %197 = vector.load %alloc_5[%195, %196] : memref<256x64xf32>, vector<16xf32>
                  %198 = affine.load %alloca[%160] : memref<4xvector<16xf32>>
                  %199 = vector.fma %194, %197, %198 : vector<16xf32>
                  affine.store %199, %alloca[%160] : memref<4xvector<16xf32>>
                }
                %26 = affine.load %alloca[%c0] : memref<4xvector<16xf32>>
                %27 = arith.addi %c0, %arg6 : index
                %28 = arith.addi %c0_35, %arg5 : index
                vector.store %26, %alloc[%27, %28] : memref<10000x128xf32>, vector<16xf32>
                %29 = affine.apply #map16(%c0)
                %30 = affine.load %alloca[%29] : memref<4xvector<16xf32>>
                %31 = arith.addi %29, %arg6 : index
                %32 = arith.addi %c0_35, %arg5 : index
                vector.store %30, %alloc[%31, %32] : memref<10000x128xf32>, vector<16xf32>
                %33 = affine.apply #map17(%c0)
                %34 = affine.load %alloca[%33] : memref<4xvector<16xf32>>
                %35 = arith.addi %33, %arg6 : index
                %36 = arith.addi %c0_35, %arg5 : index
                vector.store %34, %alloc[%35, %36] : memref<10000x128xf32>, vector<16xf32>
                %37 = affine.apply #map18(%c0)
                %38 = affine.load %alloca[%37] : memref<4xvector<16xf32>>
                %39 = arith.addi %37, %arg6 : index
                %40 = arith.addi %c0_35, %arg5 : index
                vector.store %38, %alloc[%39, %40] : memref<10000x128xf32>, vector<16xf32>
              } else {
                affine.if #set1(%arg4, %arg6, %arg3, %arg2, %arg5) {
                  %alloca = memref.alloca() {alignment = 64 : i64} : memref<1xvector<16xf32>>
                  %c0_34 = arith.constant 0 : index
                  %c0_35 = arith.constant 0 : index
                  affine.for %arg7 = 0 to 4 {
                    %11 = arith.addi %arg7, %arg6 : index
                    %12 = arith.addi %c0_35, %arg5 : index
                    %13 = vector.load %alloc[%11, %12] : memref<10000x128xf32>, vector<16xf32>
                    affine.store %13, %alloca[%c0_34] : memref<1xvector<16xf32>>
                    affine.for %arg8 = 0 to min #map15(%arg4, %arg6, %arg3, %arg2, %arg5) {
                      %17 = arith.addi %arg7, %6 : index
                      %18 = arith.addi %arg8, %c0_27 : index
                      %19 = memref.load %alloc_4[%17, %18] : memref<32x256xf32>
                      %20 = vector.broadcast %19 : f32 to vector<16xf32>
                      %21 = arith.addi %arg8, %c0_28 : index
                      %22 = arith.addi %c0_35, %7 : index
                      %23 = vector.load %alloc_5[%21, %22] : memref<256x64xf32>, vector<16xf32>
                      %24 = affine.load %alloca[%c0_34] : memref<1xvector<16xf32>>
                      %25 = vector.fma %20, %23, %24 : vector<16xf32>
                      affine.store %25, %alloca[%c0_34] : memref<1xvector<16xf32>>
                    }
                    %14 = affine.load %alloca[%c0_34] : memref<1xvector<16xf32>>
                    %15 = arith.addi %arg7, %arg6 : index
                    %16 = arith.addi %c0_35, %arg5 : index
                    vector.store %14, %alloc[%15, %16] : memref<10000x128xf32>, vector<16xf32>
                  }
                } else {
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
