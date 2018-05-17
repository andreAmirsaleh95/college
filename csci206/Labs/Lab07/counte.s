.data
.align 2
test: .asciiz "erreerre"

.text
.global counte
la	$a0, test
counte:
	# a0 is the string pointer
	# t0 is base_addr
	# t1 is i
	# t2 is size of a char
	# t3 is string[base_addr + i * char_size]
	# t4 is '\0'
	# t5 is 'e'
	# t6 is i * char_size = offset
	# t7 is base_addr + i * char_size
	move	$t0, $a0	# put the address of the base of the array in $t0
	li	$t1, 0		# put the index of target element in $t1
	li	$t2, 1		# put the size of a char in $t2
	li	$t4, '\0'	# t4 = '\0'
	li	$t5, 'e'	# t5 = 'e'
	li	$v0, 0		# v0 = 0
	
loop:
	lb	$t3, 0($t0)		# load the byte at the computed memory address
	beq	$t3, $t4, return	# if ( string[i] == '\0' ) { branch to return }
	nop
	bne	$t3, $t5, iterate	# if ( string[i] != 'e' ) { branch to iterate }
	nop
	addi	$v0, $v0, 1		# v0++
	
iterate:
	addi	$t1, $t1, 1		# t1++
	addi 	$t0, $t0, 1
	j	loop			# iterate
	nop

return:
	nop
