section .data
    prompt db "Enter a number: ", 0
    pos_msg db "The number is POSITIVE.", 10, 0
    neg_msg db "The number is NEGATIVE.", 10, 0
    zero_msg db "The number is ZERO.", 10, 0
    buffer db 0 ; Space to store user input

section .bss
    num resb 4 ; Reserve 4 bytes for the number

section .text
    global _start

_start:
    ; Prompt user for input
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, prompt     ; Address of prompt
    mov edx, 15         ; Length of prompt
    int 0x80            ; Call kernel to write the prompt to the console

    ; Read user input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, buffer     ; Address to store input
    mov edx, 4          ; Max input length
    int 0x80            ; Call kernel to read input from the user

    ; Convert input to integer
    movzx eax, byte [buffer] ; Load the ASCII value of the first character
    sub eax, '0'        ; Convert ASCII to integer
    mov [num], eax      ; Store the number in memory for later use

    ; Compare the number
    cmp eax, 0          ; Compare the number with 0
    je zero_case        ; Jump if equal (eax == 0) to the zero_case label.
                        ; Conditional jump ensures program only flows here if the number is zero.

    jl neg_case         ; Jump if less (eax < 0) to the neg_case label.
                        ; This is another conditional jump to handle the "NEGATIVE" case.

    ; Positive case
    jmp pos_case        ; Unconditional jump to pos_case, as all other cases are ruled out.
                        ; This jump ensures we skip over the negative and zero cases,
                        ; making the logic clearer and preventing redundant checks.

zero_case:
    ; Print "ZERO" message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, zero_msg   ; Address of zero message
    mov edx, 19         ; Length of zero message
    int 0x80            ; Call kernel to print "ZERO"
    jmp end_program     ; Unconditional jump to exit the program
                        ; Prevents accidental fall-through to other cases.

neg_case:
    ; Print "NEGATIVE" message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, neg_msg    ; Address of negative message
    mov edx, 21         ; Length of negative message
    int 0x80            ; Call kernel to print "NEGATIVE"
    jmp end_program     ; Unconditional jump to exit the program
                        ; Ensures the program terminates cleanly after handling this case.

pos_case:
    ; Print "POSITIVE" message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, pos_msg    ; Address of positive message
    mov edx, 21         ; Length of positive message
    int 0x80            ; Call kernel to print "POSITIVE"

end_program:
    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Return code 0 (no error)
    int 0x80            ; Call kernel to terminate the program