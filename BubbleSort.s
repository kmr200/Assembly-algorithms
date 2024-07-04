.global sort_array
sort_array:
    @ Input: r0 = pointer to the array, r1 = length of the array

    mov r2, #4 @ Offset for 'word'
    ldr r3, [sp, #0] @ Load array pointer from stack
    ldr r4, [sp, #4] @ Load array length from stack

    mov r5, #0 @ i = 0
outer_loop: @ for(int i = 0; i < array_length; i++)
    cmp r5, r4
    beq outer_loop_end

    mul r6, r5, r2 @ Index taking offset into account 
    ldr r7, [r3, r6] @ r7 = array[i]
    mov r8, r5 @ j = i

inner_loop: @ for(int j = i; j < array_length; j++)
    cmp r8, r4
    beq inner_loop_end

    mul r9, r8, r2 @ Index taking offset into account 
    ldr r10, [r3, r9] @ Loading value to be compared
    add r8, r8, #1 @ j++
    cmp r7, r10 @ if (r7 < r10)
    ble inner_loop @ continue

    @ else: We are going to perform swap
    str r10, [r3, r6] @ array[i] = array[j]
    str r7, [r3, r9] @ array[j] = array[i]

    ldr r7, [r3, r6] @ Update r7 with the new array[i] value
    b inner_loop

inner_loop_end:
    add r5, r5, #1 @ i++
    b outer_loop
    
outer_loop_end:
    bx lr @ Return to the calling function

@ Entry point for standalone execution (for testing)
.global _start
_start:
    ldr r0, =array
    ldr r1, =array_length
    bl sort_array @ Call sort_array
    b _exit

_exit:
    bx lr @ Return from program (for standalone testing)

.data
array: .word 1,3,2,5,4,7,6,5
array_length: .word 8
