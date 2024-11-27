section .data
    prompt db "Enter 5 integers separated by spaces: ", 0
    result db "Reversed array: ", 0

section .bss
    array resb 5      ; Array to store 5 integers

section .text
    global _start

_start:
    ; Read input
    mov rax, 0        ; sys_read
    lea rsi, [prompt]
    syscall

    ; Reverse the array in place
    mov rdi, 0        ; Start index
    mov rsi, 4        ; End index
reverse_loop:
    cmp rdi, rsi
    jge reverse_done
    ; Swap array[rdi] and array[rsi]
    ; Increment rdi and decrement rsi
    jmp reverse_loop

reverse_done:
    lea rsi, [result]
    syscall
