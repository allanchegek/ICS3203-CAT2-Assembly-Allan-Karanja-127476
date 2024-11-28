Here’s a sample **README.md** file for the **Control Flow and Conditional Logic** task:

---

# Control Flow and Conditional Logic (64-bit Assembly)

This program demonstrates how to classify a user-entered integer as **"POSITIVE"**, **"NEGATIVE"**, or **"ZERO"** using branching logic in x86-64 assembly. It employs conditional and unconditional jumps to effectively manage program flow.

---

## **Program Details**
- **File Name:** `task1.asm`
- **Platform:** 64-bit Linux (x86-64 architecture)
- **Purpose:** 
  - Prompt the user for an integer.
  - Classify the input using branching logic.
  - Print whether the number is `POSITIVE`, `NEGATIVE`, or `ZERO`.

---

## **Prerequisites**
1. **Assembler:** [NASM](https://nasm.us/) (Netwide Assembler)
2. **Linker:** `ld` (part of GNU Binutils)
3. **Environment:** A 64-bit Linux system or WSL (Windows Subsystem for Linux) with Ubuntu installed.

---

## **Compiling and Running the Program**
### **Steps to Run**
1. Open a terminal and navigate to the directory containing `task1.asm`.

2. Assemble the program:
   ```bash
   nasm -f elf64 task1.asm
   ```

3. Link the object file to create an executable:
   ```bash
   ld -o task1 task1.o
   ```

4. Run the program:
   ```bash
   ./task1
   ```

---

## **How the Program Works**
1. The program prompts the user to enter an integer.
2. Input is read as ASCII and converted to an integer.
3. Conditional jumps are used:
   - **`je` (jump if equal):** To handle the case where the number is `ZERO`.
   - **`jl` (jump if less):** To classify the number as `NEGATIVE`.
   - **Unconditional `jmp`:** To print the result and exit the classification block.

4. The result (`POSITIVE`, `NEGATIVE`, or `ZERO`) is displayed to the user.

---

## **Code Highlights**
- **Conditional Jumps:** `je`, `jl`, and `jmp` manage the control flow efficiently.
- **Syscalls:** Linux syscalls are used for input, output, and program exit.
- **64-bit Registers:** The program uses 64-bit registers like `rax`, `rdi`, and `rsi`.

---

## **Example Run**

#### Input:
```
Enter a number: 5
```

#### Output:
```
POSITIVE
```

#### Input:
```
Enter a number: -3
```

#### Output:
```
NEGATIVE
```

#### Input:
```
Enter a number: 0
```

#### Output:
```
ZERO
```

---

## **Challenges and Insights**
1. **ASCII to Integer Conversion**:
   - User input is read as ASCII characters and converted to integers by subtracting the ASCII value of `'0'` (48 in decimal).

2. **Branching Logic**:
   - `je` and `jl` ensure the correct classification based on comparison results.

3. **64-bit Constraints**:
   - The program strictly adheres to 64-bit architecture, utilizing Linux syscalls and 64-bit registers for processing.
