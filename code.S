.cpu cortex-m3
.thumb

.global _start

_start:
	.word	0x20002000
	.word	reset+1
reset:
	# setup RCC->APB2ENR so that the GPIOC is clocked
	ldr		r3, =0x40021018
	mov		r4, #0x10
	str		r4, [r3]
	# setup GPIOC->CRH so that pin8 is in output mode
	ldr		r3, =0x40011004
	mov		r4, #0x1
	str		r4, [r3]
	# setup GPIOC->ODR
	ldr		r3, =0x4001100C
	ldr		r4, =0x0100
	str		r4, [r3]
	b		reset
