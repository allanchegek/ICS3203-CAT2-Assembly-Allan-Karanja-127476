section .data
    array db 1, 2, 3, 4, 5 ; initial array
    len equ 5              ; array length

section .text
    global _start

_start:
    ; Initialize pointers
    mov rsi, array          ; start of array
    mov rdi, array + len - 1; end of array

reverse_loop:
    cmp rsi, rdi            ; check if pointers meet
    jge done

    ; Swap elements
    mov al, [rsi]           ; load element from start
    mov bl, [rdi]           ; load element from end
    mov [rsi], bl           ; swap
    mov [rdi], al

    ; Move pointers
    inc rsi
    dec rdi
    jmp reverse_loop

done:
    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall
