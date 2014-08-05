@HNDALA006 VCKSHA001

.syntax unified
.global _start
.word 0x20001FFF
.word _start + 1

_start:
@copy data to RAM

LDR R0, ram_start
LDR R1, A
STR R1, [R0, #0]
LDR R1, B
STR R1, [R0, #4]
LDR R1, C
STR R1, [R0, #8]
LDR R1, D
STR R1, [R0, #12]

copy_to_RAM_complete:
@read data from RAM into registers and perform operations,

LDR R1, [R0, #0]
LDR R2, [R0, #4]
LDR R3, [R0, #8]
LDR R4, [R0, #12]

SUBS R4, R1, R2
ADDS R5, R1, R2
ADDS R5, R5, R3
MOVS R6, R2
EORS R2, R3, R2
MULS R3, R6, R3

@writing result back to RAM
STR R4, [R0, #16]
STR R5, [R0, #20]
STR R2, [R0, #24]
STR R3, [R0, #28]

infinite_loop:
B infinite_loop

.align
A: .word 0xAABBCCDD
B: .word 0x00001122
C: .word 0x00002233
D: .word 0x55555555

ram_start: .word 0x20000000




