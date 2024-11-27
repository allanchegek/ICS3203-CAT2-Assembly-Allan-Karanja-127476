section .data
    prompt db "Enter a number: ", 0
    positive db "POSITIVE", 0
    negative db "NEGATIVE", 0
    zero db "ZERO", 0

section .bss
    num resb 1

section .text
    global _start

_start:
    ; Prompt for input
    mov rax, 0        ; sys_read
    lea rsi, [prompt] ; address of prompt
    syscall           ; read input

    ; Read the number and classify
    cmp num, 0
    jz is_zero
    jl is_negative
    jmp is_positive

is_positive:
    lea rsi, [positive]
    jmp end

is_negative:
    lea rsi, [negative]
    jmp end

is_zero:
    lea rsi, [zero]

end:
    ; Output the classification
    mov rax, 1        ; sys_write
    syscall
