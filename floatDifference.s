.data
    prompt: .asciiz "Enter a floating-point value: "
    result: .asciiz "Result: "
    values: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

.text
    .globl main

main:
    li $t0, 0
    la $t1, values

values_loop:
    beq $t0, 6, difference

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 6
    syscall

    s.s $f0, 0($t1)

    addi $t0, $t0, 1
    addi $t1, $t1, 4
    j values_loop

difference:
    l.s $f2, values
    l.s $f4, values
    li $t0, 1
    la $t1, values

loop:
    beq $t0, 6, print_result

    l.s $f6, 0($t1)
    c.le.s $f6, $f4
    bc1f calculate_continue

    mov.s $f4, $f6

calculate_continue:
    c.le.s $f2, $f6
    bc1f calculate_continue_max

    mov.s $f2, $f6

calculate_continue_max:
    addi $t0, $t0, 1
    addi $t1, $t1, 4
    j loop

print_result:
    sub.s $f8, $f2, $f4
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 2
    mov.s $f12, $f8
    syscall

    li $v0, 10
    syscall
