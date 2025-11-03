
ORG 0000H

MAIN:
    MOV TMOD, #20H   ; Timer1 Mode 2 (auto-reload)
    MOV TH1, #-3     ; 9600 baud rate for 11.0592MHz
    MOV SCON, #50H   ; Serial mode 1, REN enabled
    SETB TR1         ; Start Timer1

    MOV DPTR, #MSG   ; Point to message string

SEND_NEXT:
    CLR A
    MOVC A, @A+DPTR  ; Get next character
    JZ DONE           ; If null terminator, stop
    MOV SBUF, A       ; Send character
WAIT:
    JNB TI, WAIT      ; Wait for transmit complete
    CLR TI
    INC DPTR
    SJMP SEND_NEXT

DONE:
    SJMP DONE

MSG: DB "HELLO", 0   ; Message string with null terminator

END
