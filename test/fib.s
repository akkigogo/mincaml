	j	_min_caml_start
min_caml_create_array:
	addi	$s1, $a0, 0
	addi	$a0, $gp, 0
create_array_loop:
	bne	$s1, $zero, create_array_cont
	jr	$ra
create_array_cont:
	sw	$a1, 0($gp)
	addi	$s1, $s1, -1
	addi	$gp, $gp, 4
	j	create_array_loop
min_caml_create_float_array:
	addi	$s1, $a0, 0
	addi	$a0, $gp, 0
create_float_array_loop:
	bne	$s1, $zero, create_float_array_cont
	jr	$ra
create_float_array_cont:
	swc1	$f0, 0($gp)
	addi	$s1, $s1, -1
	addi	$gp, $gp, 4
	j	create_float_array_loop
min_caml_sin:
	lui	$s1, 16576
	mtc1	$s1, $f30
	add.s	$f29, $f0, $fzero
	mul.s	$f29, $f29, $f0
	mul.s	$f29, $f29, $f0
	div.s	$f29, $f29, $f30
	sub.s	$f0, $f0, $f29
	jr	$ra
min_caml_cos:
	lui	$s1, 16256
	mtc1	$s1, $f30
	lui	$s1, 16128
	mtc1	$s1, $f29
	add.s	$f0, $f0, $f0
	mul.s	$f0, $f0, $f29
	sub.s	$f0, $f30, $f0
	jr	$ra
min_caml_atan:
	lui	$s1, 16448
	mtc1	$s1, $f30
	add.s	$f29, $f0, $fzero
	mul.s	$f29, $f29, $f0
	mul.s	$f29, $f29, $f0
	div.s	$f29, $f29, $f30
	sub.s	$f0, $f0, $f29
	jr	$ra
min_caml_abs_float:
	c.lt.s	$s0, $f0, $fzero
	bne	$s0, $zero, minus
	jr	$ra
minus:
	sub.s	$f0, $fzero, $f0
	jr	$ra
fib.10:
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$s0, $f0, $f1
	beq	$s0, $zero, bne_else.24
	jr	$ra
bne_else.24:
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	sub.s	$f1, $f0, $f1
	swc1	$f0, 0($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fib.10
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lwc1	$f2, 0($sp)
	sub.s	$f1, $f2, $f1
	swc1	$f0, 8($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fib.10
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 8($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
	lui	$s1, 16672
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fib.10
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_float
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
