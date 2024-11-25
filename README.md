# **ICS3203-CAT2-Assembly**

## **Overview**
This repository contains solutions for CAT 2 in Assembly Language Programming. The tasks demonstrate practical implementation of core assembly language concepts using the 8085 microprocessor. Each task highlights specific techniques like control flow, looping, subroutine usage, and hardware simulation.

---

## **Tasks**

### **Task 1: Control Flow and Conditional Logic**
**Objective:**  
Classify a given number as **POSITIVE**, **NEGATIVE**, or **ZERO**.

**Key Concepts:**  
- Conditional jumps (`JZ`, `JC`) for program flow based on comparison results.  
- Unconditional jumps (`JMP`) for simplified flow redirection.

**Input:**  
A number stored at memory location `2050H`.

**Output:**  
The corresponding result ("POSITIVE", "NEGATIVE", or "ZERO") is indicated by storing the address of the result message at `2051H`.

---

### **Task 2: Array Manipulation with Looping and Reversal**
**Objective:**  
Reverse a 5-element array stored in memory at `2050H` in place without using extra memory.

**Key Concepts:**  
- Pointer manipulation with `H-L` and `D-E` pairs.  
- Memory swapping using registers and the accumulator.

**Input:**  
Array of 5 integers stored at `2050H` to `2054H`.

**Output:**  
The array is reversed in the same memory locations.

---

### **Task 3: Modular Program with Subroutine for Factorial Calculation**
**Objective:**  
Compute the factorial of a number using a subroutine and store the result in `2051H`.

**Key Concepts:**  
- Subroutine implementation using `CALL` and `RET`.  
- Register preservation using `PUSH` and `POP`.  
- Iterative multiplication implemented via a secondary subroutine for handling larger results.

**Code Implementation:**  
- The factorial subroutine uses the `H-L` pair to store intermediate results for large factorials.
- A nested subroutine (`MULTIPLY`) performs the multiplication, ensuring carry propagation and proper handling of multi-byte results.

**Input:**  
A number stored at memory location `2050H`.

**Output:**  
The factorial result is stored across the `H-L` pair and output to memory at `2051H`.

---

### **Task 4: Data Monitoring and Control Using Port-Based Simulation**
**Objective:**  
Simulate a water-level monitoring system with motor and alarm control based on sensor input.

**Key Concepts:**  
- Reading sensor values from memory.  
- Threshold comparisons using the `CPI` instruction.  
- Setting or clearing specific memory locations to simulate hardware control (e.g., motor or alarm).

**Input:**  
Sensor value stored at memory location `2050H`.

**Output:**  
- Alarm triggered (`3100H` updated).  
- Motor turned on/off (`3000H` updated).

---

## **Instructions for Compiling and Running the Code**

1. **Requirements:**
   - GNUSim8085 (8085 Assembly Simulator) or equivalent for running assembly programs.
   - A text editor (e.g., VS Code) for editing `.asm` files.

2. **Steps to Compile and Run:**
   1. Open GNUSim8085 or your preferred simulator.
   2. Paste the assembly code for the desired task into the editor.
   3. Initialize required input values in memory (e.g., input number for Task 1 at `2050H`).
   4. Assemble the program using the **Assemble** option in GNUSim8085.
   5. Run the program and use the **Memory Viewer** to verify the output.

---