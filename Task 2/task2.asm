ORG 2000H         ; Starting address of the program
LXI H, 2050H      ; Load address of the first element in H-L pair
LXI D, 2054H      ; Load address of the last element in D-E pair

REVERSE_LOOP:
MOV A, M          ; Load the element at H-L address into accumulator
MOV C, A          ; Temporarily store the element in C
MOV A, E          ; Load the element at D-E address into accumulator
MOV M, A          ; Store the element at D-E into H-L's position
DCX D             ; Decrement D-E to point to the previous element
MOV A, C          ; Retrieve the temporarily stored element in C
MOV M, A          ; Store it in the D-E position
INX H             ; Increment H-L to point to the next element
MOV A, L          ; Compare L (low byte of H) and E (low byte of D)
CMP E             ; Compare if H-L overlaps or passes D-E
JC REVERSE_LOOP   ; If not overlapped, continue loop

HLT               ; Halt the program
