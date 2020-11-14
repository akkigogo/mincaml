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
f.24:
	jr	$ra
g.33:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$s7, 4($s7)
	addi	$a1, $a1, -1
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	lw	$s6, 0($s7)
	jr	$s6
ack.26:
	lw	$a3, 4($s7)
	sw	$a2, 0($sp)
	sltia	$s0, $a0, 1
	beq	$zero, $s0, bne_else.63
	addi	$a0, $a1, 1
	j	bne_cont.64
bne_else.63:
	sltia	$s0, $a1, 1
	beq	$zero, $s0, bne_else.65
	addi	$a0, $a0, -1
	addi	$a1, $zero, 1
	add	$a2, $zero, $a3
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s6, 0($s7)
	lahi	$ra, tmp.67
	lalo	$ra, tmp.67
	jr	$s6
tmp.67:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	j	bne_cont.66
bne_else.65:
	add	$t0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t1, g.33
	lalo	$t1, g.33
	sw	$t1, 0($t0)
	sw	$a0, 12($t0)
	sw	$a3, 8($t0)
	sw	$s7, 4($t0)
	addi	$a1, $a1, -1
	add	$a2, $zero, $t0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s6, 0($s7)
	lahi	$ra, tmp.68
	lalo	$ra, tmp.68
	jr	$s6
tmp.68:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
bne_cont.66:
bne_cont.64:
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
ack2.15:
	add	$a3, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t0, f.24
	lalo	$t0, f.24
	sw	$t0, 0($a3)
	add	$s7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t0, ack.26
	lalo	$t0, ack.26
	sw	$t0, 0($s7)
	sw	$a3, 4($s7)
	sw	$a2, 0($sp)
	add	$a2, $zero, $a3
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s6, 0($s7)
	lahi	$ra, tmp.69
	lalo	$ra, tmp.69
	jr	$s6
tmp.69:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
pr.19:
	j	min_caml_print_int
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
	add	$a2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$a0, pr.19
	lalo	$a0, pr.19
	sw	$a0, 0($a2)
	addi	$a0, $zero, 3
	addi	$a1, $zero, 10
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	ack2.15
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
