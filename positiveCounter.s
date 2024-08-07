.data
array:  .word  -9, 4, 0, 8, -2   # A sample array with integers. Zero is non-positive/non-negative
length: .word  5                    # We have 5 elements in the array.
count:  .word  0                    # Initialize a counter to 0.

output: .asciiz "Number of positive numbers: "  # Message will be displayed.

.text
.globl main
main:
    # Load the address of the array into $a0
    la $a0, array

    # Load the number of elements into $t1
    lw $t1, length

    # Initialize the counter to 0
    li $t0, 0

loop:
    # Check if all elements have been passed through
    beqz $t1, end

    # Load the current element from the array
    lw $t2, ($a0)

    # Check if the element is positive x > 0
    bgtz $t2, is_positive

    # If not positive, continue to the next element
    j loop_iteration

is_positive:
    # Increment the counter by 1
    addi $t0, $t0, 1

loop_iteration:
    # Move to the next element in the array
    addi $a0, $a0, 4

    # Decrement the number of elements by 1
    addi $t1, $t1, -1

    # Repeat the loop
    j loop

end:
    li $v0, 4
    la $a0, output
    syscall

    # Display number of positive numbers
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall        # Exit 
