; Program to classify a number as POSITIVE, NEGATIVE, or ZERO

; Assume the input number is stored in memory location 2000H
; The output messages are stored in memory locations 2100H, 2101H, and 2102H

; Memory locations for messages
POSITIVE_MSG: DB 'POSITIVE$'   ; Message for positive number
NEGATIVE_MSG: DB 'NEGATIVE$'   ; Message for negative number
ZERO_MSG: DB 'ZERO$'           ; Message for zero

START: 
    MVI A, 00H              ; Initialize accumulator A to 0
    LXI H, 2000H           ; Load HL register pair with the address of input number
    MOV A, M                ; Move the input number from memory to accumulator A

    CPI 00H                 ; Compare A with 0
    JZ ZERO_LABEL           ; If A is zero, jump to ZERO_LABEL to handle zero case

    JC NEGATIVE_LABEL       ; If carry is set (A < 0), jump to NEGATIVE_LABEL to handle negative case

    ; If we reach here, A is positive
    JMP POSITIVE_LABEL      ; Unconditionally jump to POSITIVE_LABEL to handle positive case

ZERO_LABEL:
    ; Output "ZERO"
    MVI D, 00H              ; Load D with the address of ZERO_MSG
    CALL PRINT_MESSAGE       ; Call the subroutine to print message
    JMP END_PROGRAM         ; Jump to end of program after printing

NEGATIVE_LABEL:
    ; Output "NEGATIVE"
    MVI D, 01H              ; Load D with the address of NEGATIVE_MSG
    CALL PRINT_MESSAGE       ; Call the subroutine to print message
    JMP END_PROGRAM         ; Jump to end of program after printing

POSITIVE_LABEL:
    ; Output "POSITIVE"
    MVI D, 02H              ; Load D with the address of POSITIVE_MSG
    CALL PRINT_MESSAGE       ; Call the subroutine to print message
    JMP END_PROGRAM         ; Jump to end of program after printing

PRINT_MESSAGE:
    ; This subroutine will print the message based on the address in D
    ; (Implementation of output function is not provided)
    RET                     ; Return from subroutine

END_PROGRAM:
    HLT                     ; Halt the program