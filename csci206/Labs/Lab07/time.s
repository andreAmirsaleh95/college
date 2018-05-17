.data
.align 2

.text
.global add_second

add_second:
	# increment seconds
	lw	$t0, 0($a0)		# t0 is seconds
	addi	$t0, $t0, 1
	li	$t1, 60			# t1 is 60
	move	$s0, $t0
	div	$s0, $t1
	mfhi	$t2			# t2 is seconds % 60
	bnez	$t2, save_secs
	nop
	li	$t0, 0
	
	# increment minutes:
	lw	$t3, 4($a0)		# t3 is minutes
	addi	$t3, $t3, 1
	move	$s0, $t3
	li	$t1, 60			# t1 is 60
	div	$s0, $t1
	mfhi	$t4			# t4 is minutes % 60
	bnez	$t4, save_mins
	nop
	li	$t3, 0
	
	# increment hours
	lw	$t5, 8($a0)		# t5 is hours
	addi	$t5, $t5, 1
	li	$t6, 24			# t6 is 24
	move	$s0, $t5
	div	$s0, $t6
	mfhi	$t7			# t7 is hours % 24
	bnez	$t7, save_hrs
	nop
	li	$t7, 0
	
save_hrs:
	sw	$t7, 8($a0)

save_mins:
	sw	$t3, 4($a0)

save_secs:
	sw	$t0, 0($a0)
	
	# return 0:
	li	$v0, 0
	