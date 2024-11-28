
### **README for Task 2: Array Manipulation with Looping and Reversal**

---

# Array Manipulation with Looping and Reversal (64-bit Assembly)

This program demonstrates array manipulation in x86 64-bit assembly, focusing on looping through the elements of an array and reversing it in-place.

---

## **Program Details**
- **File Name:** `task2.asm`
- **Platform:** 64-bit Linux (x86 architecture)
- **Purpose:**
  - Traverse an integer array using a loop.
  - Reverse the array in-place using index-based swapping.
  - Display both the original and reversed arrays.

---

## **Prerequisites**
1. **Assembler:** [NASM](https://nasm.us/) (Netwide Assembler)
2. **Linker:** `ld` (part of GNU Binutils)
3. **Environment:** A 64-bit Linux system or a 64-bit Linux system with `libc6-i386` for compatibility.

---

## **Compiling and Running the Program**
### **Steps to Run**
1. Open a terminal and navigate to the directory containing `task2.asm`.

2. Assemble the program:
   ```bash
   Bash
nasm -f elf64 task2.asm -o task2.o
   ```

3. Link the object file to create an executable:
   ```bash
   ld task2.o -o task2
   ```

4. Run the program:
   ```bash
   ./task2
   ```

---

## **How the Program Works**
1. This program accepts an array of 5 single-digit integers from the user,
2. It reverses the array in place using two-pointer logic, and outputs the reversed array.

---

## **Code Highlights**
- **Looping:** Implements a loop to traverse and process the array.
- **Swapping:** Uses indexed addressing to exchange elements at two positions.
- **Syscalls:** Linux syscalls handle printing and exiting.

---

## **Example Run**

#### Output:
```
Original Array: 1, 2, 3, 4, 5
Reversed Array: 5, 4, 3, 2, 1
```
## **Challenges and Insights**
1. **Syscalls for Output**:
   - Relies on Linux system calls for printing arrays to the console.

2. **In-Place Reversal**:
   - Efficiently manipulates memory without using extra space.

3. **64-bit Constraints**:
   - The program strictly adheres to 64-bit architecture, utilizing Linux syscalls and 64-bit registers for processing.