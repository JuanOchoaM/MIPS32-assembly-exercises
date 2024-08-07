.data
neg_count: .word 0
array: .word 1, -2, 3, -4, 5, -6, 7, -8, 9, -10

.text
.globl main

main:
la $a1, array
li $a2, 10
jal countNegatives
move $t0, $v1
li $v0, 1
move $a0, $t0
syscall
li $v0, 10
syscall

countNegatives:
li $v1, 0
li $t2, 0
loop:
lw $t1, 0($a1)
bltz $t1, is_negative
j not_negative
is_negative:
addi $v1, $v1, 1
not_negative:
addi $a1, $a1, 4
addi $t2, $t2, 1
bne $t2, $a2, loop
jr $ra
