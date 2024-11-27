
### **README for Task 3: Modular Program with Subroutines for Factorial Calculation**

---

# Modular Program with Subroutines for Factorial Calculation (32-bit Assembly)

This program demonstrates modular programming in x86 32-bit assembly by using subroutines to compute the factorial of a given number.

---

## **Program Details**
- **File Name:** `task3.asm`
- **Platform:** 32-bit Linux (x86 architecture)
- **Purpose:**
  - Prompt the user to input a number between 1 and 8.
  - Calculate the factorial using a subroutine.
  - Display the input number and its factorial.

---

## **Prerequisites**
1. **Assembler:** [NASM](https://nasm.us/) (Netwide Assembler)
2. **Linker:** `ld` (part of GNU Binutils)
3. **Environment:** A 32-bit Linux system or a 64-bit Linux system with `libc6-i386`.

---

## **Compiling and Running the Program**
### **Steps to Run**
1. Open a terminal and navigate to the directory containing `task3.asm`.

2. Assemble the program:
   ```bash
   nasm -f elf32 task3.asm
   ```

3. Link the object file to create an executable:
   ```bash
   ld -m elf_i386 -o task3 task3.o
   ```

4. Run the program:
   ```bash
   ./task3
   ```

---

## **How the Program Works**
1. Prompts the user for input (an integer between 1 and 8).
2. Invokes a subroutine to calculate the factorial:
   - The subroutine uses iterative multiplication.
   - The factorial result is stored in a register.
3. Prints the factorial result.

---

## **Code Highlights**
- **Subroutines:** Modular design allows for reusable functions.
- **Stack Management:** Uses the stack to pass parameters to the subroutine.
- **Syscalls:** Handles input and output via Linux syscalls.

---

## **Example Run**

#### Input:
```
Enter a number: 5
```

#### Output:
```
Factorial of 5 is: 120
```

---

## **Challenges and Insights**
1. **Stack Usage**:
   - Maintains proper stack alignment for parameter passing and return values.
2. **Input Validation**:
   - Ensures the input number is within the valid range (1-8).
3. **32-bit Limitations**:
   - Factorials beyond 8! exceed the capacity of 32-bit registers.
