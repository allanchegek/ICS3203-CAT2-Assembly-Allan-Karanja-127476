**Documentation for Task 2: Array Manipulation with Looping and Reversal**

**Program Overview**

This program reverses an array of integers stored in memory, directly modifying the values in place without using additional memory. The array is located at 2050H, and its length is 5.

**How It Works**
1. Pointer Initialization:

    The program uses two pointers:
    H-L (base pointer) for the start of the array.
    D-E (end pointer) for the end of the array.
2. Swapping Process:

    The program swaps the values at the positions indicated by the two pointers using the accumulator (A) and register C for temporary storage.
    After each swap:
        H-L moves to the next element.
        D-E moves to the previous element.
3. Termination Condition:

The loop continues until the two pointers meet or cross each other, ensuring all elements are reversed.

**Key Instructions Used**
    LXI H, 2050H and LXI D, 2054H: Initialize the base and end pointers.
    MOV: Load and store values between memory and registers.
    INX H and DCX D: Adjust pointers to move closer to the middle of the array.
    CMP: Compare the pointers to check if the loop should terminate.

**Challenges and Insights**
    Memory Access: Direct manipulation of memory required careful use of pointers.
    Efficiency: The program avoids using additional storage, which is a typical requirement in low-level programming.
    Pointer Management: Incrementing and decrementing pointers without causing unintended memory access was critical.

**Sample Input and Output**
1. Input Array (Memory Locations 2050H to 2054H): 10H, 20H, 30H, 40H, 50H
2. Output Array (Same Memory Locations): 50H, 40H, 30H, 20H, 10H

**Possible Enhancements**
1. Modify the program to handle variable-length arrays by including the length as an input parameter.
2. Extend the program to allow reversing only a subsection of the array.