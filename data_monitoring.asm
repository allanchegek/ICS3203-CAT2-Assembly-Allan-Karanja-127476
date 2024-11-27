section .data
    sensor_value db 0x00
    motor_status db 0x00
    alarm_status db 0x00

section .text
    global _start

_start:
    ; Simulate reading the sensor
    mov al, [sensor_value]

    ; Take action based on the sensor value
    cmp al, HIGH_THRESHOLD
    jg trigger_alarm

trigger_alarm:
    ; Set alarm bit
    mov [alarm_status], 1
    ; More logic here
