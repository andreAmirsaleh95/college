.text

lui	$t0, 0x41

# Print value of $t0 = $v0 at line 36 in read_six_numbers:
move	$a0, $t0
move	$v0, $zero
addi	$v0, $v0, 1
syscall

