.data

float1: .float 1.14

float2: .float 2.71

result_msg: .asciiz "Result is: "

.text

main:

lwc1 $f6, float1

lwc1 $f8, float2

c.lt.s $f6, $f8

li $s1, 1

bc1t true_condition

li $s1, 0

j print_result

true_condition:

li $s1, 1

print_result:

li $v0, 4

la $a0, result_msg

syscall

li $v0, 1

move $a0, $s1

syscall

li $v0, 10

syscall