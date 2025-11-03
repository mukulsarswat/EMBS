ORG 0000H

MAIN:
    MOV TMOD, #20H   ; Timer1 in Mode 2 (8-bit auto-reload)
    MOV TH1, #-3     ; Load value for 9600 baud rate
    MOV SCON, #50H   ; Serial mode 1, REN enabled
    SETB TR1         ; Start Timer1

SEND:
    MOV SBUF, #'A'   ; Load 'A' into serial buffer
WAIT:
    JNB TI, WAIT     ; Wait for transmission complete
    CLR TI           ; Clear transmit interrupt flag
    SJMP SEND        ; Repeat forever

END
