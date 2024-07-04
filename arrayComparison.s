.global compare_arrays
compare_arrays:
    @ Input: r0 = array1, r1 = array2, r2 = length
    mov r3, r0 @ Array1 pointer
    mov r4, r1 @ Array2 pointer
    mov r2, #9 @ Length of the arrays

    mov r5, #0 @ Prepare register to write result
    mov r6, #0 @ Counter
    mov r7, #4 @ Offset

loop_greater:
    cmp r6, r2
    beq loop_greater_exit @ End of the loop

    mul r8, r6, r7 @ Array index to be compared

    ldr r9, [r3, r8] @ Array1 value to be compared
    ldr r10, [r4, r8] @ Array2 value to be compared

    mov r5, #0

    cmp r9, r10
    ble loop_greater_exit @ Exit if value1 <= value2

    mov r5, #1
    add r6, r6, #1
    b loop_greater

loop_greater_exit:
    cmp r5, #1
    beq exit @ Branch to exit if loop_greater succeeded

    @ Prepare temp registers:
    mov r6, #0

loop_less:
    cmp r6, r2
    beq loop_less_exit @ End of the loop

    mul r8, r6, r7 @ Array index to be compared

    ldr r9, [r3, r8] @ Array1 value to be compared
    ldr r10, [r4, r8] @ Array2 value to be compared

    cmp r10, r9
    ble loop_less_exit @ Exit if value1 >= value2

    mov r5, #-1
    add r6, r6, #1

    b loop_less

loop_less_exit:
    cmp r5, #-1
    beq exit @ Branch to exit if loop_less succeeded

    mov r5, #0 @ Load 0 to r5 since none of the conditions passed

exit:
    mov r0, r5 @ Store result in r0
    bx lr @ Return from function
