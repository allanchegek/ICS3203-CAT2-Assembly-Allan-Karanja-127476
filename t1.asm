section .data
    prompt_size db 'Enter the size of the array: ', 0
    prompt_value db 'Enter a number: ', 0
    newline db 10, 0
    out_fmt db 'Array reversed: ', 0

section .bss
    arr resd 100          ; Allocate space for 100 integers

section .text
    global _start

_start:
    ; Prompt for array size
    mov eax, 4            ; sys_write system call
    mov ebx, 1            ; file descriptor STDOUT
    mov ecx, prompt_size  ; address of the prompt message
    mov edx, 25           ; length of the message
    int 0x80              ; call kernel

    ; Read array size from user
    mov eax, 3            ; sys_read system call
    mov ebx, 0            ; file descriptor STDIN
    mov ecx, arr          ; buffer to store input
    mov edx, 4            ; size of the buffer (4 bytes for integer)
    int 0x80              ; call kernel
    mov ecx, [arr]        ; move the array size to ECX

    ; Input array elements
    mov ebx, arr + 4      ; Set pointer to the start of the array
input_loop:
    ; Prompt user for a number
    mov eax, 4            ; sys_write system call
    mov ebx, 1            ; STDOUT
    mov edx, 14           ; length of the prompt message
    mov ecx, prompt_value ; address of the prompt message
    int 0x80              ; call kernel

    ; Read integer from user
    mov eax, 3            ; sys_read system call
    mov ebx, 0            ; STDIN
    mov edx, 4            ; size of an integer
    int 0x80              ; call kernel

    ; Store the input value into the array
    mov [ebx], eax        ; store the entered value at the current position

    ; Decrement counter, repeat for each element
    loop input_loop       ; loop ECX times to read all elements

    ; Reverse the array
    mov esi, arr          ; pointer to the start of the array
    add esi, (ecx-1) * 4  ; pointer to the last element
    mov edi, arr          ; pointer to the start
reverse_loop:
    cmp esi, edi          ; check if pointers meet
    jge reverse_done      ; if they meet, reversal is complete
    mov eax, [edi]        ; load value from start
    mov ebx, [esi]        ; load value from end
    mov [edi], ebx        ; store value at the start
    mov [esi], eax        ; store value at the end
    add edi, 4            ; move forward
    sub esi, 4            ; move backward
    jmp reverse_loop

reverse_done:
    ; Display reversed array
    mov eax, 4            ; sys_write system call
    mov ebx, 1            ; STDOUT
    mov ecx, out_fmt      ; message to display
    mov edx, 17           ; length of the output message
    int 0x80              ; call kernel

    ; Print each element of the reversed array
    mov ecx, [arr]        ; reload the array size
    mov edi, arr          ; pointer to start of array
print_loop:
    mov eax, [edi]        ; load array element
    ; For simplicity, assume integer-to-string conversion is done elsewhere
    ; Here we would typically convert and print the number
    ; Assume the number is printed here
    add edi, 4            ; move to the next element
    loop print_loop       ; repeat for each element

    ; Exit the program
    mov eax, 1            ; sys_exit system call
    xor ebx, ebx          ; return code 0
    int 0x80              ; call kernel
