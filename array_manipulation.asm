section .data
    msg_input db "Enter 5 integers (separated by space): ", 0
    msg_output db "Reversed array: ", 0
    newline db 10, 0
    size equ 5                       ; Number of integers expected

section .bss
    input_buffer resb 50            ; Buffer for user input (up to 50 characters)
    array resd 5                    ; Array for 5 integers (each 4 bytes)

section .text
    global _start

_start:
    ; Prompt the user for input
    mov rax, 1                      ; syscall: write
    mov rdi, 1                      ; stdout
    mov rsi, msg_input              ; Message address
    mov rdx, 37                     ; Message length
    syscall                         ; Kernel call

    ; Read user input
    mov rax, 0                      ; syscall: read
    mov rdi, 0                      ; stdin
    mov rsi, input_buffer           ; Buffer to store input
    mov rdx, 50                     ; Max buffer size
    syscall                         ; Kernel call

    ; Parse the input buffer into integers
    mov rsi, input_buffer           ; Point to input buffer
    xor rdi, rdi                    ; Array index
    xor rdx, rdx                    ; Integer accumulator

parse_input:
    mov al, byte [rsi]              ; Load current character
    cmp al, 0                       ; Check for end of input
    je reverse_array                ; End parsing if null character
    cmp al, 32                      ; Check for space
    je save_integer                 ; Save integer on space
    cmp al, 10                      ; Check for newline
    je save_integer                 ; Save integer on newline

    ; Convert ASCII digit to integer
    sub al, '0'                     ; Convert ASCII to numeric
    imul rdx, rdx, 10               ; Multiply current result by 10
    add dl, al                      ; Add new digit to result
    inc rsi                         ; Move to the next character
    jmp parse_input                 ; Continue parsing

save_integer:
    cmp rdi, 4                      ; Check if array index exceeds 4
    jg reverse_array                ; Stop parsing if array is full
    mov dword [array + rdi*4], edx  ; Store integer in array
    xor rdx, rdx                    ; Reset integer accumulator
    inc rdi                         ; Increment array index
    inc rsi                         ; Skip space or newline
    jmp parse_input                 ; Continue parsing

reverse_array:
    ; Reverse the array in place
    xor rbx, rbx                    ; Left index
    mov rcx, 4                      ; Right index (size - 1)

reverse_loop:
    cmp rbx, rcx                    ; Check if pointers meet or cross
    jge print_output                ; If done, proceed to print

    ; Swap elements
    mov eax, dword [array + rbx*4]  ; Load left element
    mov edx, dword [array + rcx*4]  ; Load right element
    mov dword [array + rbx*4], edx  ; Store right element in left
    mov dword [array + rcx*4], eax  ; Store left element in right

    inc rbx                         ; Move left index
    dec rcx                         ; Move right index
    jmp reverse_loop                ; Repeat

print_output:
    ; Print the reversed array
    mov rax, 1                      ; syscall: write
    mov rdi, 1                      ; stdout
    mov rsi, msg_output             ; Output message address
    mov rdx, 17                     ; Message length
    syscall                         ; Kernel call

    mov rsi, array                  ; Point to array
    mov rcx, 5                      ; Number of elements to print

print_loop:
    mov eax, dword [rsi]            ; Load current element
    call print_integer              ; Print the integer
    add rsi, 4                      ; Move to the next integer
    loop print_loop                 ; Continue until all are printed

    ; Exit program
    mov rax, 60                     ; syscall: exit
    xor rdi, rdi                    ; Exit code 0
    syscall

print_integer:
    ; Print integer in EAX
    push rax                        ; Save original value
    xor rcx, rcx                    ; Reset digit counter

convert_loop:
    xor rdx, rdx                    ; Clear remainder
    mov rbx, 10                     ; Base 10
    div rbx                         ; RAX /= 10, remainder in RDX
    add dl, '0'                     ; Convert remainder to ASCII
    push rdx                        ; Save digit
    inc rcx                         ; Increment digit count
    test rax, rax                   ; Check if RAX is zero
    jnz convert_loop                ; Repeat if not zero

print_digits:
    pop rax                         ; Retrieve digit
    mov rdx, 1                      ; Length of one character
    mov rdi, 1                      ; stdout
    mov rsi, rax                    ; Character to print
    mov rax, 1                      ; syscall: write
    syscall
    loop print_digits               ; Continue until all digits are printed

    ; Print space after each number
    mov rax, 1                      ; syscall: write
    mov rdi, 1                      ; stdout
    mov rsi, newline                ; Address of newline
    mov rdx, 1                      ; Length of newline
    syscall

    pop rax                         ; Restore original value
    ret
