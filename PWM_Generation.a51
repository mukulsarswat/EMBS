ORG 0000H

MAIN:
    MOV TMOD, #01H        ; Timer0 in mode 1 (16-bit)
    MOV R7, #50           ; Duty cycle variable (0–100%)

PWM_LOOP:
    MOV TH0, #0B6H        ; Load timer values (for base period)
    MOV TL0, #00H
    SETB TR0              ; Start timer
    CLR P1.0              ; Turn ON signal

DUTY_WAIT:
    JNB TF0, DUTY_WAIT    ; Wait until overflow
    CLR TR0
    CLR TF0

    MOV TH0, #0B6H
    MOV TL0, #00H
    SETB TR0
    SETB P1.0              ; Turn OFF signal

WAIT2:
    JNB TF0, WAIT2
    CLR TR0
    CLR TF0

    SJMP PWM_LOOP

END
