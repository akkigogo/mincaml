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
min_caml_int_of_float:
g.52:
	lw	$a1, 40($s7)
	lw	$a2, 36($s7)
	lw	$a3, 32($s7)
	lw	$t0, 28($s7)
	lw	$t1, 24($s7)
	lw	$t2, 20($s7)
	lw	$t3, 16($s7)
	lw	$t4, 12($s7)
	lw	$t5, 8($s7)
	lw	$t6, 4($s7)
	add	$t4, $t6, $t4
	add	$t3, $t4, $t3
	add	$t2, $t3, $t2
	add	$t1, $t2, $t1
	add	$t0, $t1, $t0
	add	$a3, $t0, $a3
	add	$a2, $a3, $a2
	add	$a1, $a2, $a1
	add	$a1, $a1, $t5
	slti	$s0, $a0, 1
	beq	$zero, $s0, bne_else.90
	sub	$a0, $zero, $a0
	lw	$s6, 0($s7)
	jr	$s6
bne_else.90:
	add	$a0, $a1, $zero
	jr	$ra
h.26:
	lw	$a1, 36($a0)
	lw	$a2, 32($a0)
	lw	$a3, 28($a0)
	lw	$t0, 24($a0)
	lw	$t1, 20($a0)
	lw	$t2, 16($a0)
	lw	$t3, 12($a0)
	lw	$t4, 8($a0)
	lw	$t5, 4($a0)
	lw	$a0, 0($a0)
	add	$s7, $gp, $zero
	addi	$gp, $gp, 48
	lahi	$t6, g.52
	lalo	$t6, g.52
	sw	$t6, 0($s7)
	sw	$a2, 40($s7)
	sw	$a3, 36($s7)
	sw	$t0, 32($s7)
	sw	$t1, 28($s7)
	sw	$t2, 24($s7)
	sw	$t3, 20($s7)
	sw	$t4, 16($s7)
	sw	$t5, 12($s7)
	sw	$a1, 8($s7)
	sw	$a0, 4($s7)
	addi	$a0, $zero, 1
	lw	$s6, 0($s7)
	jr	$s6
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
	addi	$a0, $zero, 1
	addi	$a1, $zero, 2
	addi	$a2, $zero, 3
	addi	$a3, $zero, 4
	addi	$t0, $zero, 5
	addi	$t1, $zero, 6
	addi	$t2, $zero, 7
	addi	$t3, $zero, 8
	addi	$t4, $zero, 9
	addi	$t5, $zero, 10
	add	$t6, $gp, $zero
	addi	$gp, $gp, 40
	sw	$t5, 36($t6)
	sw	$t4, 32($t6)
	sw	$t3, 28($t6)
	sw	$t2, 24($t6)
	sw	$t1, 20($t6)
	sw	$t0, 16($t6)
	sw	$a3, 12($t6)
	sw	$a2, 8($t6)
	sw	$a1, 4($t6)
	sw	$a0, 0($t6)
	add	$a0, $t6, $zero
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	h.26
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_newline
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
