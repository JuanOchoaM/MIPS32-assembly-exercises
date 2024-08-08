.data
A: .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56
print_msg: .asciiz "The largest value in the array is: "

.text
.globl main

main:
    # Initialize Regs
    li $t0, 0            # Initialize loop counter
    la $t1, A            # Load address of array A
    lw $t2, 0($t1)       # Load the first element of A into $t2 as max

loop:
    lw $s0, 0($t1)      # Load A[i] into $s0
    ble $s0, $t2, not_greater  # If A[i] <= max, skip
    move $t2, $s0        # Update max to A[i]

not_greater:
    addi $t0, $t0, 1    # Increment loop counter
    addi $t1, $t1, 4    # Move to the next element of A
    bne $t0, 10, loop   # Check loop

    # Print result
    li $v0, 4          
    la $a0, print_msg      
    syscall

    li $v0, 1            
    move $a0, $t2       
    syscall

    # Exit program
    li $v0, 10           
    syscall
w
