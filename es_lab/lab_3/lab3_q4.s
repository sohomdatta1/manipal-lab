	AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0, =SRC
	LDR R1, [R0]
	LDR R9, =DST
	MOV R5, #100
BCD
	CMP R1, R5
	BLT DIV2
	MOV R4, #0
DIV1
	SUB R1, R1, R5
	ADD R4, R4, #1
	CMP R1, R5
	BGE DIV1
	ADD R4, R4, #48
	STR R4, [R9], #4
	
	CMP R5, #10
	MOV R4, #0
	BLT LEND ;loop end
DIV2
	SUB R5, R5, #10
	ADD R4, R4, #1
	CMP R5, #10
	BGE DIV2
LEND
	MOV R5, R4
	CMP R5, #0
	BNE BCD

STOP
	B STOP
SRC DCD 0xFF
	AREA mydata, DATA, READWRITE
DST DCD 0
	END
