
ORG 0000H
LJMP MAIN

ORG 0023H          ; Serial interrupt vector
ACALL SERIAL_ISR
RETI

MAIN:
    MOV TMOD, #20H   ; Timer1 in mode 2
    MOV TH1, #-3     ; 9600 baud rate for 11.0592MHz
    MOV SCON, #50H   ; Serial mode 1, REN enabled
    SETB TR1         ; Start Timer1
    SETB ES          ; Enable serial interrupt
    SETB EA          ; Enable global interrupt

HERE:
    SJMP HERE        ; Wait forever

;-----------------------------------------------------
; Serial Interrupt Service Routine
;-----------------------------------------------------
SERIAL_ISR:
    JNB RI, TX_CHECK ; Check if receive interrupt
    CLR RI
    MOV A, SBUF      ; Get received data
    MOV SBUF, A      ; Echo back same data
    RET

TX_CHECK:
    CLR TI           ; Clear transmit interrupt flag
    RET

END
