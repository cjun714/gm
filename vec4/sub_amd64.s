#include "textflag.h"

// func subSIMD(lhs, rhs *Vec4)
TEXT ·subSIMD(SB),NOSPLIT,$0
  // load pointers into registers
  MOVQ    lhs+0(FP), R8
  MOVQ    rhs+8(FP), R9

  // move unaligned vectors into SEE registers
  MOVUPS  (R8), X0
  MOVUPS  (R9), X1

  // substract vector elements
  SUBPS   X1, X0

  // save result back into first vector
  MOVUPS  X0, (R8)
  RET
