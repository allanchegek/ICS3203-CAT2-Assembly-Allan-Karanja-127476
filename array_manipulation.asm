section .data
    prompt1 db "Enter 5 integers separated by spaces: ", 0
    prompt2 db "Reversed array: ", 0
    buffer db 20 ; Input buffer for user input (enough to hold 5 integers and spaces)
    array dd 5 dup(0) ; Space for 5 integers (4 bytes each)

section .bss
    temp resd 1 ; Temporary variable for swapping

section .text
    global _start

_start:
    ; Step 1: Prompt the user for input
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, prompt1     ; Address of prompt
    mov edx, 34          ; Length of prompt
    int 0x80             ; Call kernel

    ; Step 2: Read user input
    mov eax, 3           ; sys_read
    mov ebx, 0           ; stdin
    mov ecx, buffer      ; Address to store input
    mov edx, 20          ; Max input length
    int 0x80             ; Call kernel

    ; Step 3: Convert user input into integers and store in array
    mov esi, buffer      ; Point to input buffer
    mov edi, array       ; Point to the array

    mov ecx, 5           ; We expect 5 integers
parse_input:
    ; Skip whitespace
    cmp byte [esi], ' '
    je skip_space
    ; Convert ASCII to integer
    mov eax, 0           ; Clear eax for new number
parse_digit:
    cmp byte [esi], '0'  ; Check if current character is a digit
    jb store_num         ; If below '0', stop
    cmp byte [esi], '9'
    ja store_num         ; If above '9', stop
    sub byte [esi], '0'  ; Convert ASCII digit to integer
    imul eax, eax, 10    ; Shift previous digits left
    add eax, byte [esi]  ; Add current digit to eax
    inc esi              ; Move to the next character
    jmp parse_digit
store_num:
    mov [edi], eax       ; Store the number in the array
    add edi, 4           ; Move to the next array element
    loop parse_input     ; Repeat for all 5 integers
skip_space:
    inc esi
    jmp parse_input

    ; Step 4: Reverse the array in place
    mov esi, array       ; Start of the array
    add esi, 16          ; End of the array (4 bytes * 4)
    mov edi, array       ; Start of the array

reverse_loop:
    cmp esi, edi         ; Check if pointers have crossed
    jbe reverse_done     ; If so, reversal is complete

    ; Swap the values at esi and edi
    mov eax, [esi]       ; Load the value at the end
    mov [temp], eax      ; Store it in temp
    mov eax, [edi]       ; Load the value at the start
    mov [esi], eax       ; Move it to the end
    mov eax, [temp]      ; Load the temp value
    mov [edi], eax       ; Move it to the start

    ; Update pointers
    sub esi, 4           ; Move esi backward
    add edi, 4           ; Move edi forward
    jmp reverse_loop     ; Repeat until pointers meet or cross

reverse_done:
    ; Step 5: Output the reversed array
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, prompt2     ; Address of reversed prompt
    mov edx, 16          ; Length of reversed prompt
    int 0x80             ; Call kernel

    ; Print each integer
    mov esi, array       ; Start of the array
    mov ecx, 5           ; Number of integers to print
print_loop:
    mov eax, [esi]       ; Load the integer
    call print_integer   ; Print it
    add esi, 4           ; Move to the next integer
    loop print_loop      ; Repeat for all integers

    ; Step 6: Exit program
    mov eax, 1           ; sys_exit
    xor ebx, ebx         ; Exit code 0
    int 0x80             ; Call kernel

; Helper: Print a single integer
print_integer:
    ; Convert integer to string and print (not shown here for brevity)
    ret
