
ORG 0000H

MAIN:
    MOV A, #00H     ; Initialize accumulator with 0

COUNT:
    MOV P2, A       ; Output value to Port 2
    ACALL DELAY     ; Wait
    INC A           ; Increment counter
    SJMP COUNT      ; Repeat forever


DELAY:
    MOV R0, #255
DL1: MOV R1, #255
DL2: DJNZ R1, DL2
     DJNZ R0, DL1
     RET

END
