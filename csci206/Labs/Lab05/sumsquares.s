# Name: Andre Amirsaleh

# Initialize variables:
.data
squares: .space 800
sum: .space 8
i: .space 8
squares_string1: .asciiz "squares["
squares_string2: .asciiz "]= "
new_line: .asciiz "\n"
goodbye: .asciiz "sum of squares from 0 to 99 = "

.text
main:
	# INITIALIZE SUM AND I:
	li	$t0, 0			# $t0 = 0
	sw	$t0, sum		# sum = 0
	sw	$t0, i			# i = 0
	
	# INITIALIZE VALUES TO CHECK CONDITIONAL
	lw	$t0, i			# $t0 = i
	li	$t1, 100		# $t1 = 100
	li	$t4, 0			# $t3 = 0
	
while1:
	# CHECK CONDITIONAL:
	bge	$t0, $t1, end_while1	# if ( i >= 100 ) branch to end_while1
	
	# SQUARES[I] = I * I:
	mul	$t3, $t0, $t0		# $t3 = i * i
	sw	$t3, squares($t4)	# squares[i] = i * i
	
	# SUM = SUM + SQUARES[I]:
	lw	$t2, sum		# $t2 = sum
	add	$t2, $t2, $t3		# $t2 = sum + squares[i]
	sw	$t2, sum		# sum = sum + squares[i]
	
	# INCREMENT I AND $T4
	addi	$t0, $t0, 1		# $t0 = i + 1
	sw	$t0, i			# i = i + 1
	addi	$t4, $t4, 4		# $t4 = $t4 + 4
	
	# LOOP:
	j	while1			# loop
	
end_while1:
	li	$t0, 0			# $t0 = 0
	sw	$t0, i			# i = 0
	li	$t1, 100		# $t1 = 100
	li	$t4, 0			# $t4 = 0
	
while2:
	# CHECK CONDITIONAL:
	bge	$t0, $t1, end_while2	# if ( i >= 100 ) branch to end_while2
	
	# PRINTF:
	li	$v0, 4			# system call for print string
	la	$a0, squares_string1
	syscall
	
	li	$v0, 1			# system call for print int
	lw	$a0, i			# $a0 = i;
	syscall				# print( i )
	
	li	$v0, 4			# system call for print string
	la	$a0, squares_string2
	syscall
	
	li	$v0, 1			# system call for print int
	lw	$a0, squares($t4)	# $a0 = squares[i];
	syscall				# print( squares[i] )
	
	li	$v0, 4			# system call for print string
	la	$a0, new_line		# $a0 = "\n"
	syscall				# print( "\n" )
	
	# INCREMENT I AND $T4:
	addi	$t0, $t0, 1		# $t0 = i + 1
	sw	$t0, i			# i = i + 1
	addi	$t4, $t4, 4		# $t4 += 4
	
	# LOOP:
	j	while2			# loop
	
end_while2:
	li	$v0, 4			# system call for print string
	la	$a0, goodbye
	syscall
	
	li	$v0, 1			# system call for print int
	lw	$a0, sum		# $a0 = squares[i];
	syscall				# print( squares[i] )
	
	li	$v0, 4			# system call for print string
	la	$a0, new_line		# $a0 = "\n"
	syscall				# print( "\n" )
	
	
	