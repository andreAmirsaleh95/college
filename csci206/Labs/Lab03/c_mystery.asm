	.file	1 "c_mystery.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 16, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$fp,28($sp)
	move	$fp,$sp
	li	$2,-559087616			# 0xffffffffdead0000
	ori	$2,$2,0xbeef
	sw	$2,16($fp)
	li	$2,89			# 0x59
	sw	$2,20($fp)
	sw	$0,8($fp)
	sw	$0,12($fp)
	.option	pic0
	j	$L2
	nop

	.option	pic2
$L3:
	lw	$3,12($fp)
	lw	$2,8($fp)
	nop
	addu	$2,$3,$2
	sw	$2,12($fp)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)
$L2:
	lw	$2,8($fp)
	nop
	slt	$2,$2,11
	bne	$2,$0,$L3
	nop

	lw	$2,12($fp)
	nop
	sw	$2,20($fp)
	move	$sp,$fp
	lw	$fp,28($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Buildroot 2012.11.1) 4.6.3"
