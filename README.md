# Student Projects Repository

This repository contains various ARM32 assembly programs developed as student projects during university coursework. Each program demonstrates different algorithms and techniques in low-level programming, showcasing the use of ARM assembly language for practical problem-solving.

## Contents

### 1. Array Comparison
- **File**: `compare_arrays.s`
- **Description**: This program compares two arrays of integers to determine their relationship:
  - If all elements of `array1` are greater than `array2`, it returns 1.
  - If all elements of `array1` are less than `array2`, it returns -1.
  - Otherwise, it returns 0.
- **C Integration**: The function can be called from a C program, taking pointers to the arrays and their length as arguments.

### 2. Fibonacci Sequence
- **File**: `fibonacci.s`
- **Description**: This program calculates the nth element of the Fibonacci sequence using ARM assembly. The result is stored in a specified memory location.

### 3. Sorting Algorithm
- **File**: `sort.s`
- **Description**: This program sorts an array of integers using a basic sorting algorithm implemented in ARM assembly. It demonstrates the use of nested loops and conditional statements for sorting.

## How to Run

1. **Assembly and Linking**:
   - Use an ARM assembler (e.g., `as`) to assemble the `.s` files into object files.
   - Link the object files using a linker (e.g., `ld`) to create the executable.

   ```sh
   as -o compare_arrays.o compare_arrays.s
   ld -o compare_arrays compare_arrays.o
## C Integration

### Declaring Assembly Functions in C
The assembly functions can be called from C programs by declaring them as `extern` in the C code. This allows the C compiler to know about the external assembly functions.

### Compiling and Linking
To compile and link the C code with the ARM assembly code, follow these steps:

1. **Assembly**:
   - Use an ARM assembler (e.g., `as`) to assemble the `.s` files into object files.
   
   ```sh
   as -o compare_arrays.o compare_arrays.s
### Linking

To link the object files using a linker (e.g., `ld`) to create the executable:

```sh
ld -o compare_arrays compare_arrays.o
### Compiling with C

To compile the C code with the ARM assembly object file using a C compiler (e.g., `gcc`):

```sh
gcc -o main main.c compare_arrays.o
```
These projects were created as part of the university coursework in Computer Engineering and are intended for educational purposes. Contributions and improvements are welcome.
