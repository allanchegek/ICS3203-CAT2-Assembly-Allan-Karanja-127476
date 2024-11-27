section .data
    prompt db "Enter a number to calculate factorial: ", 0

section .text
    global _start

_start:
    ; Prompt for input
    ; Call factorial subroutine
    ; Print result

factorial:
    ; Calculate factorial using recursion or loop
    ret
