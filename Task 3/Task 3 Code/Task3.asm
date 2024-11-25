ORG 2000H         ; Starting address of the main program
LDA 2050H         ; Load input number from memory into accumulator
MOV B, A          ; Copy input number to register B (counter)
CALL FACTORIAL    ; Call the factorial subroutine
STA 2051H         ; Store the result in memory location 2051H
HLT               ; Halt the program

; Factorial Subroutine
FACTORIAL:
PUSH B            ; Save register B (counter)
PUSH H            ; Save register H-L pair (used for intermediate multiplication)
MVI H, 00H        ; Clear H register (used for high byte of multiplication result)
MVI L, 01H        ; Initialize L register to 1 (result)

FACTORIAL_LOOP:
MOV A, B          ; Load counter value into accumulator
CPI 00H           ; Compare counter with 0
JZ FACTORIAL_END  ; If counter is 0, exit the loop
CALL MULTIPLY     ; Call multiplication subroutine
DCR B             ; Decrement the counter
JMP FACTORIAL_LOOP; Repeat until counter reaches 0

FACTORIAL_END:
MOV D, H          ; Move high byte of result to D
MOV E, L          ; Move low byte of result to E
POP H             ; Restore original H-L pair
POP B             ; Restore original B register
RET               ; Return to the main program

; Multiplication Subroutine (multiplies H-L by B, stores result in H-L)
MULTIPLY:
MOV C, B          ; Move counter to C
MOV B, L          ; Move current result to B
MVI L, 00H        ; Clear L register
MVI D, 00H        ; Clear D register (used for addition carry)

MUL_LOOP:
MOV A, B          ; Move current result to accumulator
ADD L             ; Add L to accumulator
MOV L, A          ; Store new result in L
MOV A, D          ; Move carry to accumulator
ADC H             ; Add carry to H with carry flag
MOV H, A          ; Store new result in H
DCR C             ; Decrement the counter
JNZ MUL_LOOP      ; Repeat until counter is 0
RET               ; Return to the factorial subroutine
