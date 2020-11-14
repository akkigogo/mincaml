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
dbl.38:
	add.s	$f0, $f0, $f0
	jr	$ra
iloop.54:
	bne	$a0, $zero, bne_else.112
	addi	$a0, $zero, 1
	j	min_caml_print_int
bne_else.112:
	sub.s	$f2, $f2, $f3
	add.s	$f2, $f2, $f4
	swc1	$f4, 0($sp)
	sw	$a0, 8($sp)
	swc1	$f2, 16($sp)
	swc1	$f5, 24($sp)
	swc1	$f1, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	dbl.38
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f5, 24($sp)
	add.s	$f1, $f0, $f5
	lwc1	$f0, 16($sp)
	mul.s	$f2, $f0, $f0
	mul.s	$f3, $f1, $f1
	add.s	$f4, $f2, $f3
	lui	$s1, 16512
	ori	$s1, $s1, 0
	mtc1	%$f6, $f6
	c.lt.s	$f4, $f6
	beq	$zero, $s0, bne_else.114
	lw	$a0, 8($sp)
	addi	$a0, $a0, -1
	lwc1	$f4, 0($sp)
	j	iloop.54
bne_else.114:
	addi	$a0, $zero, 0
	j	min_caml_print_int
xloop.44:
	slti	$s0, $a0, 400
	beq	$zero, $s0, bne_else.115
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	itof	$f0, $a0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	dbl.38
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lui	$s1, 17352
	ori	$s1, $s1, 0
	mtc1	%$f1, $f1
	div.s	$f0, $f0, $f1
	lui	$s1, 16320
	ori	$s1, $s1, 0
	mtc1	%$f1, $f1
	sub.s	$f0, $f0, $f1
	lw	$a0, 4($sp)
	swc1	$f0, 8($sp)
	itof	$f0, $a0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	dbl.38
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lui	$s1, 17352
	ori	$s1, $s1, 0
	mtc1	%$f1, $f1
	div.s	$f0, $f0, $f1
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	%$f1, $f1
	sub.s	$f5, $f0, $f1
	addi	$a0, $zero, 1000
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	%$f0, $f0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	%$f1, $f1
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	%$f2, $f2
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	%$f3, $f3
	lwc1	$f4, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	iloop.54
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	j	xloop.44
bne_else.115:
	jr	$ra
yloop.40:
	slti	$s0, $a0, 400
	beq	$zero, $s0, bne_else.117
	addi	$a1, $zero, 0
	sw	$a0, 0($sp)
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	xloop.44
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	j	yloop.40
bne_else.117:
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
	addi	$a0, $zero, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	yloop.40
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
