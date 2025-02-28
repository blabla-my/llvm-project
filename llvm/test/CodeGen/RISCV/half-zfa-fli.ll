; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -target-abi ilp32f -mattr=+experimental-zfa,+zfh < %s \
; RUN:     | FileCheck %s
; RUN: llc -mtriple=riscv64 -target-abi lp64f -mattr=+experimental-zfa,+zfh < %s \
; RUN:     | FileCheck %s
; RUN: llc -mtriple=riscv32 -target-abi ilp32f -mattr=+experimental-zfa,+zfhmin < %s \
; RUN:     | FileCheck %s --check-prefix=ZFHMIN
; RUN: llc -mtriple=riscv64 -target-abi lp64f -mattr=+experimental-zfa,+zfhmin < %s \
; RUN:     | FileCheck %s --check-prefix=ZFHMIN

define half @loadfpimm1() {
; CHECK-LABEL: loadfpimm1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, 6.250000e-02
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm1:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI0_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI0_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 0.0625
}

define half @loadfpimm2() {
; CHECK-LABEL: loadfpimm2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, 7.500000e-01
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm2:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI1_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI1_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 0.75
}

define half @loadfpimm3() {
; CHECK-LABEL: loadfpimm3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, 1.250000e+00
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm3:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI2_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI2_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 1.25
}

define half @loadfpimm4() {
; CHECK-LABEL: loadfpimm4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, 3.000000e+00
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm4:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI3_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI3_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 3.0
}

define half @loadfpimm5() {
; CHECK-LABEL: loadfpimm5:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, 2.560000e+02
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm5:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI4_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI4_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 256.0
}

define half @loadfpimm6() {
; CHECK-LABEL: loadfpimm6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, inf
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm6:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI5_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI5_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 0xH7C00
}

define half @loadfpimm7() {
; CHECK-LABEL: loadfpimm7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, nan
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm7:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI6_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI6_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 0xH7E00
}

define half @loadfpimm8() {
; CHECK-LABEL: loadfpimm8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fli.h fa0, min
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm8:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    li a0, 1024
; ZFHMIN-NEXT:    fmv.h.x fa0, a0
; ZFHMIN-NEXT:    ret
  ret half 0xH0400
}

define half @loadfpimm9() {
; CHECK-LABEL: loadfpimm9:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a0, %hi(.LCPI8_0)
; CHECK-NEXT:    flh fa0, %lo(.LCPI8_0)(a0)
; CHECK-NEXT:    ret
;
; ZFHMIN-LABEL: loadfpimm9:
; ZFHMIN:       # %bb.0:
; ZFHMIN-NEXT:    lui a0, %hi(.LCPI8_0)
; ZFHMIN-NEXT:    flh fa0, %lo(.LCPI8_0)(a0)
; ZFHMIN-NEXT:    ret
  ret half 255.0
}
