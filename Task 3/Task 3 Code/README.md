## **8085 Assembly Program: Register Management Documentation**

### **Overview**
In this program, the proper management of registers is crucial for the correct computation of the factorial. Register management involves saving (pushing) the current values onto the stack before making modifications, and restoring (popping) the original values after the operations are complete. This ensures that the main program's context is preserved and not corrupted by the subroutine operations.

### **Program Flow and Register Management**

1. **Main Program Initialization**:
   - The accumulator (A) is used to load the input number from memory.
   - The B register is used to store this input number as a counter.

2. **Calling the Subroutine**:
   - Before calling the `FACTORIAL` subroutine, the state of the accumulator is stored in the memory location 2050H.

3. **Factorial Subroutine**:
   - **Push Registers**: 
     - `PUSH B`: Saves the contents of register B onto the stack. Register B holds the counter value that needs to be preserved during the subroutine execution.
     - `PUSH H`: Saves the contents of the H-L register pair. The H-L register pair will be used for intermediate multiplication and storing the factorial result.

   - **Initialize Result**:
     - `MVI H, 00H`: Initializes the high byte of the H-L register pair to 0.
     - `MVI L, 01H`: Initializes the low byte of the H-L register pair to 1, setting the initial result to 1.

   - **Factorial Calculation Loop**:
     - The loop involves loading, comparing, calling the multiplication subroutine, and decrementing the counter until it reaches zero.
     - The loop structure ensures the current state of the result and counter are used correctly without corrupting other registers.

   - **Pop Registers**:
     - `POP H`: Restores the original contents of the H-L register pair.
     - `POP B`: Restores the original contents of register B.
     - These operations ensure that the values of the registers are restored to their state before the subroutine was called, preserving the main program’s context.

4. **Multiplication Subroutine**:
   - **Initialization**:
     - Temporary registers (C and D) are used to store intermediate values and control the multiplication process.

   - **Multiplication Loop**:
     - Performs addition repeatedly to achieve multiplication.
     - Registers are carefully managed to ensure the correct calculation of the product.

### **Stack Operations**
The stack operations (PUSH and POP) are used to preserve the state of the registers. The 8085 microprocessor uses a stack pointer (SP) to manage these operations. Here’s how it works:

- **PUSH Operation**:
  - The `PUSH` instruction decrements the stack pointer (SP) and stores the register pair contents at the memory location pointed to by SP.
  - Example: `PUSH B` will store the contents of B and C registers on the stack.

- **POP Operation**:
  - The `POP` instruction retrieves the register pair contents from the memory location pointed to by SP and increments SP.
  - Example: `POP B` will restore the contents of B and C registers from the stack.

### **Example of Stack Usage**

```assembly
PUSH B            ; Save register B (counter)
PUSH H            ; Save register H-L pair (result)
...
POP H             ; Restore original H-L pair
POP B             ; Restore original B register
```

By using the stack to save and restore the contents of registers B and H-L, the program ensures that the main program’s context is preserved, and the subroutines can perform their operations without affecting the integrity of the program. This careful register management is essential for the correct and reliable execution of the factorial calculation.