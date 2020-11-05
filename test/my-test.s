	j	_min_caml_start
f.10:
	addi	$a0, $a0, 1
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
	addi	$a0, $zero, 2
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	f.10
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	slti	$s0, $a0, 2
	beq	$zero, $s0, bne_else.31
	addi	$a0, $zero, 1
	addi	$a1, $zero, 1
	add	$a2, $gp, $zero
	addi	$gp, $gp, 8
	sw	$a1, 4($a2)
	sw	$a0, 0($a2)
	add	$a0, $a2, $zero
	j	bne_cont.32
bne_else.31:
	addi	$a0, $zero, 0
	addi	$a1, $zero, 0
	add	$a2, $gp, $zero
	addi	$gp, $gp, 8
	sw	$a1, 4($a2)
	sw	$a0, 0($a2)
	add	$a0, $a2, $zero
bne_cont.32:
	lw	$a1, 4($a0)
	lw	$a0, 0($a0)
	add	$a0, $a0, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
