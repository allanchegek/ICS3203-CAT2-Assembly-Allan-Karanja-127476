; Input number stored at memory location 2050H
; Outputs:
;   "POSITIVE" -> 3000H
;   "NEGATIVE" -> 3100H
;   "ZERO"     -> 3200H

ORG 2000H        ; Program start
LDA 2050H        ; Load input number into accumulator
CPI 00H          ; Compare with zero
JZ ZERO_LABEL    ; If zero, jump to ZERO_LABEL
JC NEGATIVE_LABEL; If carry (negative), jump to NEGATIVE_LABEL
JMP POSITIVE_LABEL ; Otherwise, it's positive

POSITIVE_LABEL:
LXI H, 3000H     ; Load address of "POSITIVE" message
SHLD 2051H       ; Store address as output
JMP END_PROGRAM  ; Jump to end

NEGATIVE_LABEL:
LXI H, 3100H     ; Load address of "NEGATIVE" message
SHLD 2051H       ; Store address as output
JMP END_PROGRAM  ; Jump to end

ZERO_LABEL:
LXI H, 3200H     ; Load address of "ZERO" message
SHLD 2051H       ; Store address as output

END_PROGRAM:
HLT              ; End the program
