.global __start		# export start symbol
.text

__start:	        # define entry point for gcc
li $a0, 7
li $a1, 2
jal fibonacci
nop
move $a0, $v0
li $v0, 1
syscall
nop
li $v0, 10
syscall



fibonacci:
addi $sp, $sp, -12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0
li $v0, 1 # return value for terminal condition
ble $s0, $a1, exit # check terminal condition
nop
addi $a0, $s0, -1 # set args for recursive call to f(n-1)

jal fibonacci
nop
move $s1, $v0 # store result of f(n-1) to s1
addi $a0, $s0, -2 # set args for recursive call to f(n-2)
jal fibonacci
nop
add $v0, $s1, $v0 # add result of f(n-1) to it
exit:

lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
jr $ra
nop
