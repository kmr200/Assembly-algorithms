.data
@ n'th element from Fibonaci sequence
n: .word 10
result: .word 0

.global _start
_start:

	mov r3, #0 @ n-2 element of sequence
	mov r4, #1 @ n-1 element of sequence
	

	ldr r0, =n @ Pointer to 'n'
	ldr r1, [r0] @ Get the value of 'n'
	
	@ Return 0 if n == 0
	cmp r1, #0
	beq return_0
	
	@ Return 1 if n == 1
	cmp r1, #1
	beq return_1
	
	mov r2, #1 @ Counter variable
	mov r5, #1 @ Prepare summing register
	
	b sequence_loop
	
return_0:
	
	mov r5, #0
	b exit
	
return_1:
	
	mov r5, #1
	b exit
	
sequence_loop:

	cmp r2, r1
	
	beq exit
	
	add r5, r3, r4 @ An = An-2 + An-1
	@ Prepare values for the next iteration
	mov r3, r4
	mov r4, r5
	
	add r2, #1
	
	b sequence_loop @ Branch back
	
exit:
	ldr r6, =result @ Pointer to memory location 'result'
	str r5, [r6]
	
