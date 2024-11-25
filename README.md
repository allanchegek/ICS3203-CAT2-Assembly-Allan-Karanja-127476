# ICS3203-CAT2-Assembly-Allan-Karanja-127476
ICS3203-CAT2-Assembly

## **8085 Assembly Program: Register Management Documentation**

### **Overview**
This program calculates the factorial of a number stored at memory location 2050H and stores the result at 2051H.

### **How it Works**
1. **Main Program**:
   - Loads the input number into register B.
   - Calls the `FACTORIAL` subroutine.
   - Stores the result in memory.

2. **Factorial Subroutine**:
   - Saves registers B and H-L on the stack.
   - Initializes the factorial result.
   - Uses a loop to decrement the counter and multiply the result.
   - Restores registers from the stack.

3. **Multiplication Subroutine**:
   - Multiplies the current result by the counter using addition.

### **Key Instructions Used**
- `LDA`, `MOV`, `CALL`, `STA`, `PUSH`, `POP`, `MVI`, `JMP`, `JZ`, `CPI`, `ADD`, `ADC`.

### **Stack Operations**
- **PUSH**: Saves register values onto the stack to preserve the current state.
- **POP**: Restores register values from the stack after the subroutine completes.

### **Register Management**
- **PUSH B, PUSH H**: Save the counter and result registers.
- **POP H, POP B**: Restore the original values after computation.

### **Sample Input and Output**
- **Input**: Number stored at 2050H (e.g., 04H for 4).
- **Output**: Factorial result stored at 2051H (e.g., 24 (18H) for input 4).

### **Possible Enhancements**
- Implement error handling for large inputs.
- Optimize the multiplication process.
- Extend functionality for dynamic user inputs.