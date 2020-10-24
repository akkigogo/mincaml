	j	_min_caml_start
fib.10:
	slti	$s0, $a0, 2
	beq	$zero, $s0, bne_else.24
	jr	$ra
bne_else.24:
	addi	$a1, $a0, -1
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fib.10
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	addi	$a1, $a1, -2
	sw	$a0, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fib.10
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	add	$a0, $a1, $a0
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 30
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fib.10
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
