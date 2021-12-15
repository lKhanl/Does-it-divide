org 100h  

LEA SI, OPS+3
MOV CX,4
STD

GETOPS:
LODSB
PUSH AX
LOOP GETOPS

CLD
MOV CX,4  

DIVISION:
MOV AL, NUMBER 
MOV AH, 0H 
POP BX
DIV BL 
CMP AH,0H
JNE SKIPPRINT

PRINT:
    LEA SI, MSG 
    PUSH CX
    MOV CX, 29 
    MOV AH, 0EH

    PRINTMSG:
        LODSB
        INT 10H
    LOOP PRINTMSG  
        
    ADD BL, 30H
    MOV AL, BL 
    INT 10H
        
    MOV CX, 2
    LEA SI, LINEPROVIDER

    INSERTLINE:
        LODSB
        INT 10H  
    LOOP INSERTLINE
      
    POP CX    
SKIPPRINT:
LOOP DIVISION

RET

OPS DB 2,3,5,10
MSG DB 'The number can be divided by '
NUMBER DB 15
LINEPROVIDER DB 13,10 