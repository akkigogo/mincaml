	j	_min_caml_start
f.10:
	lw	$a1, 4(r30)
	sub	$a0, $a0, $a1
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 3
	add	r30, r4, $zero
	addi	r4, r4, 8
	lis	$a1, ha16(f.10)
	addi	$a1, $a1, lo16(f.10)
	sw	$a1, 0(r30)
	sw	$a0, 4(r30)
	addi	$a0, $zero, 7
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$ra, 0(r30)
	mtctr	r31
	bctrl
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 3
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_f
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	add	$a0, $a1, $a0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
