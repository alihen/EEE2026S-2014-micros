@HNDALA006 VCKSHA001
@ ====== MODIFY THE LINE ABOVE!!!!! ========

@ The only labels which are critical in this prac are 'copy_to_RAM_complete' and 'increment_of_bytes_complete'
@ The rest you are free to modify and adjust as you see fit for your algorithm. 

        .syntax unified
        .global _start
        .thumb
        .cpu cortex-m0

vectors: 
        .word 0x20002000
        .word _start + 1      @ specify that the instruction at _start is a Thumb instruction.

_start:
        @ Initialising pins connected to LEDs outputs and pins connected to buttons to have pullups.
        LDR R0, RCC_Base
        LDR R1, RCC_GPB_A_En
        STR R1, [R0, #0x14]         @Enable GPIOA+B

        LDR R0, GPB_Base            @Set GPIOB to Output
        LDR R1, GPB_Mode
        STR R1, [R0, #0x0]

        LDR R1, GPA_Base
        LDR R2, GPA_Mode
        LDR R3, GPA_Pull
        STR R2, [R1, #0x0]          @Set GPIOA to Input
        STR R3, [R1, #0x0C]         @Set GPIOA Pull Up Resistors


copy_to_RAM:
        @ Copy the array specified below from flash into the start of RAM.
        @ The advised way to do it is to maintain 3 pointers: destination, source and end.
        @ Also, maintain a counter keeping track of how many bytes are moved - you'll need to know how big the array in RAM is later on.
        LDR R0, =0x20000000
        LDR R1, =start_of_data
        LDR R2, =end_of_data
loop:       
        STR R1, [R0]
        ADDS R0, R0, #4
        ADDS R1, R1, #4
        CMP R1, R2
        BNE loop
        
copy_to_RAM_complete:                   @ Critical! Once the program hits this label, the automarker will modify the contents of RAM.

        @ iterate through each individual *byte* in the array, add one to it and write it back.
        LDR R0, =0x20000000
        LDR R1, =start_of_data
        LDR R2, =end_of_data
byte_loop:       
        LDRB R3, [R0] 
        ADDS R3, R3, #1
        STRB R3, [R0]
        ADDS R0, R0, #1
        ADDS R1, R1, #1
        CMP R1, R2
        BNE byte_loop

increment_of_bytes_complete:            @ Critical! Here, the automarker will verify that each byte has been incremented.

        @ The suggestion is to now iterate through the array in RAM and find the data specified in
        @ parts 3, 4 and 5. You can then store the data somewhere for use later in the program.


display_conditional_on_pushbuttons:

        @ The suggestion is here to display one of the bytes which you found earlier on the LEDs
        @ The specific one which is displayed should be dependant on which button is pressed.

        @ infinite loop just re-checking the buttons to see if the displayed data should change. 
        B display_conditional_on_pushbuttons


        .align  @ all data accesses on the Cortex-M0 must be aligned data accesses. 
start_of_data:
        .word 0x22f65244
        .word 0x4e66eca3
        .word 0x25c1c308
end_of_data:    @ we label the NEXT address as the end pointer. This is data we do not want to copy. 
                @ Hence, the conditional loop should run while the source poiter is not pointing to end_of_data.

RAM_Start:      .word 0x20000000    @start of ram if needed.
GPB_Base:       .word 0x48000400    @Found at Ref Sheet Pg.41, GPIOB Resides on AHB2
GPA_Base:       .word 0x48000000    @Found at Ref Sheet Pg.41, GPIOA Resides on AHB2
RCC_Base:       .word 0x40021000    @Found at Ref Sheet Pg.41
RCC_GPB_A_En:   .word 0x60000       @RCC_AHBENR at Ref Sheet Pg.120 [Offset 0x14] - Enable Port A and Port B
GPB_Mode:       .word 0x5555        @GPIOx_MODER at Ref Sheet Pg.159 [Offset 0x00] [Output]
GPA_Mode:       .word 0x28000000    @GPIOx_MODER at Ref Sheet Pg.159 [Offset 0x00] [Input]
GPA_Pull:       .word 0x5555        @GPIOx_PUPDR at Ref Sheet Pg.161 [Offset 0x0C] - Set as Pull-Up
