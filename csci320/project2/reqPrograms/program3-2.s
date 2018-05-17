.global __start
.text

__start:
li $t1, 1
li $t2, 2
add $t3, $t1, $t2
li $v0, 1
move $a0, $t3
syscall         #should give 3
li $t3, 0 # t3 = 0
move $a0, $t3
syscall         #should give 0
addiu $t3, $t1, 1
move $a0, $t3
syscall         #should give 2
addu $t3, $t1, $t2
move $a0, $t3
syscall         #should give 3
nop
andi $t3, $t1, 0 #should give 0
move $a0, $t3
nop
nop
syscall         #should give 0
nop
nop
and $t3, $t1, $t2
move $a0, $t3
syscall #should give 3
nop
beq $t1, $t2, branch #should not take branch
nop
nop
li $a0, 0
syscall #should give 0
beqz $t1, branch #should not take
nop
nop
li $a0, 1
syscall #should give 1
bne $t1, $t1, branch #should not take
nop
nop
li $a0, 2
syscall #should give 2
bnez $t1, branch #should take
nop
nop

back:
li $a0, 10 #should give 10
syscall
addi $sp , $sp, -4
li $t1, 3 # stores 3 in t1
sw $t1, 0($sp)
lui $t1, 4
lw $t1, 0($sp)
move $a0, $t1
syscall #should print 3
li $t1,3
ori $t3, $t1, 1
move $a0, $t3
syscall #should print 3
li $t1, 3
li $t2, 2
sub $t3, $t1, $t2
move $a0, $t3
syscall # should print 1
li $t4, 4
nop
nop
sll $t3, $t4, 1 #multiplys by 2
move $a0, $t3
syscall #should print 8  ***sometimes doesnt print corrrectly***
li $t0, 0
li $t1, 1
or $t3, $t0, $t1
move $a0, $t3
syscall #should print 1
jal linker
nop
li $v0, 10
nop
nop
nop
nop
nop
syscall


branch:
nop
li $a0, 3
syscall #should give 3
j back
nop


linker:
nop
li $t3, 2
move $a0, $t3
syscall #should print 2
jr $ra

# instructions used:
# li /
# addi /
# add /
# addiu /
# andi /
# and /
# beq /
# nop /
# beqz /
# bne
# bnez
# j  /
# sw /
# lui /
# lw /
# ori /
# move /
# nor /
# lbu  /
# sub /
# sll /
# or /
# syscall /
# jal /
# jr /


 /*
 should print the following output
 3
 0
 2
 3
 0
 0
 0
 1
 2
 3
 10
 3
 1
 1
 2
 */
