# CSCI 206 Computer Organization & Programming
# Date: 2011-09-13
# Copyright (c) 2011 Bucknell University
#
# Permission is hereby granted, free of charge, to any individual or
# institution obtaining a copy of this software and associated
# documentation files (the "Software"), to use, copy, modify, and
# distribute without restriction, provided that this copyright and
# permission notice is maintained, intact, in all copies and
# supporting
# documentation.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
# KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
# THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#
# Student name:
#
# This program calculates the sum of the values in array A and counts
# the number of values in the array.
#
# Similarly to a C-string, the array is terminated by sentinel value
# equal to zero.
#
# The sum is stored in $s0 and the count in $s1

	.data
A:	.word 5 4 3 2 4 1 0	# declare array int A[]={5,4,3,2,4,1,0};
num_elements: .asciiz "Number of elements = "
summation: .asciiz "Summation = "
new_line: .asciiz "\n"

	.text	
main:				# Initializes all releveant registers to 0
	move	$t0, $zero	# $t0 = 0
	move	$t1, $zero	# $t1 = 0
	move	$t2, $zero	# $t2 = 0
	move	$t3, $zero	# $t3 = 0
	j	test		# jump to actual method
	
test:
	lw	$t1, A($t0)	# $t1 = A[$t0]
				# Assembler uses address of A as offset and $t0 as base
	add	$t3, $t3, $t1	# summation: $t3 += $t1
	beqz	$t1, terminate	# if ( $t1 == 0 )
				#    terminate
	addi	$t2, $t2, 1	# numElements: $t2 += 1
	addi	$t0, $t0, 4	# $t0 = $t0 + 4
				# Adjusting base to "see" next element
	j	test		# loop

terminate:
	li	$v0, 4		# system call for print string
	la	$a0, num_elements
	syscall			# print( "Number of elements = " )
	
	li	$v0, 1		# system call for print int
	add	$a0, $t2, $zero	# $a0 = $t2;
	syscall			# print( numElements )
	
	li	$v0, 4		# system call for print string
	la	$a0, new_line
	syscall			# print( "\n" )
	
	li	$v0, 4		# system call for print string
	la	$a0, summation	# $a0 = MEM[summation]
	syscall			# print( "Summation = " )
	
	li	$v0, 1		# system call for print int
	add	$a0, $t3, $zero	# $a0 = $t2
	syscall
	
	li	$v0, 10		# system call for exit
	syscall			# Exit!

