section .data
    prompt db "Enter 5 integers separated by space: ", 0
    output_msg db "Reversed array: ", 0
    newline db 10, 0

section .bss
    array resb 20       ; reserve space for 5 integers (4 bytes each)

section .text
    global _start

_start:
    ; Prompt user
    mov rax, 1           ; syscall: write
    mov rdi, 1           ; file descriptor: stdout
    mov rsi, prompt      ; message address
    mov rdx, 34          ; message length
    syscall

    ; Read user input
    mov rax, 0           ; syscall: read
    mov rdi, 0           ; file descriptor: stdin
    mov rsi, array       ; buffer address
    mov rdx, 20          ; buffer size
    syscall

    ; Convert ASCII values to integers
    lea rsi, [array]     ; pointer to start of array
    xor rdi, rdi         ; index for array
convert_input:
    cmp byte [rsi], 10   ; check for newline
    je reverse_loop      ; if newline, proceed to reverse loop
    cmp byte [rsi], 32   ; check for space
    je skip_space
    sub byte [rsi], 48   ; convert ASCII to integer
    movzx eax, byte [rsi]
    mov [array + rdi * 4], eax
    inc rdi
skip_space:
    inc rsi
    jmp convert_input

reverse_loop:
    ; Initialize pointers for reversal
    mov rsi, array         ; start of array
    mov rdi, array + 16    ; end of array (5 integers, each 4 bytes)

reverse_loop_start:
    cmp rsi, rdi           ; check if pointers meet or cross
    jge print_array

    ; Swap elements
    mov eax, [rsi]         ; load element from start
    mov ebx, [rdi]         ; load element from end
    mov [rsi], ebx         ; store end element at start
    mov [rdi], eax         ; store start element at end

    ; Move pointers
    add rsi, 4
    sub rdi, 4
    jmp reverse_loop_start

print_array:
    ; Print output message
    mov rax, 1
    mov rdi, 1
    mov rsi, output_msg
    mov rdx, 16
    syscall

    ; Print reversed array
    lea rsi, [array]
    xor rdi, rdi           ; index for array
print_loop:
    mov eax, [rsi]
    add eax, 48            ; convert integer to ASCII
    mov [array + rdi], al  ; store ASCII character
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    lea rsi, [array + rdi] ; address of character
    mov rdx, 1             ; write 1 character
    syscall

    add rsi, 4
    inc rdi
    cmp rdi, 5
    jl print_loop

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Exit program
    mov rax, 60            ; syscall: exit
    xor rdi, rdi           ; exit code
    syscall
