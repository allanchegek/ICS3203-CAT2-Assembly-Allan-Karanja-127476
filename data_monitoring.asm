section .data
    sensor_value db 50            ; Simulate the water level sensor (0-100, example value)
    motor_control db 0            ; Motor status (0 = OFF, 1 = ON)
    alarm_status db 0             ; Alarm status (0 = OFF, 1 = ON)
    message_motor_on db "Motor ON", 0
    message_motor_off db "Motor OFF", 0
    message_alarm_on db "ALARM: Water level too high!", 0
    message_alarm_off db "Alarm OFF", 0

section .text
    global _start

_start:
    ; Step 1: Read the water level sensor value (simulate input)
    mov al, [sensor_value]       ; Load the sensor value into register AL

    ; Step 2: Evaluate the sensor value and take actions
    cmp al, 30                   ; Check if water level is less than or equal to 30
    jle motor_on                 ; If yes, turn on motor (low water level)

    cmp al, 70                   ; Check if water level is greater than 70
    jge alarm_on                 ; If yes, trigger alarm (high water level)

    ; Step 3: Moderate water level (stop motor)
    jmp motor_off                ; If neither condition is true, stop the motor

motor_on:
    ; Turn on the motor
    mov byte [motor_control], 1  ; Set motor_control to 1 (motor ON)
    mov eax, 4                   ; sys_write
    mov ebx, 1                   ; stdout
    mov ecx, message_motor_on    ; Message to print
    mov edx, 10                  ; Length of message
    int 0x80                     ; Call kernel to print
    jmp _start                   ; Repeat the process

motor_off:
    ; Turn off the motor
    mov byte [motor_control], 0  ; Set motor_control to 0 (motor OFF)
    mov eax, 4                   ; sys_write
    mov ebx, 1                   ; stdout
    mov ecx, message_motor_off   ; Message to print
    mov edx, 11                  ; Length of message
    int 0x80                     ; Call kernel to print
    jmp _start                   ; Repeat the process

alarm_on:
    ; Trigger the alarm
    mov byte [alarm_status], 1   ; Set alarm_status to 1 (alarm ON)
    mov eax, 4                   ; sys_write
    mov ebx, 1                   ; stdout
    mov ecx, message_alarm_on    ; Message to print
    mov edx, 28                  ; Length of message
    int 0x80                     ; Call kernel to print
    jmp _start                   ; Repeat the process

alarm_off:
    ; Turn off the alarm
    mov byte [alarm_status], 0   ; Set alarm_status to 0 (alarm OFF)
    mov eax, 4                   ; sys_write
    mov ebx, 1                   ; stdout
    mov ecx, message_alarm_off   ; Message to print
    mov edx, 12                  ; Length of message
    int 0x80                     ; Call kernel to print
    jmp _start                   ; Repeat the process