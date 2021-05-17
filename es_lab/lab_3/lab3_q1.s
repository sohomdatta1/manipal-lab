	AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors
	
	DCD 0X10001000
	DCD Reset_Handler
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R1, =DIVIS
	LDR R0, =DIVID
	LDR R2, [R0]
	LDR R3, [R1]
	MOV R4, #0
LOOP
	SUB R3, R3, R2
	ADD R4, R4, #1
	CMP R3, R2
	BGE LOOP

STORE
	LDR R5, =REM
	LDR R6, =QUO
	STR R3, [R5]
	STR R4, [R6]

STOP B STOP
DIVIS DCD 20
DIVID DCD 4
	AREA mydata,DATA,READWRITE
REM DCD 0
QUO DCD 0
	END  
