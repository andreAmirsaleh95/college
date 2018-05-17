.data
.align 2
.text
.global matrix_sum

matrix_sum:
	# a0 is A
	# a1 is B
	# a2 is C
	la	$t0, 0($a0)		# t0 is a_index
	la	$t1, 0($a1)		# t1 is b_index
	la	$t2, 0($a2)		# t2 is c_index
	li	$t3, 0			# t3 is counter
	li	$t4, 6			# t3 is 6 (stopping condition)
	
	
loop:
	bge	$t3, $t4, return
	nop
	lw	$t5, ($t0)		# t5 is A[a_index]
	lw	$t6, ($t1)		# t6 is B[b_index]
	add	$t7, $t5, $t6		# t7 is A[a_index] + B[b_index]
	sw	$t7, ($t2)
	
	# increment counter and indexes:
	addi	$t3, $t3, 1
	addi	$t0, $t0, 4
	addi	$t1, $t1, 4
	addi	$t2, $t2, 4
	
	j	loop
	nop
	
return:
	li	$v0, 0
	