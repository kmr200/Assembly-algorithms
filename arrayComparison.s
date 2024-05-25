.data
array1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
array2: .word 2, 3, 4, 5, 6, 7, 8, 9, 10
result: .word 0

.global _start
_start:
	mov r0, #0 @Prepare registre to write result
	mov r1, #0 @Counter
	mov r2, #4 @Offset
	ldr r3, =array1 @Array1 pointer
	ldr r4, =array2 @Array2 pointer
	ldr r8, =result
	
loop_greater:
	cmp r1, #9
	
	beq loop_greater_exit @End of the loop

	mul r5, r1, r2 @Array index to be compared
	
	ldr r6, [r3, r5] @Array1 value to be compared
	ldr r7, [r4, r5] @Array2 value to be compared
	
	mov r0, #0
	
	cmp r6, r7
	
	ble loop_greater_exit @exit if value1 <= value2
	
	mov r0, #1
	add r1, #1
	b loop_greater
	
loop_greater_exit:
	cmp r0, #1
	
	beq exit @Branch to exit if loop_greater succeeded
	
	@Prepare temp registers:
	mov r1, #0
	
loop_less:
	cmp r1, #9
	
	beq loop_less_exit @End of the loop

	mul r5, r1, r2 @Array index to be compared
	
	ldr r6, [r3, r5] @Array1 value to be compared
	ldr r7, [r4, r5] @Array2 value to be compared
	
	cmp r7, r6
	
	ble loop_less_exit @exit if value1 >= value2
	
	mov r0, #-1
	add r1, #1
	
	b loop_less
	
loop_less_exit:
	cmp r0, #-1
	
	beq exit @Branch to exit if loop_less succeeded
	
	mov r0, #0 @load 0 to r0 since none of the conditions passed

exit:
	str r0, [r8]
