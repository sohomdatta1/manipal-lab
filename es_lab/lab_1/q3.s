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
  MOV R0, HALF_SIZE
  LDR R1, =SRC
  ADD R1, R1, #(SIZE-1) * 4
  LDR R2, =SRC

REV:
  LDR R4, [R2]
  LDR R5, [R1]
  STR R4, [R1]
  STR R5, [R2]
  SUB R1, R1, #-4
  SUB R2, R2, #4
  SUBS R0, R0, #1
  BNE REV

STOP:
  B STOP          ; Be there
SIZE EQU 0xA
HALF_SIZE EQU 0x5
AREA mydata, DATA, READWRITE
SRC DCD 1,2,3,4,5,6,7,8,9          ;SRC  location in code memory
END
