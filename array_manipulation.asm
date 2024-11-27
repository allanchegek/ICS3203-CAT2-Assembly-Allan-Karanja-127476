section .data
    prompt db "Enter a number: ", 0
    result_msg db "Factorial is: ", 0
    newline db 10, 0

section .bss
    num resb 4
    result resq 1          ; space for result

section .text
    global _start

_start:
    ; Prompt user
    mov rax, 1           ; syscall: write
    mov rdi, 1           ; file descriptor: stdout
    mov rsi, prompt      ; message address
    mov rdx, 16          ; message length
    syscall

    ; Read user input
    mov rax, 0           ; syscall: read
    mov rdi, 0           ; file descriptor: stdin
    mov rsi, num         ; buffer address
    mov rdx, 4           ; buffer size
    syscall

    ; Convert input to integer
    mov rax, [num]       ; load input into rax
    sub rax, 48          ; convert ASCII to integer
    mov rdi, rax         ; store input in rdi (argument for factorial)

    ; Call factorial subroutine
    call factorial

    ; Print result message
    mov rax, 1
    mov rdi, 1
    mov rsi, result_msg
    mov rdx, 15
    syscall

    ; Print result
    mov rax, [result]    ; load result
    add rax, 48          ; convert to ASCII
    mov [num], al        ; store as character
    mov rax, 1
    mov rdi, 1
    mov rsi, num
    mov rdx, 1
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall

factorial:
    cmp rdi, 1
    jle end_factorial    ; if rdi <= 1, return
    imul rax, rdi        ; multiply rax by rdi
    dec rdi              ; decrement rdi
    call factorial       ; recursive call
end_factorial:
    mov [result], rax    ; store result in memory
    ret
