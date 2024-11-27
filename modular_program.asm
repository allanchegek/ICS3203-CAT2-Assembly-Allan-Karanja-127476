section .data
    prompt db "Enter a number (0-12): ", 0 ; Prompt for user input
    result_msg db "The factorial is: ", 0  ; Message to display the result
    buffer db 5                            ; Buffer for user input

section .bss
    factorial_result resd 1                ; Space to store the factorial result

section .text
    global _start

_start:
    ; Step 1: Prompt the user for input
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, prompt      ; Address of prompt message
    mov edx, 24          ; Length of prompt
    int 0x80             ; Call kernel

    ; Step 2: Read user input
    mov eax, 3           ; sys_read
    mov ebx, 0           ; stdin
    mov ecx, buffer      ; Address to store input
    mov edx, 5           ; Max input length
    int 0x80             ; Call kernel

    ; Step 3: Convert ASCII input to integer
    mov esi, buffer      ; Point to input buffer
    xor eax, eax         ; Clear eax for the result
    xor ebx, ebx         ; Clear ebx for digit parsing
parse_input:
    cmp byte [esi], 0xA  ; Check for newline character
    je parse_done        ; If newline, input is complete
    sub byte [esi], '0'  ; Convert ASCII to integer
    imul eax, eax, 10    ; Shift result left
    add eax, byte [esi]  ; Add current digit to result
    inc esi              ; Move to next character
    jmp parse_input
parse_done:
    ; eax now contains the input number

    ; Step 4: Call the factorial subroutine
    push eax             ; Push the input number onto the stack
    call factorial       ; Call the factorial function
    add esp, 4           ; Clean up the stack (pop argument)

    ; Step 5: Display the result
    mov [factorial_result], eax ; Store result in memory
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, result_msg  ; Address of result message
    mov edx, 18          ; Length of result message
    int 0x80             ; Call kernel

    ; Convert result to ASCII and print (helper function not shown here)
    call print_integer

    ; Step 6: Exit the program
    mov eax, 1           ; sys_exit
    xor ebx, ebx         ; Exit code 0
    int 0x80             ; Call kernel

; Factorial subroutine
factorial:
    ; Step 1: Save registers on the stack
    push ebp             ; Save base pointer
    mov ebp, esp         ; Set stack frame
    push ebx             ; Save ebx (used in multiplication)

    ; Step 2: Base case check (if n <= 1, return 1)
    mov eax, [ebp+8]     ; Get input parameter (n) from stack
    cmp eax, 1           ; Compare n with 1
    jle factorial_done   ; If n <= 1, return 1

    ; Step 3: Recursive case (n * factorial(n-1))
    dec eax              ; Decrement n (n-1)
    push eax             ; Push n-1 onto the stack
    call factorial       ; Recursive call
    add esp, 4           ; Clean up the stack (pop argument)
    mov ebx, eax         ; Save factorial(n-1) result in ebx
    mov eax, [ebp+8]     ; Reload n
    imul eax, ebx        ; Compute n * factorial(n-1)

factorial_done:
    ; Step 4: Restore registers and return
    pop ebx              ; Restore ebx
    mov esp, ebp         ; Restore stack frame
    pop ebp              ; Restore base pointer
    ret                  ; Return to caller

; Helper: Print a single integer (not fully implemented)
print_integer:
    ; Convert the number in eax to ASCII and write it to stdout.
    ; Implementation omitted for brevity.
    ret