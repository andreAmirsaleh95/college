.global __start
.text

__start:

li $v0, 4
li $a0, 0x00800000
syscall
nop
nop
nop
li $v0, 10
syscall
