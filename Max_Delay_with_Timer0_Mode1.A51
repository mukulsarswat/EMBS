ORG 0000H
SJMP MAIN

ORG 0030H
	MAIN: CLR P1.0 // SET AS OUTPUT
	MOV TMOD,#01H //USING TIMER 1	
	REPEAT:MOV TH1,#00H
	MOV TL1,#00H
	CPL P1.0
	SETB TR1
	CHECK:JNB TF1,CHECK
	CLR P1.0
	CLR TR1
	CLR TF1
	JMP REPEAT
	END
