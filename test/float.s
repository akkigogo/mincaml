	j	_min_caml_start
_min_caml_start:
	addi	$sp, $sp, 4096
	lui	$f0, 140737488339268
	ori	$f0, $f0, 52429
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_abs_float
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_sqrt
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_cos
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_sin
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lui	$f1, 16528
	ori	$f1, $f1, 0
	add.s	$f0, $f0, $f1
	lui	$f1, 16961
	ori	$f1, $f1, 13186
	sub.s	$f0, $f0, $f1
	lui	$a0, 15
	ori	$a0, $a0, 16960
	stfd	$f0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lfd	$f1, 0($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_int_of_float
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_print_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
