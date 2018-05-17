# CSCI 206 Computer Organization & Programming
# Date: 2011-09-19
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
#
#
# This program uses a procedure xfind to find a particular character.
# See detailed instructions in lab handout

	.data
# Define constants here

	.align 2

# These are the two test strings, use one at a time
string: .asciiz "Where is my xbox 360?"
# string: .asciiz "None of that character in here."

	.text

main:
	# Prepare for procedure call
	addi	$sp, $sp, -4		# saving registers
	sw	$ra, 0($sp)
	
	la	$a0, string		# load address of string
	jal	xfind			# call function convert

#   write code here to print the result of the 
#   call to xfind
	move	$a0, $v0
	li	$v0, 34
	syscall




	lw	$ra, 0($sp)		# restoring registers
	addi	$sp, $sp, 4
	
	li	$v0, 10			# exit to OS
	syscall

xfind:
# write the code of function xfind after this comment
	addi	$t0, $a0, 0			# $t0 = MEM[string]
	li	$t2, 'x'			# $t2 = 'x'
	li	$t3, '\0'			# $t3 = '\0'

while:
	# GET NEXT CHAR:
	lb	$t4, ($t0)			# $t4 = string[0]
	
	# CHECK CONDITIONAL:
	beq	$t2, $t4, foundx		# if ( currChar == 'x' ) return
	beq	$t3, $t4, notfound		# if ( currChar == '\0' ) return
	
	# INCREMENT INDEX:
	addi	$t0, $t0, 1			# $t0 += 1
	
	# LOOP:
	j	while
	
	
foundx:
	la	$v0, ($t0)
	jr	$ra
	
notfound:
	li	$v0, -1
	jr	$ra

# $a0 – The starting memory address of the string. This address will be placed in the register by the main program which calls your procedure.
# $t0 - The index for pointing to the memory address of each character in string
# $t2 - Holds character 'x' to check conditional in while loop
# $t3 - Holds character '\0' to check conditional in while loop
# $t4 - Holds individual character in string to check conditional in while loop
# $v0 – The result (a valid address or the constant -1).
# $ra – The return address for the procedure. The instruction jr $ra will use to go back to the caller with