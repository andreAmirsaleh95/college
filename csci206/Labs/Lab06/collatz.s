.data
nl: .asciiz "\n"
MAX_ITEMS: .word 100
main_print: .asciiz " ==> "

.text
main:
	li	$s0, 1			# s0 is i
	lw	$s1, MAX_ITEMS		# s1 is MAX_ITEMS
	
main_loop: # for ( i=1; i<MAX_ITEMS; i++ )
	bge	$s0, $s1, main_return	# guard
	
	# PRINT i:
	li	$v0, 1
	move	$a0, $s0
	syscall
	
	# PRINT " ==> ":
	li	$v0, 4
	la	$a0, main_print
	syscall
	
	# call find_length( i ):
	move	$a0, $s0
	jal	find_length
	
	# PRINT find_length( i )
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	# PRINT "\n"
	li	$v0, 4
	la	$a0, nl
	syscall
	
	# iterate:
	addi	$s0, $s0, 1
	j	main_loop
	
main_return:
	# sycall to exit: $v0 = 10
	li	$v0, 10
	syscall
	
collatz:
	# if ( n == 1 ) { return 1 }
	li	$t0, 1
	beq	$a0, $t0, collatz_return1
	
	# if ( n % 2 == 0 ) { return n / 2 }
	li	$t0, 2
	div	$t0, $a0, $t0
	mfhi	$t1
	beqz	$t1, collatz_return2
	
	# else { return 3 * n + 1 }
	li	$t0, 3
	mul	$v0, $a0, $t0
	addi	$v0, $v0, 1
	jr	$ra
	
collatz_return1:
	li	$v0, 1
	jr	$ra
	
collatz_return2:
	move	$v0, $t0
	jr	$ra
	
find_length:
	# if ( n <= 1 ) { return 1 }
	li	$t0, 1
	beq	$a0, $t0, find_length_return
	
	# else { return 1 + find_length( collatz( n ) ) }
	addi	$sp, $sp, -4		# allocate 1 word of space on stack
	sw	$ra, 0($sp)		# store ra on the stack
	jal	collatz			# call collatz( n )
	move	$a0, $v0		# a0 = collatz( n )
	lw	$ra, 0($sp)		# get original ra from stack
	jal	find_length		# call find_length( collatz( n ) )
	addi	$v0, $v0, 1		# v0 += 1
	lw	$ra, 0($sp)		# get original ra
	addi	$sp, $sp, 4		# deallocate 1 word of space on stack
	jr	$ra			# return
	
find_length_return:
	li	$v0, 1
	jr	$ra
	
