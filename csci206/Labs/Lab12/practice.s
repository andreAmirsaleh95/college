.data
.align 2
pin: .asciiz "1234"

.text
la	$a0, pin
#addi	$v0, $v0, 4
#syscall
lb	$t1, 0($t2)