@STDNUM001 STDNUM002
@ ======= MODIFY THE LINE ABOVE!!!! =======

    .syntax unified
    .global _start
    .cpu cortex-m0
    .thumb

vectors: 
    .word 0x20002000                @ 0x00: defines the reset value of the stack pointer
    .word _start + 1                @ 0x04: defines the reset vector, thereby specifying the first instruction.
    .word Default_Handler + 1       @ 0x08: NMI vector
    .word HardFault_Handler + 1     @ 0x0C: HardFault vector
    .word Default_Handler + 1       @ 0x10: reserved
    .word Default_Handler + 1       @ 0x14: reserved
    .word Default_Handler + 1       @ 0x18: reserved
    .word Default_Handler + 1       @ 0x1C: reserved
    .word Default_Handler + 1       @ 0x20: reserved
    .word Default_Handler + 1       @ 0x24: reserved
    .word Default_Handler + 1       @ 0x28: reserved
    .word Default_Handler + 1       @ 0x2C: SVCall vector
    .word Default_Handler + 1       @ 0x30: reserved
    .word Default_Handler + 1       @ 0x34: reserved
    .word Default_Handler + 1       @ 0x38: SysTick vector
    .word Default_Handler + 1       @ 0x3C:
    .word Default_Handler + 1       @ 0x40
    .word Default_Handler + 1       @ 0x44
    .word Default_Handler + 1       @ 0x48
    .word Default_Handler + 1       @ 0x4C
    .word Default_Handler + 1       @ 0x50
    .word Default_Handler + 1       @ 0x54
    .word Default_Handler + 1       @ 0x58
    .word Default_Handler + 1       @ 0x5C
    .word Default_Handler + 1       @ 0x60
    .word Default_Handler + 1       @ 0x64
    .word Default_Handler + 1       @ 0x68
    .word Default_Handler + 1       @ 0x6C
    .word Default_Handler + 1       @ 0x70
    .word Default_Handler + 1       @ 0x74
    .word Default_Handler + 1       @ 0x78
    .word Default_Handler + 1       @ 0x7C
    .word Default_Handler + 1       @ 0x80
    .word TIM6_DAC_IRQHandler + 1       @ 0x84
    .word Default_Handler + 1       @ 0x4C
    .word Default_Handler + 1       @ 0x50
    .word Default_Handler + 1       @ 0x54
    .word Default_Handler + 1       @ 0x58
    .word Default_Handler + 1       @ 0x5C
    .word Default_Handler + 1       @ 0x60
    .word Default_Handler + 1       @ 0x64
    .word Default_Handler + 1       @ 0x68
    .word Default_Handler + 1       @ 0x6C
    .word Default_Handler + 1       @ 0x70
    .word Default_Handler + 1       @ 0x74
    .word Default_Handler + 1       @ 0x78
    .word Default_Handler + 1       @ 0x7C
    .word Default_Handler + 1       @ 0x80

    @ you do the rest....

HardFault_Handler:      @ should never happen, but handle it explcitly in case there's a bug in the code.
        NOP
        B HardFault_Handler

@ All other exceptions should be pointed here in order to have some sort of defined behaviour in
@ the event that they occur.
Default_Handler:        
        NOP
        B Default_Handler

