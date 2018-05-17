.text
.global one_half_single
.global one_half_double
.global f2u
.global d2u
.global u2f
.global u2d
.align 2    # word align

# one_half_single is a function
# that loads a signle precision float
# from memory and returns the loaded
# value to the caller.
one_half_single:
    la $t0, ohs
    l.s $f0, 0($t0)
    jr $ra
    nop

# one_half_doubel is a function
# that loads a double precision float
# from memory and returns the loaded
# value to the caller.
one_half_double:
    la $t0, ohd
    l.d $f0, 0($t0)
    jr $ra
    nop
    

# f2u is a function that converts a
# float to an unsigned integer
f2u:
	mfc1	$v0, $f12
	jr	$ra
	nop
	
d2u:
	mfc1	$v0, $f13
	mfc1	$v1, $f12
	jr	$ra
	nop
	
u2f:
	mtc1	$a0, $f0
	mfc1	$v0, $f12
	jr	$ra
	nop

u2d:
	mtc1	$a0, $f0
	mfc1	$v0, $f12
	jr	$ra



.data
.align 2    # word align
# the single precision float
ohs:    .word 0x3f000000

.align 3    # double word align
# the double precision float
ohd:    .word 0x3fe00000
        .word 0x00000000

