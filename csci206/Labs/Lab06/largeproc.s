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
# This program demonstrates passing a large number of arguments to a
# procedure which is not a leaf procedure.

	.data
	.align 2
A:	.word 3
B:	.word 7
C:	.word 4
D:	.word 9
E:	.word 3
F:	.word 8
Result1:.word 0xDEADBEEF
Result2:.word 0xDEADBEEF
newline: .asciiz "\n"

	.text

# The main() procedure calls largeProc, storing the results into
# Result1 and Result2 and also printing them out to the terminal.

main:

# Prepare arguments to pass to largeProc
	lw	$a0, A
	lw	$a1, B
	lw	$a2, C
	lw	$a3, D
	lw	$t0, E
	addi	$sp, $sp, -8
	sw	$t0, 0($sp)
	lw	$t0, F
	sw	$t0, 4($sp)
	
# Call largeProc
	jal	largeProc

# Print the results returned from largeProc
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	li	$v0, 4
	la	$a0, newline
	syscall
	
 	move	$a0, $v1
	li	$v0, 1
	syscall

# The program is finished. Terminate the execution.
	addi	$v0, $zero, 10		# system call for exit
	syscall

# This large complicated procedure takes 6 paramters and returns 2.
# Additionally this procedure calls another procedure.
# It is assumed that $fp has been set correctly

largeProc:

# your code goes here
	
	# Store registers which must be saved onto the stack
	lw	$t0, 0($sp)		# $t0 = p4
	lw	$t1, 4($sp)		# $t1 = p5
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	# Compute the first result
	add	$v0, $a1, $a2
	add	$v0, $v0, $t0

	# Compute the second result
	sub	$v1, $a0, $a3		# $v1 = p0 - p3
	add	$v1, $v1, $t1		# $v1 = $v1 + p5
	

	# Call smallProc for the heck of it, but save $v0,
	# and $v1 because smallProc could possibly overwrite them!
	addi	$sp, $sp, -8
	sw	$v0, ($sp)
	sw	$v1, 4($sp)
	jal	smallProc

	# Restore registers using the stack
	lw	$v0, ($sp)
	lw	$v1, 4($sp)
	addi	$sp, $sp, 8
	lw      $ra, 0($sp)
	addi    $sp, $sp, 4
	jr	$ra

# This procedure computes nothing useful, it just returns

smallProc:

	jr	$ra
	
	
# Solution description: I pass p4 and p5 into largeProc() using the stack. In largeProc(), I store those 2 values into temporary registers so that I can use them.
# Then, I allocate another 4 bytes (1 word) of space to the stack so that I can save largeProc's return address which is stored in $ra for now. I did this
# because calling smallProc() will overwrite $ra so that smallProc() returns to the spot from which it was called (in this case, at the end of largeProc).
# At this point in largeProc, I calculate result1 and result2 and store them in $v0 and $v1 respectively. Before calling smallProc and returning to main,
# I allocate more space to the stack and store $v0 and $v1 on the stack because calling smallProc might alter those registers. Before returning (using jr $ra),
# I grab $v0 and $v1 off the stack and then deallocate that space on the stack. Finally, I grab $ra (my return address) from the stack and deallocate that space
# before returning to main.
	
	
	
		
