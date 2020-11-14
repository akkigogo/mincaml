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
	bne	$s1, $zero, create_flaot_array_cont
	jr	$ra
create_array_cont:
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
f.12:
	addi	$a0, $zero, 123
	jr	$ra
g.14:
	addi	$a0, $zero, 456
	jr	$ra
h.16:
	addi	$a0, $zero, 789
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	f.12
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	slti	$s0, $a0, 1
	beq	$zero, $s0, bne_else.30
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	g.14
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	add	$a0, $a0, $a1
	j	bne_cont.31
bne_else.30:
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	h.16
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	sub	$a0, $a0, $a1
bne_cont.31:
	add	$a0, $a0, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
