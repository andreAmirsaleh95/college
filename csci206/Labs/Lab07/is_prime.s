.text
.global is_prime
is_prime: # int is_prime(int n)
# t0 is i
# t1 is n - 1
# t2 is n % i
	li	$t0, 2
	addi	$t1, $a0, -1
is_prime_loop: # for ( i = 2; i <= n - 1; i++ ) {
	bgt	$t0, $t1, is_prime_return1
	nop
	div	$t2, $a0, $t0		# t2 = n / i
	mfhi	$t2			# t2 = n % i
	beqz	$t2, is_prime_return0	# if ( n % i == 0 ) { return 0; }
	nop
	
	# iterate:
	addi	$t0, $t0, 1		# i += 1
	j	is_prime_loop		# loop
	nop

is_prime_return0:
	li	$v0, 0
	jr	$ra
	nop

is_prime_return1:
	li	$v0, 1
	jr	$ra
	nop
	
