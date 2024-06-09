.data
array: .word 1,3,2,5,4,7,6,5
@array_length = 8

.global _start
_start:
	mov r0, #0 @i=0
	mov r1, #0 @Initialize register for j
	mov r2, #4 @Offset for 'word'
	ldr r3, =array @Pointer to array

outer_loop:@for(int i = 0; i < array.length(); i++)
	
	cmp r0, #8
	beq outer_loop_end

	mul r4, r0, r2 @Index taking offset into account 
	ldr r5, [r3, r4] @r5 = array[r4]
	mov r1, r0 @j = i
	

inner_loop:@for(int j = i; j < array.length(); j++)

	cmp r1, #8
	beq inner_loop_end

	mul r6, r1, r2 @Index taking offset into account 
	ldr r7, [r3, r6] @Loading value to be compared
	add r1, r1, #1 @j++
	cmp r5, r7 @if (r5 < r7)
	ble inner_loop @continue
	@else: We are going to perform swap
	str r7, [r3, r4]   @ array[i] = array[j]
    str r5, [r3, r6]   @ array[j] = array[i]

    ldr r5, [r3, r4]   @ Update r5 with the new array[i] value
	b inner_loop

inner_loop_end:
	add r0, r0, #1 @i++
	b outer_loop
	
outer_loop_end:
	b exit

exit:
