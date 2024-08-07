.data
    numA: .float 1.5
    numB: .float 1.0
    result: .asciiz "Result: "

.text
    main:
        l.s $f0, numA
        l.s $f2, numB
        c.lt.s $f0, $f2
        bc1t swap
        add.s $f4, $f0, $f2
        j print_result
    swap:
        mov.s $f4, $f0
        mov.s $f0, $f2
        mov.s $f2, $f4
    print_result:
        li $v0, 4
        la $a0, result
        syscall
        li $v0, 2
        mov.s $f12, $f4
        syscall
    exit:
        # Exit
        li $v0, 10
        syscall