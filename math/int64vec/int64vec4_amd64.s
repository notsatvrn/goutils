TEXT ·addAVX2(SB), $0-24
	MOVQ a+0(FP), AX
	MOVQ b+8(FP), BX
	MOVQ result+16(FP), CX
	VMOVDQA 0(AX), Y0
	VMOVDQA 0(BX), Y1
	VPADDQ Y1, Y0, Y2
	VMOVDQA Y2, 0(CX)
	RET

TEXT ·addSSE2(SB), $0-24
	MOVQ a+0(FP), AX
	MOVQ b+8(FP), BX
	MOVQ result+16(FP), CX
	MOVO 0(AX), X0
	MOVO 16(AX), X1
	MOVO 0(BX), X2
	MOVO 16(BX), X3
	PADDQ X2, X0
	PADDQ X3, X1
	MOVO X0, 0(CX)
	MOVO X1, 16(CX)
	RET

TEXT ·subAVX2(SB), $0-24
	MOVQ a+0(FP), AX
	MOVQ b+8(FP), BX
	MOVQ result+16(FP), CX
	VMOVDQA 0(AX), Y0
	VMOVDQA 0(BX), Y1
	VPSUBQ Y1, Y0, Y2
	VMOVDQA Y2, 0(CX)
	RET

TEXT ·subSSE2(SB), $0-24
	MOVQ a+0(FP), AX
	MOVQ b+8(FP), BX
	MOVQ result+16(FP), CX
	MOVO 0(AX), X0
	MOVO 16(AX), X1
	MOVO 0(BX), X2
	MOVO 16(BX), X3
	PSUBQ X2, X0
	PSUBQ X3, X1
	MOVO X0, 0(CX)
	MOVO X1, 16(CX)
	RET

TEXT ·mulAVX512DQ_VL(SB), $0-24
	MOVQ a+0(FP), AX
	MOVQ b+8(FP), BX
	MOVQ result+16(FP), CX
	VMOVDQA 0(AX), Y0
	VMOVDQA 0(BX), Y1
	VPMULLQ Y1, Y0, Y2
	VMOVDQA Y2, 0(CX)
	RET

TEXT ·minAVX512F_VL(SB), $0-24
	MOVQ v+0(FP), AX
	MOVQ mn+8(FP), BX
	MOVQ result+16(FP), CX
	VMOVDQA 0(AX), Y0
	VMOVDQA 0(BX), Y1
	VPMINSQ Y0, Y1, Y2
	VMOVDQA Y2, 0(CX)
	RET

TEXT ·maxAVX512F_VL(SB), $0-24
	MOVQ v+0(FP), AX
	MOVQ mx+8(FP), BX
	MOVQ result+16(FP), CX
	VMOVDQA 0(AX), Y0
	VMOVDQA 0(BX), Y1
	VPMAXSQ Y0, Y1, Y2
	VMOVDQA Y2, 0(CX)
	RET

TEXT ·clampAVX512F_VL(SB), $0-32
	MOVQ v+0(FP), AX
	MOVQ mn+8(FP), BX
	MOVQ mx+16(FP), CX
	MOVQ result+24(FP), DX
	VMOVDQA 0(AX), Y0
	VMOVDQA 0(BX), Y1
	VMOVDQA 0(CX), Y2
	VPMAXSQ Y0, Y1, Y3
	VPMINSQ Y2, Y3, Y4
	VMOVDQA Y4, 0(DX)
	RET