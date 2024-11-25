**Documentation for Task 1: Control Flow and Conditional Logic**
**Program Overview**
This program is designed to classify a given number as POSITIVE, NEGATIVE, or ZERO. It demonstrates the use of both conditional and unconditional jump instructions to manage program flow. The input number is stored in memory, and the result is output by storing the corresponding message's address into a predefined location.

**How It Works**
1. Input Handling:
The number is read from memory location 2050H.
2. Comparison Logic:
    The program uses the CPI instruction to compare the input number with 0.
    Based on the comparison, the program branches to the appropriate label:
        JZ (Jump if Zero): If the number is 0.
        JC (Jump if Carry): If the number is negative.
        JMP (Unconditional Jump): If the number is positive.
3. Output Generation:
At each label (POSITIVE_LABEL, NEGATIVE_LABEL, ZERO_LABEL), the address of the corresponding message is loaded into a specific memory location (2051H).
4. End of Program:
The program terminates with the HLT instruction.

**Key Instructions Used**
    LDA: Load the accumulator with the input value.
    CPI: Compare the accumulator with an immediate value (0).
    JZ and JC: Conditional jumps based on the result of the comparison.
    JMP: Unconditional jump for program flow control.

**Challenges and Insights**
    Choosing Jump Instructions:
    JZ ensures accurate detection of 0, while JC uses the carry flag to identify negative numbers.
    JMP simplifies handling the remaining (positive) case.
**Output Method:**
    Storing the message addresses in memory ensures efficient output handling without complex I/O operations.

**Sample Input and Output**
Input: -5 (stored at 2050H)
    Output: Address of "NEGATIVE" message (3100H) stored at 2051H.
Input: 0
    Output: Address of "ZERO" message (3200H) stored at 2051H.
Input: 10
    Output: Address of "POSITIVE" message (3000H) stored at 2051H.
**Possible Enhancements**
    Add actual output display functionality if hardware I/O is available.
    Extend the program to handle larger datasets or multiple inputs.