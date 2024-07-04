.global fib
fib:
    @ Input: r0 = n
    mov r3, #0 @ n-2 element of sequence
    mov r4, #1 @ n-1 element of sequence

    cmp r0, #0
    beq return_0

    cmp r0, #1
    beq return_1

    mov r2, #1 @ Counter variable
    mov r5, #1 @ Prepare summing register

    b sequence_loop

return_0:
    mov r0, #0
    bx lr

return_1:
    mov r0, #1
    bx lr

sequence_loop:
    cmp r2, r0
    beq exit

    add r5, r3, r4 @ An = An-2 + An-1
    @ Prepare values for the next iteration
    mov r3, r4
    mov r4, r5

    add r2, r2, #1

    b sequence_loop @ Branch back

exit:
    mov r0, r5 @ Store result in r0
    bx lr @ Return from function
