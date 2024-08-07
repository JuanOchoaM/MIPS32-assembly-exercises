.data

array: .word -1, 5, 6, 7, 10, -6, -5, 4, 9, 20

length: .word 10

# Number of elements in the array

count1: .word 0

# Count for negative numbers

count2: .word 0 # Count for positive numbers

output1: .asciiz "negative numbers: " # Message for negative numbers

output2: .asciiz " positive numbers: " # Message for positive numbers

.text

.globl main

main:

# Load the address of the array into $a0

la $a0, array

# Load the number of elements into $t1

lw $t1, length

# Initialize counters to 0

li $t2, 0 # Counter for negative numbers

li $t3, 0 # Counter for positive numbers

loop:

# Check if all elements have been passed through

beqz $t1, end

# Load the current element from the array

lw $t4, 0($a0)

# Check if the element is negative

bltz $t4, is_negative

# If not negative, increment positive counter and continue to the next element

addi $t3, $t3, 1

j loop_iteration

is_negative:

# Increment negative count

addi $t2, $t2, 1

loop_iteration:

# Move to the next element

addi $a0, $a0, 4

# Decrease the number of elements

addi $t1, $t1, -1

j loop

end:

# Display number of negative numbers

li $v0, 4

la $a0, output1

syscall

li $v0, 1

move $a0, $t2

syscall

# Display number of positive numbers

li $v0, 4

la $a0, output2

syscall

li $v0, 1

move $a0, $t3

syscall

li $v0, 10

syscall