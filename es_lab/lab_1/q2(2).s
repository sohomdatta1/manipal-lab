AREA RESET, DATA, READONLY
EXPORT  __Vectors
__Vectors
  DCD  0x10001000     ; stack pointer value when stack is empty
  DCD  Reset_Handler  ; reset vector
  ALIGN
  AREA mycode, CODE, READONLY
  ENTRY
  EXPORT Reset_Handler
Reset_Handler
  MOV R0, 0xA
  LDR R1, =SRC
  LDR R2, =DST
Loop
  LDR R3, [R0]
  STR R4, [R1]
  ADD R0, R0, #4
  ADD R1, R1, #4
  SUBS R0, R0, #1
  BNE Loop

STOP:
  B STOP          ; Be there

SRC DCD 1,2,3,4,5,6,7,8,9          ;SRC  location in code memory
AREA mydata, DATA, READWRITE
DST DCD 0;DST location indata memory
END
