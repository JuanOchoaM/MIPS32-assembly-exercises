.data
A:  .word 2, 4, 6, 8, 1, 11, 12, 13, 14, 25   
B:  .word 1, 5, 7, 9, 11, 13, 15, 17, 19, 21  
count:  .word 0                                

.text
main:
    # Initialize registers
    li $t0, 0       
    lw $t1, count   
    la $t2, A      
    la $t3, B      

loop:
    bge $t0, 10, print

    lw $t4, 0($t2)
    lw $t5, 0($t3)

    bgt $t5, $t4, inc_count
    addi $t0, $t0, 1      # Increment i
    addi $t2, $t2, 4      # Move to the next element of A
    addi $t3, $t3, 4      # Move to the next element of B

    j loop

inc_count:
    addi $t1, $t1, 1

    addi $t0, $t0, 1      
    addi $t2, $t2, 4      
    addi $t3, $t3, 4      

    j loop

print:
    li $v0, 1           
    move $a0, $t1       
    syscall

    li $v0, 10
    syscall
