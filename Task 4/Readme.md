**Documentation for Task 4: Data Monitoring and Control**

**How the Program Determines Actions Based on Sensor Input:**

1. Sensor Input Evaluation:
    The sensor value is read from memory location 2050H and compared with predefined thresholds (50H for high and 30H for moderate).
    Comparisons are performed using the CPI instruction, which sets flags based on the result.

2. Action Selection:
    **High Level**: If the sensor value exceeds 50H, the program sets an "alarm" by writing a value to 3100H.
    **Moderate Level**: If the sensor value is between 30H and 50H, the program turns on the "motor" by setting a bit in 3000H.
    **Low Level**: If the sensor value is below 30H, the program stops the motor by clearing the corresponding bit in memory.

3. Memory Manipulation:
    Alarm: Writing to 3100H reflects the alarm's active state.
    Motor: Writing or clearing values in 3000H directly manipulates the motor's state.

**Program Overview**

This program simulates a simple monitoring and control system for a "water level sensor." It reads a sensor value from memory and triggers specific actions based on predefined thresholds:

1. Turn on a motor if the water level is moderate.
2. Trigger an alarm if the water level is too high.
3. Stop the motor if the water level is below the threshold.

**How It Works**
1. Sensor Input:
The sensor value is read from memory location 2050H.
2. Threshold Checks:
Using CPI, the program compares the sensor value with:
    50H for the high threshold.
    30H for the low threshold.
3. Control Actions:
Based on the comparisons, the program decides:
    High Level: Set the alarm by storing a value in memory (3100H).
    Moderate Level: Turn on the motor by setting a bit in memory (3000H).
    Low Level: Stop the motor by clearing the motor's memory location.
4. End of Program:
The program stops execution with the HLT instruction.

**Key Instructions Used**
LDA: Load sensor value into the accumulator.
CPI: Compare the accumulator with threshold values.
JC: Conditional jump for levels below the threshold.
STA: Store the action result in memory for motor or alarm control.

**Challenges and Insights**
1. Memory Mapping:
Simulating hardware actions like motor control and alarm triggering using memory locations simplifies implementation.
2. Threshold Comparisons:
Using multiple CPI instructions ensures accurate evaluation of sensor values.
3. Action Prioritization:
High levels take precedence to ensure safety (e.g., triggering the alarm).

**Sample Input and Output**
Input: 60H (sensor value at 2050H)
    Action: Alarm triggered (3100H updated).
Input: 40H
    Action: Motor turned on (3000H updated).
Input: 20H
    Action: Motor stopped (3000H cleared).