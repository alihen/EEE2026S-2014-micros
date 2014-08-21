@HNDALA006 VCKSHA001
.syntax unified
.global _start
.word 0x20001FFF
.word _start + 1

_start:
@initialization
    LDR R0, RCC_Base
    LDR R1, RCC_GPB_A_En	
    STR R1, [R0, #0x14]           @Enable GPIOA-B

    LDR R0, GPB_Base              @Set GPIOB to Output
    LDR R1, GPB_Mode
    STR R1, [R0, #0x0]

    LDR R1, GPA_Base
    LDR R2, GPA_Mode
    LDR R3, GPA_Pull
    STR R2, [R1, #0x0]			  @Set GPIOA to Input
    STR R3, [R1, #0x0C]			  @Set GPIOA Pull Up Resistors

    LDR R5, [R1, #0x10]				@Write value of push buttons to register

@todo, implement delay

loop:
	LDR R5, [R1, #0x10]				@Write value of push buttons to register
	LDR R6, =#0x1
	ANDS R6, R6, R5

	BEQ sw0_1

	LDR R4, =#0x55               @Write pattern to LED (not 0 is low)
    STR R4, [R0, #0x14]
	LDR R7,  =#0xDBD94
timer0: 
	SUBS R7, #1
	BNE timer0

	LDR R5, [R1, #0x10]				@Write value of push buttons to register
	LDR R6, =#0x1
	ANDS R6, R6, R5

	BEQ sw0_2

	LDR R4, =#0xAA               @Write pattern to LED (not 0 is low)
    STR R4, [R0, #0x14]
    LDR R7, =#0xF423F
timer4: 
	SUBS R7, #1
	BNE timer4
    B loop

sw0_1:
	LDR R4, =#0x00               @Write pattern to LED (not 0 is low)
    STR R4, [R0, #0x14]
	LDR R7, =#0xF423F
timer1: 
	SUBS R7, #1
	BNE timer1
	LDR R5, [R1, #0x10]				@Write value of push buttons to register
	LDR R6, =#0x1
	ANDS R6, R6, R5

	BEQ sw0_2

	LDR R4, =#0xAA               @Write pattern to LED (not 0 is low)
    STR R4, [R0, #0x14]
    LDR R7, =#0xF423F
timer2: 
	SUBS R7, #1
	BNE timer2
    B loop

sw0_2:  
	LDR R4, =#0xFF               @Write pattern to LED (not 0 is low)
    STR R4, [R0, #0x14]
    LDR R7, =#0xF423F
timer3: 
	SUBS R7, #1
	BNE timer3	
    B loop

 timer_1:    		
.align
RAM_Start:  	.word 0x20000000
GPB_Base:   	.word 0x48000400    @Found at Ref Sheet Pg.41, GPIOB Resides on AHB2
GPA_Base:		.word 0x48000000	@Found at Ref Sheet Pg.41, GPIOA Resides on AHB2
RCC_Base:   	.word 0x40021000    @Found at Ref Sheet Pg.41
RCC_GPB_A_En: 	.word 0x60000       @RCC_AHBENR at Ref Sheet Pg.120 [Offset 0x14] - Enable Port A and Port B
GPB_Mode:   	.word 0x5555        @GPIOx_MODER at Ref Sheet Pg.159 [Offset 0x00] [Output]
GPA_Mode:		.word 0x28000000
GPA_Pull:		.word 0x5555
LED_PATTERN: 	.word 0x5555