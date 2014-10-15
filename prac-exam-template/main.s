	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB33:
	.file 1 "main.c"
	.loc 1 16 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 17 0
	bl	enable_buttons
	.loc 1 18 0
	bl	enable_leds
	.loc 1 19 0
	bl	enable_pot1
	.loc 1 20 0
	bl	enable_adc
	.loc 1 23 0
	ldr	r3, .L5
	ldr	r2, .L5
	ldr	r2, [r2, #40]
	mov	r1, #64
	orr	r2, r1
	str	r2, [r3, #40]
	.loc 1 26 0
	ldr	r3, .L5
	ldr	r2, .L5
	ldr	r2, [r2, #12]
	mov	r1, #10
	orr	r2, r1
	str	r2, [r3, #12]
.L4:
	.loc 1 30 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	mov	r2, r3
	mov	r3, #8
	and	r3, r2
	beq	.L2
	.loc 1 33 0
	ldr	r3, .L5+4
	ldr	r2, .L5+4
	ldrh	r2, [r2, #20]
	uxth	r2, r2
	add	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r3, #20]
	b	.L3
.L2:
	.loc 1 38 0
	ldr	r3, .L5+4
	ldr	r2, .L5+4
	ldrh	r2, [r2, #20]
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	strh	r2, [r3, #20]
.L3:
	.loc 1 41 0
	bl	variable_delay
	.loc 1 42 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	1073816576
	.word	1207960576
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.align	2
	.global	variable_delay
	.code	16
	.thumb_func
	.type	variable_delay, %function
variable_delay:
.LFB34:
	.loc 1 46 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 48 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	mov	r2, r3
	mov	r3, #4
	and	r3, r2
	beq	.L8
	.loc 1 50 0
	ldr	r3, .L10
	mov	r0, r3
	bl	delay
	b	.L7
.L8:
	.loc 1 56 0
	ldr	r3, .L10+4
	ldr	r2, .L10+4
	ldr	r2, [r2, #8]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 58 0
	mov	r8, r8
	ldr	r3, .L10+4
	ldr	r3, [r3]
	.loc 1 62 0
	ldr	r3, .L10+4
	ldr	r2, [r3, #64]
	mov	r3, r2
	lsl	r3, r3, #8
	sub	r3, r3, r2
	ldr	r2, .L10+8
	add	r3, r3, r2
	mov	r0, r3
	bl	delay
.L7:
	.loc 1 68 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	325000
	.word	1073816576
	.word	65000
	.cfi_endproc
.LFE34:
	.size	variable_delay, .-variable_delay
	.align	2
	.global	delay
	.code	16
	.thumb_func
	.type	delay, %function
delay:
.LFB35:
	.loc 1 70 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 72 0
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L13
.L14:
	.loc 1 72 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L13:
	.loc 1 72 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L14
	.loc 1 74 0 is_stmt 1
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE35:
	.size	delay, .-delay
	.align	2
	.global	enable_leds
	.code	16
	.thumb_func
	.type	enable_leds, %function
enable_leds:
.LFB36:
	.loc 1 77 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 79 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #20]
	mov	r1, #144
	lsl	r1, r1, #15
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 82 0
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	str	r2, [r3]
	.loc 1 83 0
	ldr	r3, .L16+4
	mov	r2, #0
	strh	r2, [r3, #20]
	.loc 1 84 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	1073876992
	.word	1207960576
	.word	21845
	.cfi_endproc
.LFE36:
	.size	enable_leds, .-enable_leds
	.align	2
	.global	enable_buttons
	.code	16
	.thumb_func
	.type	enable_buttons, %function
enable_buttons:
.LFB37:
	.loc 1 86 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 88 0
	ldr	r3, .L19
	ldr	r2, .L19
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 91 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2, #12]
	ldr	r1, .L19+4
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 1 94 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #160
	lsl	r1, r1, #22
	orr	r2, r1
	str	r2, [r3]
	.loc 1 95 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	1073876992
	.word	21845
	.cfi_endproc
.LFE37:
	.size	enable_buttons, .-enable_buttons
	.align	2
	.global	enable_pot1
	.code	16
	.thumb_func
	.type	enable_pot1, %function
enable_pot1:
.LFB38:
	.loc 1 97 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 99 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #192
	lsl	r1, r1, #6
	orr	r2, r1
	str	r2, [r3]
	.loc 1 100 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE38:
	.size	enable_pot1, .-enable_pot1
	.align	2
	.global	enable_adc
	.code	16
	.thumb_func
	.type	enable_adc, %function
enable_adc:
.LFB39:
	.loc 1 102 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 104 0
	ldr	r3, .L24
	ldr	r2, .L24
	ldr	r2, [r2, #24]
	mov	r1, #144
	lsl	r1, r1, #5
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 1 107 0
	ldr	r3, .L24+4
	mov	r2, #1
	str	r2, [r3, #8]
	.loc 1 110 0
	mov	r8, r8
.L23:
	.loc 1 110 0 is_stmt 0 discriminator 1
	ldr	r3, .L24+4
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L23
	.loc 1 113 0 is_stmt 1
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L25:
	.align	2
.L24:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE39:
	.size	enable_adc, .-enable_adc
.Letext0:
	.file 2 "/usr/local/gcc-arm-none-eabi-4_8-2014q2/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/usr/local/gcc-arm-none-eabi-4_8-2014q2/arm-none-eabi/include/stdint.h"
	.file 4 "./Libraries/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3b7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x1
	.4byte	.LASF46
	.4byte	.LASF47
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x26
	.4byte	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x38
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x36
	.4byte	0x3a
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x42
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x5
	.4byte	0x8c
	.uleb128 0x6
	.4byte	0x8c
	.4byte	0xb3
	.uleb128 0x7
	.4byte	0x97
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.byte	0x44
	.byte	0x4
	.2byte	0x17c
	.4byte	0x163
	.uleb128 0x9
	.ascii	"ISR\000"
	.byte	0x4
	.2byte	0x17e
	.4byte	0x9e
	.byte	0
	.uleb128 0x9
	.ascii	"IER\000"
	.byte	0x4
	.2byte	0x17f
	.4byte	0x9e
	.byte	0x4
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x180
	.4byte	0x9e
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x181
	.4byte	0x9e
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x182
	.4byte	0x9e
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x183
	.4byte	0x9e
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x184
	.4byte	0x8c
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x185
	.4byte	0x8c
	.byte	0x1c
	.uleb128 0x9
	.ascii	"TR\000"
	.byte	0x4
	.2byte	0x186
	.4byte	0x9e
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x187
	.4byte	0x8c
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x188
	.4byte	0x9e
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x189
	.4byte	0x163
	.byte	0x2c
	.uleb128 0x9
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x18a
	.4byte	0x9e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.4byte	0x8c
	.4byte	0x173
	.uleb128 0x7
	.4byte	0x97
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x18b
	.4byte	0xb3
	.uleb128 0x5
	.4byte	0x81
	.uleb128 0x8
	.byte	0x2c
	.byte	0x4
	.2byte	0x269
	.4byte	0x244
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x26b
	.4byte	0x9e
	.byte	0
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x26c
	.4byte	0x17f
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x26d
	.4byte	0x81
	.byte	0x6
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x26e
	.4byte	0x9e
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x26f
	.4byte	0x9e
	.byte	0xc
	.uleb128 0x9
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x270
	.4byte	0x17f
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x271
	.4byte	0x81
	.byte	0x12
	.uleb128 0x9
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x272
	.4byte	0x17f
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x273
	.4byte	0x81
	.byte	0x16
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x274
	.4byte	0x9e
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x275
	.4byte	0x9e
	.byte	0x1c
	.uleb128 0x9
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x276
	.4byte	0x244
	.byte	0x20
	.uleb128 0x9
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x277
	.4byte	0x17f
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x278
	.4byte	0x81
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0xa3
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x279
	.4byte	0x184
	.uleb128 0x8
	.byte	0x38
	.byte	0x4
	.2byte	0x2b5
	.4byte	0x314
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x2b7
	.4byte	0x9e
	.byte	0
	.uleb128 0xa
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2b8
	.4byte	0x9e
	.byte	0x4
	.uleb128 0x9
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x2b9
	.4byte	0x9e
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2ba
	.4byte	0x9e
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2bb
	.4byte	0x9e
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2bc
	.4byte	0x9e
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x2bd
	.4byte	0x9e
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x2be
	.4byte	0x9e
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x2bf
	.4byte	0x9e
	.byte	0x20
	.uleb128 0x9
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x2c0
	.4byte	0x9e
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x2c1
	.4byte	0x9e
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x2c2
	.4byte	0x9e
	.byte	0x2c
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x2c3
	.4byte	0x9e
	.byte	0x30
	.uleb128 0x9
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x2c4
	.4byte	0x9e
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x2c5
	.4byte	0x255
	.uleb128 0xc
	.4byte	.LASF48
	.byte	0x1
	.byte	0x10
	.4byte	0x73
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF49
	.byte	0x1
	.byte	0x2e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x1
	.byte	0x46
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x376
	.uleb128 0xf
	.4byte	.LASF51
	.byte	0x1
	.byte	0x46
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii	"k\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF41
	.byte	0x1
	.byte	0x4d
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF42
	.byte	0x1
	.byte	0x56
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x61
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF44
	.byte	0x1
	.byte	0x66
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF27:
	.ascii	"PUPDR\000"
.LASF49:
	.ascii	"variable_delay\000"
.LASF29:
	.ascii	"LCKR\000"
.LASF24:
	.ascii	"OTYPER\000"
.LASF23:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF16:
	.ascii	"SMPR\000"
.LASF43:
	.ascii	"enable_pot1\000"
.LASF8:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF28:
	.ascii	"BSRR\000"
.LASF4:
	.ascii	"long int\000"
.LASF32:
	.ascii	"APB2RSTR\000"
.LASF11:
	.ascii	"uint16_t\000"
.LASF22:
	.ascii	"ADC_TypeDef\000"
.LASF26:
	.ascii	"OSPEEDR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF30:
	.ascii	"GPIO_TypeDef\000"
.LASF40:
	.ascii	"RCC_TypeDef\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF44:
	.ascii	"enable_adc\000"
.LASF41:
	.ascii	"enable_leds\000"
.LASF20:
	.ascii	"CHSELR\000"
.LASF46:
	.ascii	"main.c\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF45:
	.ascii	"GNU C 4.8.4 20140526 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 211358] -mthumb -mcpu=cortex-m0 -g\000"
.LASF38:
	.ascii	"AHBRSTR\000"
.LASF33:
	.ascii	"APB1RSTR\000"
.LASF25:
	.ascii	"RESERVED0\000"
.LASF17:
	.ascii	"RESERVED1\000"
.LASF18:
	.ascii	"RESERVED2\000"
.LASF19:
	.ascii	"RESERVED3\000"
.LASF21:
	.ascii	"RESERVED4\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF51:
	.ascii	"loop_time\000"
.LASF50:
	.ascii	"delay\000"
.LASF2:
	.ascii	"short int\000"
.LASF35:
	.ascii	"APB2ENR\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF36:
	.ascii	"APB1ENR\000"
.LASF42:
	.ascii	"enable_buttons\000"
.LASF37:
	.ascii	"BDCR\000"
.LASF14:
	.ascii	"CFGR1\000"
.LASF15:
	.ascii	"CFGR2\000"
.LASF39:
	.ascii	"CFGR3\000"
.LASF31:
	.ascii	"CFGR\000"
.LASF48:
	.ascii	"main\000"
.LASF47:
	.ascii	"/Users/alastairhendricks/Documents/EEE2026S-2014-mi"
	.ascii	"cros/prac-exam-template\000"
.LASF34:
	.ascii	"AHBENR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140526 (release) [ARM/embedded-4_8-branch revision 211358]"
