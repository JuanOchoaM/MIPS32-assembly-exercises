.data
A:    .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56
B:    .word 4, 15, 16, 5, 7, 9, 15, 10, 22, 6
C:    .space 40 

.text
.globl main

main:
    # Initialize Regs
    li $t0, 0          # Initialize loop counter
    la $t1, A          # Load address of array A
    la $t2, B          # Load B
    la $t3, C          # Load C

loop:
    lw $s0, ($t1)     # Load A[i] into $s0
    lw $s1, ($t2)     # Load B[i] into $s1
    sub $s2, $s0, $s1 # Subtract A[i] - B[i]
    sw $s2, ($t3)     # Store the result in C[i]

    addi $t0, $t0, 1  # Increment loop
    addi $t1, $t1, 4  # Move to the next element of A
    addi $t2, $t2, 4  # Then B
    addi $t3, $t3, 4  # THen C

    bne $t0, 10, loop # Check loop

    # Print result
    li $v0, 1
    li $t0, 0          # Reset loop counter
    la $t3, C          # Load address of array C

print_loop:
    lw $a0, ($t3)     # Load C[i] into $a0 to pritn
    li $v0, 1          # Print integer
    syscall

    addi $t0, $t0, 1  # Increment loop counter
    addi $t3, $t3, 4  # Move to the next element of C

    bne $t0, 10, print_loop
    nop

    # Exit
    li $v0, 10         # Exit program
    syscall