_start:
    @ enable clock to ADC, Timer 6, GPIOA, GPIOB
    LDR R0, RCC_Base
    LDR R1, RCC_GPB_A_En
    STR R1, [R0, #0x14]         @Enable GPIOA+B clocking

    LDR R0, RCC_Base
    LDR R1, RCC_ADC_En
    STR R1, [R0, #0x18]
    LDR R1, RCC_TIM6_En
    STR R1, [R0, #0x1C]         @Enable TIMER and ADC clocking

    @ set pins to correct modes
    LDR R0, GPB_Base            @Set GPIOB to Output
    LDR R1, GPB_Mode
    STR R1, [R0, #0x0]

    LDR R0, GPB_Base
    LDR R4, =#0xFF              @Write to LED
    STR R2, [R0, #0x14]

    LDR R1, GPA_Base
    LDR R2, GPA_Mode
    STR R2, [R1, #0x0]          @Set GPIOA to Input + Analog on PA5
    
    @ pullups for buttons
    LDR R3, GPA_Pull
    STR R3, [R1, #0x0C]         @Set GPIOA Pull Up Resistors

    @ enable ADC
    LDR R0, ADC_Base
    LDR R1, ADC_Enable
    STR R1, [R0, #0x08]         
    
    @ wait until ADC ready. As per Section 13.4.4: the ADC must be ready before writing to its other registers
    
ADC_warmup:
    LDR R2, ADC_Ready
    LDR R1, [R0, #0x00]
    ANDS R2, R2, R1
    BEQ ADC_warmup

    @ select channel and resolution/alignment 
    LDR R1, ADC_CH_SEL
    STR R1, [R0, #0x28]  @set channel to A_IN5 for PA5 
    @align 0, resolution 0x2
    LDR R1, ADC_AL_RES
    STR R1, [R0, #0x0C] @set alignment and resolution

    @ initialise timer: Set ARR, PSR, enable update interrupt
    LDR R0, TIM6_Base 
    LDR R1, TIM6_Prescale @Where the prescale goes
    STR R1, [R0, #0x28]

    LDR R1, TIM6_ARR @Where the Arr goes
    STR R1, [R0, #0x2C]

    LDR R1, TIM6_Interrupt_En @enable the update interrupt
    STR R1, [R0, #0x0C]

    @ start counter counting
    LDR R1, TIM6_Counter_En @start the counter
    STR R1, [R0, #0x00]

    @ enable the interrupt for the timer in the NVIC
    LDR R0, NVIC
    LDR R1, NVIC_En
    STR R1, [R0, #0x00]


    

infinite_loop:
    NOP
    B infinite_loop

SW3: @subs for SW 3
    SUBS R4, #1
    B interrupt_cont

POT_MOD:
    @code goes here

    B SW2_return

@ The following block of code is called an Interrupt Service Routine (ISR).
@ It should be executed whenever the TIM6 IRQ occurs. 
TIM6_DAC_IRQHandler:
    @ acknowledge interrupt
    @----THIS BLOCK OF CODE IS ONLY FOR DEBUG PORPOSES-I NEED TO GET THE PRESCALER AND ARR WORKING!
    LDR R7,  =#0xDBD94
timer0:
    SUBS R7, #1
    BNE timer0
    @----END BLOCK - THIS BLOCK SHOULD BE DELETED ONCE THE PRESCALER IS WORKING CORRECTLY

    LDR R0, TIM6_Base
    LDR R1, Interrupt_ACK
    STR R1, [R0, #0x10]

    @ ==== Part 2 suggested algoritim ====
    @ Read GPIOB_ODR (remember, we're only interested in the LSB!)
    LDR R1, GPA_Base
    LDRB R5, [R1, #0x10]
    LDR R6, =#0b1000
    ANDS R6, R6, R5
    @ if SW3 is held down: subtract 1 from it
    BEQ SW3
    @ else: add 1 to it.
    ADDS R4, #1
    
 interrupt_cont:   
    @ write it back
    LDR R0, GPB_Base
    STR R4, [R0, #0x14]

    @ ==== Part 3 suggested algorithm ====
    @ if SW2 is held down:
    LDR R1, GPA_Base
    LDRB R5, [R1, #0x10]
    LDR R6, =#0b100
    ANDS R6, R6, R5
    BEQ POT_MOD
        @ kick off an ADC conversion from POT0
        @ADC conversion code goes here

        @ modify timer duration using result of conversion
    @ else:
        @ set the IRQ frequency to the default state
        LDR R0, TIM6_Base 
        LDR R1, TIM6_Prescale @Where the prescale goes
        STR R1, [R0, #0x28]

        LDR R1, TIM6_ARR @Where the Arr goes
        STR R1, [R0, #0x2C]

 SW2_return:       

    @ return from interrupt here
    BX LR
    


.align

RAM_Start:      .word 0x20000000    @start of ram if needed.
GPB_Base:       .word 0x48000400    @Found at Ref Sheet Pg.41, GPIOB Resides on AHB2
GPA_Base:       .word 0x48000000    @Found at Ref Sheet Pg.41, GPIOA Resides on AHB2
RCC_Base:       .word 0x40021000    @Found at Ref Sheet Pg.41
RCC_GPB_A_En:   .word 0x60000       @RCC_AHBENR at Ref Sheet Pg.120 [Offset 0x14] - Enable Port A and Port B clocking
RCC_ADC_En:     .word 0x200        @RCC_AHBENR at Ref Sheet Pg.121 [Offset 0x18] - Enable TIM and ADC clocking
RCC_TIM6_En:    .word 0x10
ADC_Base:       .word 0x40012400    @ADC Base address, found at Ref sheet pg.42
ADC_Enable:     .word 0x1           @enable the ADC
ADC_Ready:       .word 0x1
ADC_CH_SEL:     .word 0x100000
ADC_AL_RES:      .word 0x10
TIM6_Base:       .word 0x40001000
TIM6_Prescale:   .word 0x9C3F
TIM6_ARR:       .word 0xC8
TIM6_Interrupt_En:  .word 0x1
TIM6_Counter_En:    .word 0x1
Interrupt_ACK:      .word 0x1
NVIC:           .word 0xE000E100
NVIC_En:        .word 0x20000
GPB_Mode:       .word 0x5555        @GPIOx_MODER at Ref Sheet Pg.159 [Offset 0x00] [Output]
GPA_Mode:       .word 0x28000C00   @GPIOx_MODER at Ref Sheet Pg.159 [Offset 0x00] [Input]
GPA_Pull:       .word 0x5555        @GPIOx_PUPDR at Ref Sheet Pg.161 [Offset 0x0C] - Set as Pull-Up
