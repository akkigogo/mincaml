	j	_min_caml_start
ack.15:
	slti	$s0, $a0, 1
	beq	$zero, $s0, bne_else.34
	addi	$a0, $a1, 1
	jr	$ra
bne_else.34:
	slti	$s0, $a1, 1
	beq	$zero, $s0, bne_else.35
	addi	$a0, $a0, -1
	addi	$a1, $zero, 1
	j	ack.15
bne_else.35:
	addi	$a2, $a0, -1
	addi	$a1, $a1, -1
	sw	$a2, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	ack.15
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	add	$a1, $a0, $zero
	lw	$a0, 0($sp)
	j	ack.15
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
	addi	$a0, $zero, 3
	addi	$a1, $zero, 10
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	ack.15
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
