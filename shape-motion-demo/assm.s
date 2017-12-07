	.arch msp430g2553
	
	.data
	.global sw1		;switch 1
swSD1:	.byte 0x00		;0
	
	.data
	.global sw2		;switch 2
swSD2:	.byte 0x00		;0

	.data
	.global sw3		;switch 3
swSD3:	.byte 0x00		;0

	.data
	.global sw4		;switch 4
swSD4:	.byte 0x00		;0

	.data
	.global bit0		;BIT0
bit0:	.byte 0x01
	
	.data
	.global bit1		;BIT1
bit1:	.byte 0x02

	.data
	.global bit2		;BIT2
bit2:	.byte 0x04

	.data
	.global bit3		;BIT3
bit3:	.byte 0x08
	
	
	.text
	.global movement
movement:
	bit.b &bit0, &P2IN	;(P2IN & BIT0)
	mov #0, &sw1		;if S1 is not press make equal to 0
	jnz butt2		;button S1 not press check next button
	mov #1, &sw1 		;button S1 press
	jmp butt2		;go to next button

butt2:
	bit.b &bit1, &P2IN	;(P2IN & BIT1)
	mov #0, &sw2		;if S2 is not press make equal to 0
	jnz butt3		;button S2 not press check next button end
	mov #1, &sw2 		;button S2 press make equal to 1
	jmp butt3		;go to next button

butt3:
	bit.b &bit2, &P2IN	;(P2IN & BIT2)
	mov #0, &sw3		;if S3 is not press make equal to 0
	jnz butt4		;button S3 not press check next button
	mov #1, &sw3 		;button S3 press
	jmp butt4		;go to next button
	
butt4:
	bit.b &bit3, &P2IN	;(P2IN & BIT3)
	mov #0, &sw4		;if S4 is not press make equal to 0
	jnz done		;button S4 not press check next button end
	mov #1, &sw4 		;button S4 press make equal to 1
	jmp done		 ;go to end
done:	pop 0 
