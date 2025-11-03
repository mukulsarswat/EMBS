
ORG 0000H

MAIN:
    SETB P1.0       ; Set P1.0 high initially

LOOP:
    CPL P1.0        ; Complement (toggle) bit P1.0
    ACALL DELAY
    SJMP LOOP

DELAY:
    MOV R0, #200
DL1: MOV R1, #200
DL2: DJNZ R1, DL2
     DJNZ R0, DL1
     RET

END
