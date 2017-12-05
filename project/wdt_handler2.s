	.file	"_wdt_handler.c"
.text
	.balign 2
	.global	WDT
	.section	__interrupt_vector_11,"ax",@progbits
	.word	WDT
	.text
	

	.extern redrawScreen
	.extern wdt_c_handler
WDT:
; start of function
; attributes: interrupt 
; framesize_regs:     24
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          24
; elim ap -> fp       26
; elim fp -> sp       0
; saved regs: R4 R5 R6 R7 R8 R9 R10 R11 R12 R13 R14 R15
	; start of prologue
	PUSH	R15
	PUSH	R14
	PUSH	R13
	PUSH	R12
	PUSH	R11
	PUSH	R10
	PUSH	R9
	PUSH	R8
	PUSH	R7
	PUSH	R6
	PUSH	R5
	PUSH	R4
	; end of prologue
wdt_handler.s:	sub #6, 0r1
	MOV #0, r12
	BIS sr, &P1OUT
	ADD #1, r13
loop:
	CMP #15, r13
	JNE done
	MOV &ml2. r12
	MOV &fieldFence, r13
	CALL #mlAdvance
	CALL #p2sw_read
	ADD r14, 0(r1)		;int switches = ~p2sw_read()
	CMP 0(r1), BIT0
	JNE else
	SUB #3, 0(r12)
	JMP update

	CMP 0(r1), BIT1
	JNE else
	ADD #3, 0(r12)
	JMP update

	CMP 0(r1), BIT2
	JNE else
	ADD #3, 0(r13)
	JMP update

	CMP 0(r1), BIT3
	JNE else
	SUB #3, 0(r13)
	JMP update
else:
	MOV #0, 0(r12)
	MOV #0, 0(r13)
	JMP loop
update:
	ADD #1, r15		;redrawScreen
	MOV #0, r12
	JMP loop
done:
	BIC sr
	AND sr, &P1OUT
	ADD #6, r1
	pop r0
	; start of epilogue
	POP	R4
	POP	R5
	POP	R6
	POP	R7
	POP	R8
	POP	R9
	POP	R10
	POP	R11
	POP	R12
	POP	R13
	POP	R14
	POP	R15
	cmp	#0, &redrawScreen
	jz	ball_no_move
	and	#0xffef, 0(r1)	; clear CPU off in saved SR
ball_no_move:	
	RETI
	.size	WDT, .-WDT
	.local	count
	.comm	count,1,1
	.ident	"GCC: (GNU) 4.9.1 20140707 (prerelease (msp430-14r1-364)) (GNUPro 14r1) (Based on: GCC 4.8 GDB 7.7 Binutils 2.24 Newlib 2.1)"
