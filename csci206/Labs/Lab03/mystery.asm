
# CSCI 206 Computer Organization & Programming
# Date: 2011-08-29
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
# Student name: Andre Amirsaleh

# The value at adress 0x10010000 changes from 0x00000059 to 0x00000037 because
# when the program is first assembled, the value x = 89 (base 10) = 0x00000059
# is stored at that memory address. Towards the end of the program, the la
# function sets the memory address of $t2 to the memory address of x. The value
# of $t1 is then stored into the memory location of $t2, which is now the
# memory address of x, thus replacing the old value of 0x00000059 at memory
# address 0x10010000 to 0x00000037.


	.data					# indicates section of code used for initializing constants
	
unused:	.word 0xDEADBEEF			# stores hexadecimal value 0xDEADBEEF into variable
						# unused in memory
						
x:	.word 89				# stores value 89 to variable x in memory
						
	.text					# indicates the beginning of the instructions section of code
main:						# This tells the simulator
						# where start your program

	
	add		$t0, $zero, $zero	# $t0 = 0 + 0
	add		$t1, $zero, $zero	# t1 = 	0 + 0
						# registers $t0 and $t1 are set to zero now

loop:
	add		$t1, $t1, $t0		# $t1 = $t1 + $t0
	addi		$t0, $t0, 1		# $t0 = $t0 + 1
	ble		$t0, 10, loop		# jump to beginning of loop if $t0 <= 10

	la		$t2, x			# MEM[$t2] = MEM[x] = 89 = 0x00000059
	sw		$t1, 0($t2)		# stores contents of $t1 into the memory location of $t2
	
	li		$v0, 10			# system call for exit
	syscall					# Exit!

