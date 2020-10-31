	j	_min_caml_start
f.6:
	lw	$a1, 4($s7)
	addi	$a2, $zero, 1
	sll	$a0, $a0, 2
	add	$s1, $a1, $a2
	sw	$a2, 0($s1)
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 2
	addi	$a1, $zero, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	add	$s7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$a1, f.6
	lalo	$a1, f.6
	sw	$a1, 0($s7)
	sw	$a0, 4($s7)
	addi	$a0, $zero, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s6, 0($s7)
	lahi	$ra, tmp.19
	lalo	$ra, tmp.19
	jr	$s6
tmp.19:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
