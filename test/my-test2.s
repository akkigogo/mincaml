	j	_min_caml_start
_min_caml_start:
	addi	$sp, $sp, 4096
	lui	f0, 16128
	ori	f0, f0, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_float
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
