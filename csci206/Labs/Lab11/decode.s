	.file	1 "decode.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.option	pic0

	.comm	p,4,4
	.rdata
	.align	2
$LC0:
	.ascii	"&main = %p\012\000"
	.align	2
$LC1:
	.ascii	"&i = %p\012\000"
	.align	2
$LC2:
	.ascii	"&j = %p\012\000"
	.align	2
$LC3:
	.ascii	"&k = %p\012\000"
	.align	2
$LC4:
	.ascii	"&buf[%d] = %p\012\000"
	.align	2
$LC5:
	.ascii	"\012---------------- Memory dump starts\000"
	.align	2
$LC6:
	.ascii	"%p: 0x%02x\012\000"
	.align	2
$LC7:
	.ascii	"---------------- Memory dump ends\000"
	.text
	.align	2
	.globl	test
	.set	nomips16
	.ent	test
	.type	test, @function
test:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	sw	$6,56($fp)
	sw	$7,60($fp)
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
	move	$4,$2
	lui	$2,%hi(main)
	addiu	$5,$2,%lo(main)
	jal	printf
	nop

	lui	$2,%hi($LC1)
	addiu	$3,$2,%lo($LC1)
	addiu	$2,$fp,64
	move	$4,$3
	move	$5,$2
	jal	printf
	nop

	lui	$2,%hi($LC2)
	addiu	$3,$2,%lo($LC2)
	addiu	$2,$fp,68
	move	$4,$3
	move	$5,$2
	jal	printf
	nop

	lui	$2,%hi($LC3)
	addiu	$3,$2,%lo($LC3)
	addiu	$2,$fp,36
	move	$4,$3
	move	$5,$2
	jal	printf
	nop

	sw	$0,36($fp)
	j	$L2
	nop

$L3:
	lui	$2,%hi($LC4)
	addiu	$4,$2,%lo($LC4)
	lw	$3,36($fp)
	lw	$2,36($fp)
	addiu	$5,$fp,24
	addu	$2,$5,$2
	move	$5,$3
	move	$6,$2
	jal	printf
	nop

	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L2:
	lw	$2,36($fp)
	slt	$2,$2,12
	bne	$2,$0,$L3
	nop

	lui	$2,%hi($LC5)
	addiu	$4,$2,%lo($LC5)
	jal	puts
	nop

	addiu	$2,$fp,36
	addiu	$2,$2,-32
	lui	$3,%hi(p)
	sw	$2,%lo(p)($3)
	j	$L4
	nop

$L5:
	lui	$2,%hi($LC6)
	addiu	$4,$2,%lo($LC6)
	lui	$2,%hi(p)
	lw	$3,%lo(p)($2)
	lui	$2,%hi(p)
	lw	$2,%lo(p)($2)
	lbu	$2,0($2)
	move	$5,$3
	move	$6,$2
	jal	printf
	nop

	lui	$2,%hi(p)
	lw	$2,%lo(p)($2)
	addiu	$3,$2,1
	lui	$2,%hi(p)
	sw	$3,%lo(p)($2)
$L4:
	addiu	$2,$fp,64
	addiu	$2,$2,32
	lui	$3,%hi(p)
	lw	$3,%lo(p)($3)
	sltu	$2,$3,$2
	bne	$2,$0,$L5
	nop

	lui	$2,%hi($LC7)
	addiu	$4,$2,%lo($LC7)
	jal	puts
	nop

	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	test
	.size	test, .-test
	.rdata
	.align	2
$LC8:
	.ascii	"Decoding a stack frame\000"
	.align	2
$LC9:
	.ascii	"======================\012\000"
	.align	2
$LC10:
	.ascii	"size of an integer in bytes = %ld\012\000"
	.align	2
$LC11:
	.ascii	"size of a pointer in bytes = %ld\012\012\000"
	.align	2
$LC12:
	.ascii	"&p = %p\012\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 0, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	li	$2,11			# 0xb
	sw	$2,16($sp)
	li	$2,12			# 0xc
	sw	$2,20($sp)
	li	$4,1			# 0x1
	li	$5,2			# 0x2
	li	$6,3			# 0x3
	li	$7,4			# 0x4
	jal	test
	nop

	lui	$2,%hi($LC8)
	addiu	$4,$2,%lo($LC8)
	jal	puts
	nop

	lui	$2,%hi($LC9)
	addiu	$4,$2,%lo($LC9)
	jal	puts
	nop

	lui	$2,%hi($LC10)
	addiu	$2,$2,%lo($LC10)
	move	$4,$2
	li	$5,4			# 0x4
	jal	printf
	nop

	lui	$2,%hi($LC11)
	addiu	$2,$2,%lo($LC11)
	move	$4,$2
	li	$5,4			# 0x4
	jal	printf
	nop

	lui	$2,%hi($LC12)
	addiu	$2,$2,%lo($LC12)
	move	$4,$2
	lui	$2,%hi(p)
	addiu	$5,$2,%lo(p)
	jal	printf
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
