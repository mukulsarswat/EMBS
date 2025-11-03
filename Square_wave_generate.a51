
ORG 0000H
LJMP MAIN

ORG 000BH          ; Timer0 interrupt vector
ACALL TOGGLE
RETI

TOGGLE:
    CPL P1.0       ; Toggle P1.0
    MOV TH0, #0B6H ; Reload Timer high byte (for 50ms delay)
    MOV TL0, #00H  ; Reload Timer low byte
    RET

MAIN:
    MOV TMOD, #01H ; Timer0 Mode 1
    MOV TH0, #0B6H ; Load Timer values for delay (~50ms @ 12MHz)
    MOV TL0, #00H
    SETB ET0       ; Enable Timer0 interrupt
    SETB EA        ; Enable global interrupts
    SETB TR0       ; Start Timer0

HERE:
    SJMP HERE      ; Stay forever

END
