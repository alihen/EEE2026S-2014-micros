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
	.section	.rodata
	.align	2
.LC0:
	.byte	-4
	.byte	31
	.byte	-51
	.byte	62
	.byte	-45
	.byte	58
	.byte	-99
	.byte	105
	.byte	-6
	.byte	60
	.byte	37
	.byte	106
	.byte	-106
	.byte	-96
	.byte	97
	.byte	50
	.byte	-116
	.byte	-38
	.byte	38
	.byte	-52
	.byte	-64
	.byte	-68
	.byte	75
	.byte	117
	.byte	111
	.byte	100
	.byte	116
	.byte	11
	.byte	46
	.byte	-64
	.byte	-82
	.byte	-74
	.byte	-3
	.byte	0
	.byte	44
	.byte	64
	.byte	-6
	.byte	1
	.byte	-119
	.byte	123
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 13 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #48
	.cfi_def_cfa_offset 56
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 15 0
	mov	r2, r7
	add	r2, r2, #8
	ldr	r3, .L3
	mov	r1, r2
	mov	r2, r3
	mov	r3, #40
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	.loc 1 17 0
	mov	r3, r7
	add	r3, r3, #8
	ldrb	r2, [r3]
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 19 0
	mov	r3, r7
	add	r3, r3, #8
	ldrb	r2, [r3]
	add	r3, r7, #6
	strb	r2, [r3]
	.loc 1 22 0
	mov	r1, r7
	add	r1, r1, #8
	add	r2, r7, #6
	add	r3, r7, #7
	mov	r0, r1
	mov	r1, #40
	bl	find_min_max
	.loc 1 25 0
	ldr	r3, .L3+4
	mov	r2, #128
	lsl	r2, r2, #11
	str	r2, [r3]
	.loc 1 26 0
	ldr	r3, .L3+8
	ldr	r2, .L3+12
	str	r2, [r3]
.L2:
	.loc 1 32 0 discriminator 1
	ldr	r3, .L3+16
	add	r2, r7, #6
	ldrb	r2, [r2]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 34 0 discriminator 1
	ldr	r3, .L3+20
	mov	r0, r3
	bl	basic_delay
	.loc 1 36 0 discriminator 1
	ldr	r3, .L3+16
	add	r2, r7, #7
	ldrb	r2, [r2]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 38 0 discriminator 1
	ldr	r3, .L3+20
	mov	r0, r3
	bl	basic_delay
	.loc 1 39 0 discriminator 1
	b	.L2
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	1073877012
	.word	1207960576
	.word	21845
	.word	1207960596
	.word	600000
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	find_min_max
	.code	16
	.thumb_func
	.type	find_min_max, %function
find_min_max:
.LFB1:
	.loc 1 46 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 54 0
	mov	r3, #0
	str	r3, [r7, #20]
	b	.L6
.L9:
	.loc 1 55 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, [r7]
	ldrb	r3, [r3]
	sxtb	r2, r2
	sxtb	r3, r3
	cmp	r2, r3
	bge	.L7
	.loc 1 56 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, [r7]
	strb	r2, [r3]
	b	.L8
.L7:
	.loc 1 58 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	sxtb	r2, r2
	sxtb	r3, r3
	cmp	r2, r3
	ble	.L8
	.loc 1 59 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, [r7, #4]
	strb	r2, [r3]
.L8:
	.loc 1 54 0
	ldr	r3, [r7, #20]
	add	r3, r3, #1
	str	r3, [r7, #20]
.L6:
	.loc 1 54 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bcc	.L9
	.loc 1 62 0 is_stmt 1
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE1:
	.size	find_min_max, .-find_min_max
	.align	2
	.global	basic_delay
	.code	16
	.thumb_func
	.type	basic_delay, %function
basic_delay:
.LFB2:
	.loc 1 64 0
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
	.loc 1 67 0
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L11
.L12:
	.loc 1 67 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L11:
	.loc 1 67 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L12
	.loc 1 70 0 is_stmt 1
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE2:
	.size	basic_delay, .-basic_delay
.Letext0:
	.file 2 "/usr/local/gcc-arm-none-eabi-4_8-2014q2/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/usr/local/gcc-arm-none-eabi-4_8-2014q2/arm-none-eabi/include/stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x191
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x1
	.4byte	.LASF22
	.4byte	.LASF23
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1b
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1c
	.4byte	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x38
	.4byte	0x69
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x29
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x3
	.byte	0x2a
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x42
	.4byte	0x5e
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x1
	.byte	0xd
	.4byte	0x7e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf1
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x1
	.byte	0xf
	.4byte	0xf1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x7
	.ascii	"min\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x7
	.ascii	"max\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.byte	0
	.uleb128 0x8
	.4byte	0x8c
	.4byte	0x101
	.uleb128 0x9
	.4byte	0x101
	.byte	0x27
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0x2e
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x162
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x2e
	.4byte	0x162
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0x2e
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0x2e
	.4byte	0x162
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2e
	.4byte	0x162
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.ascii	"i\000"
	.byte	0x1
	.byte	0x35
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x8c
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0x40
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x40
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.ascii	"k\000"
	.byte	0x1
	.byte	0x42
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
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
	.uleb128 0x3
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
.LASF0:
	.ascii	"__int8_t\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF25:
	.ascii	"find_min_max\000"
.LASF21:
	.ascii	"GNU C 4.8.4 20140526 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 211358] -mthumb -mcpu=cortex-m0 -g\000"
.LASF12:
	.ascii	"int8_t\000"
.LASF23:
	.ascii	"/Users/alastairhendricks/Documents/EEE2026S-2014-mi"
	.ascii	"cros/prac-8\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"array\000"
.LASF26:
	.ascii	"basic_delay\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF24:
	.ascii	"main\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF20:
	.ascii	"time\000"
.LASF16:
	.ascii	"sizetype\000"
.LASF9:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"main.c\000"
.LASF4:
	.ascii	"short int\000"
.LASF18:
	.ascii	"max_ptr\000"
.LASF19:
	.ascii	"min_ptr\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"long int\000"
.LASF2:
	.ascii	"signed char\000"
.LASF17:
	.ascii	"length\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140526 (release) [ARM/embedded-4_8-branch revision 211358]"
