	j	_min_caml_start
g.16:
	lw	$a1, 12(r30)
	lw	$a2, 8(r30)
	lw	$a3, 4(r30)
	add	$a2, $a3, $a2
	add	$a1, $a2, $a1
	add	$a0, $a1, $a0
	jr	$ra
f.8:
	add	r30, r4, $zero
	addi	r4, r4, 16
	lis	$a3, ha16(g.16)
	addi	$a3, $a3, lo16(g.16)
	sw	$a3, 0(r30)
	sw	$a2, 12(r30)
	sw	$a1, 8(r30)
	sw	$a0, 4(r30)
	addi	$a0, $zero, 4
	lw	r29, 0(r30)
	mtctr	r29
	bctr
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 1
	addi	$a1, $zero, 2
	addi	$a2, $zero, 3
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	f.8
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
