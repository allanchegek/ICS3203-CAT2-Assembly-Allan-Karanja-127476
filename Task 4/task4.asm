; Sensor value at 2050H
; Motor control at 3000H, Alarm control at 3100H

ORG 2000H
LDA 2050H         ; Load sensor value
CPI 50H           ; Compare if too high
JC MODERATE_LABEL ; If less than 50, moderate
STA 3100H         ; Set alarm ON
JMP STOP_MOTOR    ; Stop motor

MODERATE_LABEL:
CPI 30H           ; Check if moderate
JC STOP_MOTOR     ; If less than 30, stop motor
STA 3000H         ; Turn motor ON

STOP_MOTOR:
HLT
