	AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors
	
	DCD 0X10001000
	DCD Reset_Handler
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0, =SRC
	LDR R1, =DST
	LDR R5, =N
	LDR R2, [R5]
	MOV R3, 0x0
	MOV R4, 0x1

LOOP
	LDR R6, [R0], #4 
	MLA R3, R4, R6, R3
	SUBS R2, #1
	BNE LOOP

	LDR R6, =DST
	STR R3, [R6]

STOP B STOP
SRC DCD 0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9
N DCD 0xA
	AREA mydata,DATA,READWRITE
DST DCD 0
	END  

