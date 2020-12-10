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
kernel_sin:
	lui	$s1, 15914
	ori	$s1, $s1, 43692
	mtc1	$s1, $f1
	mul.s	$f1, $f1, $f0
	mul.s	$f1, $f1, $f0
	mul.s	$f1, $f1, $f0
	sub.s	$f1, $f0, $f1
	lui	$s1, 15368
	ori	$s1, $s1, 34406
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	add.s	$f1, $f1, $f2
	lui	$s1, 14669
	ori	$s1, $s1, 25781
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f0, $f2, $f0
	sub.s	$f0, $f1, $f0
	jr	$ra
kernel_cos:
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lui	$s1, 16128
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	sub.s	$f1, $f1, $f2
	lui	$s1, 15658
	ori	$s1, $s1, 42889
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	add.s	$f1, $f1, $f2
	lui	$s1, 15027
	ori	$s1, $s1, 33023
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f0, $f2, $f0
	sub.s	$f0, $f1, $f0
	jr	$ra
minus_sin:
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	sub.s	$f0, $fzero, $f0
	lahi	$ra, tmp.sin_148
	lalo	$ra, tmp.sin_148
min_caml_sin:
	c.lt.s	$s0, $f0, $fzero
	bne	$s0, $zero, minus_sin
	lui	$s1, 16457
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	c.lt.s	$s0, $f0, $f1
	beq	$s0, $zero, bne_else.sin_145
	lui	$s1, 16329
	ori	$s1, $s1, 4059
	mtc1	$s1, $f2
	c.lt.s	$s0, $f0, $f2
	beq	$s0, $zero, bne_else.sin_146
	lui	$s1, 16201
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	c.lt.s	$s0, $f1, $f0
	beq	$s0, $zero, bne_else.sin_147
	lui	$s1, 16329
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	sub.s	$f0, $f1, $f0
	j	kernel_cos
bne_else.sin_147:
	j	kernel_sin
bne_else.sin_146:
	sub.s	$f0, $f1, $f0
	j	min_caml_sin
	bne_else.sin_145:
	sub.s	$f0, $f0, $f1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lahi	$ra, tmp.sin_148
	lalo	$ra, tmp.sin_148
	j	min_caml_sin
tmp.sin_148:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sub.s	$f0, $fzero, $f0
	jr	$ra
minus_cos:
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	sub.s	$f0, $fzero, $f0
	lahi	$ra, tmp.cos_137
	lalo	$ra, tmp.cos_137
min_caml_cos:
	c.lt.s	$s0, $f0, $fzero
	bne	$s0, $zero, minus_cos
	lui	$s1, 16457
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	c.lt.s	$s0, $f0, $f1
	beq	$s0, $zero, bne_else.cos_134
	lui	$s1, 16329
	ori	$s1, $s1, 4059
	mtc1	$s1, $f2
	c.lt.s	$s0, $f0, $f2
	beq	$s0, $zero, bne_else.cos_135
	lui	$s1, 16201
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	c.lt.s	$s0, $f1, $f0
	beq	$s0, $zero, bne_else.cos_136
	lui	$s1, 16329
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	sub.s	$f0, $f1, $f0
	j	kernel_sin
bne_else.cos_136:
	j	kernel_cos
bne_else.cos_135:
	sub.s	$f0, $f1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lahi	$ra, tmp.cos_137
	lalo	$ra, tmp.cos_137
	j	min_caml_cos
tmp.cos_137:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sub.s	$f0, $fzero, $f0
	jr	$ra
bne_else.cos_134:
	sub.s	$f0, $f0, $f1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lahi	$ra, tmp.cos_137
	lalo	$ra, tmp.cos_137
	j	min_caml_cos
kernel_atan:
	lui	$s1, 16042
	ori	$s1, $s1, 43690
	mtc1	$s1, $f1
	mul.s	$f1, $f1, $f0
	mul.s	$f1, $f1, $f0
	mul.s	$f1, $f1, $f0
	sub.s	$f1, $f0, $f1
	lui	$s1, 15948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	add.s	$f1, $f1, $f2
	lui	$s1, 15890
	ori	$s1, $s1, 18725
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	sub.s	$f1, $f1, $f2
	lui	$s1, 15843
	ori	$s1, $s1, 36408
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	add.s	$f1, $f1, $f2
	lui	$s1, 15799
	ori	$s1, $s1, 54894
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	sub.s	$f1, $f1, $f2
	lui	$s1, 15733
	ori	$s1, $s1, 59331
	mtc1	$s1, $f2
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f2, $f2, $f0
	mul.s	$f0, $f2, $f0
	add.s	$f0, $f1, $f0
	jr	$ra
min_caml_atan:
	c.lt.s	$s0, $f0, $fzero
	beq	$s0, $zero, bne_else_atan.165
	sub.s	$f0, $fzero, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_atan
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sub.s	$f0, $fzero, $f0
	jr	$ra
bne_else_atan.165:
	lui	$s1, 16096
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$s0, $f0, $f1
	beq	$s0, $zero, bne_else_atan.166
	j	kernel_atan
bne_else_atan.166:
	lui	$s1, 16412
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$s0, $f0, $f1
	beq	$s0, $zero, bne_else_atan.167
	lui	$s1, 16201
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	sub.s	$f2, $f0, $f2
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f3
	add.s	$f0, $f0, $f3
	div.s	$f0, $f2, $f0
	swc1	$f1, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	kernel_atan
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lwc1	$f1, 0($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
bne_else_atan.167:
	lui	$s1, 16329
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	div.s	$f0, $f2, $f0
	swc1	$f1, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	kernel_atan
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 8($sp)
	sub.s	$f0, $f1, $f0
	jr	$ra
min_caml_fabs:
	c.lt.s	$s0, $f0, $fzero
	bne	$s0, $zero, minus
	jr	$ra
minus:
	sub.s	$f0, $fzero, $f0
	jr	$ra
xor.2473:
	bne	$a0, $zero, bne_else.8619
	add	$a0, $a1, $zero
	jr	$ra
bne_else.8619:
	bne	$a1, $zero, bne_else.8620
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8620:
	addi	$a0, $zero, 0
	jr	$ra
sgn.2476:
	swc1	$f0, 0($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, bne_else.8621
	lwc1	$f0, 0($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, bne_else.8622
	lui	$s1, -16512
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	jr	$ra
bne_else.8622:
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	jr	$ra
bne_else.8621:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	jr	$ra
fneg_cond.2478:
	bne	$a0, $zero, bne_else.8623
	sub.s	$f0, $fzero, $f0
	jr	$ra
bne_else.8623:
	jr	$ra
add_mod5.2481:
	add	$a0, $a0, $a1
	slti	$s0, $a0, 5
	beq	$s0, $zero, bne_else.8624
	jr	$ra
bne_else.8624:
	addi	$a0, $a0, -5
	jr	$ra
vecset.2484:
	swc1	$f0, 0($a0)
	swc1	$f1, 4($a0)
	swc1	$f2, 8($a0)
	jr	$ra
vecfill.2489:
	swc1	$f0, 0($a0)
	swc1	$f0, 4($a0)
	swc1	$f0, 8($a0)
	jr	$ra
vecbzero.2492:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	vecfill.2489
veccpy.2494:
	lwc1	$f0, 0($a1)
	swc1	$f0, 0($a0)
	lwc1	$f0, 4($a1)
	swc1	$f0, 4($a0)
	lwc1	$f0, 8($a1)
	swc1	$f0, 8($a0)
	jr	$ra
vecunit_sgn.2502:
	lwc1	$f0, 0($a0)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	mul.s	$f0, $f0, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 4($a0)
	swc1	$f0, 8($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 8($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	swc1	$f0, 16($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 16($sp)
	add.s	$f0, $f1, $f0
	sqrt	$f0, $f0
	swc1	$f0, 24($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8628
	lw	$a0, 0($sp)
	bne	$a0, $zero, beq_else.8630
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 24($sp)
	div.s	$f0, $f0, $f1
	j	beq_cont.8631
beq_else.8630:
	lui	$s1, -16512
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 24($sp)
	div.s	$f0, $f0, $f1
beq_cont.8631:
	j	beq_cont.8629
beq_else.8628:
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8629:
	lw	$a0, 4($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 0($a0)
	lwc1	$f1, 4($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 4($a0)
	lwc1	$f1, 8($a0)
	mul.s	$f0, $f1, $f0
	swc1	$f0, 8($a0)
	jr	$ra
veciprod.2505:
	lwc1	$f0, 0($a0)
	lwc1	$f1, 0($a1)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 4($a0)
	lwc1	$f2, 4($a1)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwc1	$f1, 8($a0)
	lwc1	$f2, 8($a1)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	jr	$ra
veciprod2.2508:
	lwc1	$f3, 0($a0)
	mul.s	$f0, $f3, $f0
	lwc1	$f3, 4($a0)
	mul.s	$f1, $f3, $f1
	add.s	$f0, $f0, $f1
	lwc1	$f1, 8($a0)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	jr	$ra
vecaccum.2513:
	lwc1	$f1, 0($a0)
	lwc1	$f2, 0($a1)
	mul.s	$f2, $f0, $f2
	add.s	$f1, $f1, $f2
	swc1	$f1, 0($a0)
	lwc1	$f1, 4($a0)
	lwc1	$f2, 4($a1)
	mul.s	$f2, $f0, $f2
	add.s	$f1, $f1, $f2
	swc1	$f1, 4($a0)
	lwc1	$f1, 8($a0)
	lwc1	$f2, 8($a1)
	mul.s	$f0, $f0, $f2
	add.s	$f0, $f1, $f0
	swc1	$f0, 8($a0)
	jr	$ra
vecadd.2517:
	lwc1	$f0, 0($a0)
	lwc1	$f1, 0($a1)
	add.s	$f0, $f0, $f1
	swc1	$f0, 0($a0)
	lwc1	$f0, 4($a0)
	lwc1	$f1, 4($a1)
	add.s	$f0, $f0, $f1
	swc1	$f0, 4($a0)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 8($a1)
	add.s	$f0, $f0, $f1
	swc1	$f0, 8($a0)
	jr	$ra
vecscale.2523:
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 0($a0)
	lwc1	$f1, 4($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 4($a0)
	lwc1	$f1, 8($a0)
	mul.s	$f0, $f1, $f0
	swc1	$f0, 8($a0)
	jr	$ra
vecaccumv.2526:
	lwc1	$f0, 0($a0)
	lwc1	$f1, 0($a1)
	lwc1	$f2, 0($a2)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	swc1	$f0, 0($a0)
	lwc1	$f0, 4($a0)
	lwc1	$f1, 4($a1)
	lwc1	$f2, 4($a2)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	swc1	$f0, 4($a0)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 8($a1)
	lwc1	$f2, 8($a2)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	swc1	$f0, 8($a0)
	jr	$ra
o_texturetype.2530:
	lw	$a0, 0($a0)
	jr	$ra
o_form.2532:
	lw	$a0, 4($a0)
	jr	$ra
o_reflectiontype.2534:
	lw	$a0, 8($a0)
	jr	$ra
o_isinvert.2536:
	lw	$a0, 24($a0)
	jr	$ra
o_isrot.2538:
	lw	$a0, 12($a0)
	jr	$ra
o_param_a.2540:
	lw	$a0, 16($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_param_b.2542:
	lw	$a0, 16($a0)
	lwc1	$f0, 4($a0)
	jr	$ra
o_param_c.2544:
	lw	$a0, 16($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_param_abc.2546:
	lw	$a0, 16($a0)
	jr	$ra
o_param_x.2548:
	lw	$a0, 20($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_param_y.2550:
	lw	$a0, 20($a0)
	lwc1	$f0, 4($a0)
	jr	$ra
o_param_z.2552:
	lw	$a0, 20($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_diffuse.2554:
	lw	$a0, 28($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_hilight.2556:
	lw	$a0, 28($a0)
	lwc1	$f0, 4($a0)
	jr	$ra
o_color_red.2558:
	lw	$a0, 32($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_color_green.2560:
	lw	$a0, 32($a0)
	lwc1	$f0, 4($a0)
	jr	$ra
o_color_blue.2562:
	lw	$a0, 32($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_param_r1.2564:
	lw	$a0, 36($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_param_r2.2566:
	lw	$a0, 36($a0)
	lwc1	$f0, 4($a0)
	jr	$ra
o_param_r3.2568:
	lw	$a0, 36($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_param_ctbl.2570:
	lw	$a0, 40($a0)
	jr	$ra
p_rgb.2572:
	lw	$a0, 0($a0)
	jr	$ra
p_intersection_points.2574:
	lw	$a0, 4($a0)
	jr	$ra
p_surface_ids.2576:
	lw	$a0, 8($a0)
	jr	$ra
p_calc_diffuse.2578:
	lw	$a0, 12($a0)
	jr	$ra
p_energy.2580:
	lw	$a0, 16($a0)
	jr	$ra
p_received_ray_20percent.2582:
	lw	$a0, 20($a0)
	jr	$ra
p_group_id.2584:
	lw	$a0, 24($a0)
	lw	$a0, 0($a0)
	jr	$ra
p_set_group_id.2586:
	lw	$a0, 24($a0)
	sw	$a1, 0($a0)
	jr	$ra
p_nvectors.2589:
	lw	$a0, 28($a0)
	jr	$ra
d_vec.2591:
	lw	$a0, 0($a0)
	jr	$ra
d_const.2593:
	lw	$a0, 4($a0)
	jr	$ra
r_surface_id.2595:
	lw	$a0, 0($a0)
	jr	$ra
r_dvec.2597:
	lw	$a0, 4($a0)
	jr	$ra
r_bright.2599:
	lwc1	$f0, 8($a0)
	jr	$ra
rad.2601:
	lui	$s1, 15502
	ori	$s1, $s1, 64053
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	jr	$ra
read_screen_settings.2603:
	lw	$a0, 20($s7)
	lw	$a1, 16($s7)
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sw	$a0, 0($sp)
	sw	$a2, 4($sp)
	sw	$a3, 8($sp)
	sw	$a1, 12($sp)
	sw	$t0, 16($sp)
	readf	$f0
	lw	$a0, 16($sp)
	swc1	$f0, 0($a0)
	readf	$f0
	lw	$a0, 16($sp)
	swc1	$f0, 4($a0)
	readf	$f0
	lw	$a0, 16($sp)
	swc1	$f0, 8($a0)
	readf	$f0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.2601
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_cos
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	swc1	$f0, 32($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_sin
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	swc1	$f0, 40($sp)
	readf	$f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2601
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	swc1	$f0, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_cos
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	swc1	$f0, 56($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_sin
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 32($sp)
	mul.s	$f2, $f1, $f0
	lui	$s1, 17224
	ori	$s1, $s1, 0
	mtc1	$s1, $f3
	mul.s	$f2, $f2, $f3
	lw	$a0, 12($sp)
	swc1	$f2, 0($a0)
	lui	$s1, -15544
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	lwc1	$f3, 40($sp)
	mul.s	$f2, $f3, $f2
	swc1	$f2, 4($a0)
	lwc1	$f2, 56($sp)
	mul.s	$f4, $f1, $f2
	lui	$s1, 17224
	ori	$s1, $s1, 0
	mtc1	$s1, $f5
	mul.s	$f4, $f4, $f5
	swc1	$f4, 8($a0)
	lw	$a1, 8($sp)
	swc1	$f2, 0($a1)
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f4
	swc1	$f4, 4($a1)
	sub.s	$f4, $fzero, $f0
	swc1	$f4, 8($a1)
	sub.s	$f3, $fzero, $f3
	mul.s	$f0, $f3, $f0
	lw	$a1, 4($sp)
	swc1	$f0, 0($a1)
	sub.s	$f0, $fzero, $f1
	swc1	$f0, 4($a1)
	mul.s	$f0, $f3, $f2
	swc1	$f0, 8($a1)
	lw	$a1, 16($sp)
	lwc1	$f0, 0($a1)
	lwc1	$f1, 0($a0)
	sub.s	$f0, $f0, $f1
	lw	$a2, 0($sp)
	swc1	$f0, 0($a2)
	lwc1	$f0, 4($a1)
	lwc1	$f1, 4($a0)
	sub.s	$f0, $f0, $f1
	swc1	$f0, 4($a2)
	lwc1	$f0, 8($a1)
	lwc1	$f1, 8($a0)
	sub.s	$f0, $f0, $f1
	swc1	$f0, 8($a2)
	jr	$ra
read_light.2605:
	lw	$a0, 8($s7)
	lw	$a1, 4($s7)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	readi	$a0
	readf	$f0
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	rad.2601
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	swc1	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_sin
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sub.s	$f0, $fzero, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 4($a0)
	readf	$f0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.2601
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 8($sp)
	swc1	$f0, 16($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_cos
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_sin
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 16($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_cos
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	readf	$f0
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	jr	$ra
rotate_quadratic_matrix.2607:
	lwc1	$f0, 0($a1)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_cos
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 0($a0)
	swc1	$f0, 8($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_sin
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 4($a0)
	swc1	$f0, 16($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_cos
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 4($a0)
	swc1	$f0, 24($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_sin
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	swc1	$f0, 32($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_cos
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	swc1	$f0, 40($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_sin
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 24($sp)
	mul.s	$f3, $f2, $f1
	lwc1	$f4, 32($sp)
	lwc1	$f5, 16($sp)
	mul.s	$f6, $f5, $f4
	mul.s	$f7, $f6, $f1
	lwc1	$f8, 8($sp)
	mul.s	$f9, $f8, $f0
	sub.s	$f7, $f7, $f9
	mul.s	$f9, $f8, $f4
	mul.s	$f10, $f9, $f1
	mul.s	$f11, $f5, $f0
	add.s	$f10, $f10, $f11
	mul.s	$f11, $f2, $f0
	mul.s	$f6, $f6, $f0
	mul.s	$f12, $f8, $f1
	add.s	$f6, $f6, $f12
	mul.s	$f0, $f9, $f0
	mul.s	$f1, $f5, $f1
	sub.s	$f0, $f0, $f1
	sub.s	$f1, $fzero, $f4
	mul.s	$f4, $f5, $f2
	mul.s	$f2, $f8, $f2
	lw	$a0, 0($sp)
	lwc1	$f5, 0($a0)
	lwc1	$f8, 4($a0)
	lwc1	$f9, 8($a0)
	swc1	$f3, 48($sp)
	swc1	$f2, 56($sp)
	swc1	$f0, 64($sp)
	swc1	$f10, 72($sp)
	swc1	$f4, 80($sp)
	swc1	$f6, 88($sp)
	swc1	$f7, 96($sp)
	swc1	$f9, 104($sp)
	swc1	$f1, 112($sp)
	swc1	$f8, 120($sp)
	swc1	$f11, 128($sp)
	swc1	$f5, 136($sp)
	add.s	$f0, $fzero, $f3
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 128($sp)
	swc1	$f0, 144($sp)
	add.s	$f0, $fzero, $f2
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 120($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 144($sp)
	add.s	$f0, $f2, $f0
	lwc1	$f2, 112($sp)
	swc1	$f0, 152($sp)
	add.s	$f0, $fzero, $f2
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 104($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 152($sp)
	add.s	$f0, $f2, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 96($sp)
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 88($sp)
	swc1	$f0, 160($sp)
	add.s	$f0, $fzero, $f2
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 120($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 160($sp)
	add.s	$f0, $f2, $f0
	lwc1	$f2, 80($sp)
	swc1	$f0, 168($sp)
	add.s	$f0, $fzero, $f2
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 104($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 168($sp)
	add.s	$f0, $f2, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 4($a0)
	lwc1	$f0, 72($sp)
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 64($sp)
	swc1	$f0, 176($sp)
	add.s	$f0, $fzero, $f2
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 120($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 176($sp)
	add.s	$f0, $f2, $f0
	lwc1	$f2, 56($sp)
	swc1	$f0, 184($sp)
	add.s	$f0, $fzero, $f2
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 104($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 184($sp)
	add.s	$f0, $f2, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 8($a0)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f2, 96($sp)
	lwc1	$f3, 136($sp)
	mul.s	$f4, $f3, $f2
	lwc1	$f5, 72($sp)
	mul.s	$f4, $f4, $f5
	lwc1	$f6, 88($sp)
	lwc1	$f7, 120($sp)
	mul.s	$f8, $f7, $f6
	lwc1	$f9, 64($sp)
	mul.s	$f8, $f8, $f9
	add.s	$f4, $f4, $f8
	lwc1	$f8, 80($sp)
	mul.s	$f10, $f1, $f8
	lwc1	$f11, 56($sp)
	mul.s	$f10, $f10, $f11
	add.s	$f4, $f4, $f10
	mul.s	$f0, $f0, $f4
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f4, 48($sp)
	mul.s	$f3, $f3, $f4
	mul.s	$f4, $f3, $f5
	lwc1	$f5, 128($sp)
	mul.s	$f5, $f7, $f5
	mul.s	$f7, $f5, $f9
	add.s	$f4, $f4, $f7
	lwc1	$f7, 112($sp)
	mul.s	$f1, $f1, $f7
	mul.s	$f7, $f1, $f11
	add.s	$f4, $f4, $f7
	mul.s	$f0, $f0, $f4
	swc1	$f0, 4($a0)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	mul.s	$f2, $f3, $f2
	mul.s	$f3, $f5, $f6
	add.s	$f2, $f2, $f3
	mul.s	$f1, $f1, $f8
	add.s	$f1, $f2, $f1
	mul.s	$f0, $f0, $f1
	swc1	$f0, 8($a0)
	jr	$ra
read_nth_object.2610:
	lw	$a1, 4($s7)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	readi	$a0
	addi	$s1, $zero, -1
	bne	$a0, $s1, bne_else.8642
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8642:
	sw	$a0, 8($sp)
	readi	$a0
	sw	$a0, 12($sp)
	readi	$a0
	sw	$a0, 16($sp)
	readi	$a0
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 20($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_float_array
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	sw	$a0, 24($sp)
	readf	$f0
	lw	$a0, 24($sp)
	swc1	$f0, 0($a0)
	readf	$f0
	lw	$a0, 24($sp)
	swc1	$f0, 4($a0)
	readf	$f0
	lw	$a0, 24($sp)
	swc1	$f0, 8($a0)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_float_array
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	sw	$a0, 28($sp)
	readf	$f0
	lw	$a0, 28($sp)
	swc1	$f0, 0($a0)
	readf	$f0
	lw	$a0, 28($sp)
	swc1	$f0, 4($a0)
	readf	$f0
	lw	$a0, 28($sp)
	swc1	$f0, 8($a0)
	readf	$f0
	c.lt.s	$a0, $f0, $fzero
	addi	$a1, $zero, 2
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 32($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_create_float_array
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	sw	$a0, 36($sp)
	readf	$f0
	lw	$a0, 36($sp)
	swc1	$f0, 0($a0)
	readf	$f0
	lw	$a0, 36($sp)
	swc1	$f0, 4($a0)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	add	$a0, $zero, $a1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_float_array
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	sw	$a0, 40($sp)
	readf	$f0
	lw	$a0, 40($sp)
	swc1	$f0, 0($a0)
	readf	$f0
	lw	$a0, 40($sp)
	swc1	$f0, 4($a0)
	readf	$f0
	lw	$a0, 40($sp)
	swc1	$f0, 8($a0)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	add	$a0, $zero, $a1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_float_array
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a1, 20($sp)
	bne	$a1, $zero, beq_else.8643
	j	beq_cont.8644
beq_else.8643:
	sw	$a0, 44($sp)
	readf	$f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2601
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 0($a0)
	readf	$f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2601
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 4($a0)
	readf	$f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2601
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 8($a0)
beq_cont.8644:
	lw	$a1, 12($sp)
	addi	$s1, $zero, 2
	bne	$a1, $s1, beq_else.8645
	addi	$a2, $zero, 1
	j	beq_cont.8646
beq_else.8645:
	lw	$a2, 32($sp)
beq_cont.8646:
	addi	$a3, $zero, 4
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a2, 48($sp)
	sw	$a0, 44($sp)
	add	$a0, $zero, $a3
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_create_float_array
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 48
	sw	$a0, 40($a1)
	lw	$a0, 44($sp)
	sw	$a0, 36($a1)
	lw	$a2, 40($sp)
	sw	$a2, 32($a1)
	lw	$a2, 36($sp)
	sw	$a2, 28($a1)
	lw	$a2, 48($sp)
	sw	$a2, 24($a1)
	lw	$a2, 28($sp)
	sw	$a2, 20($a1)
	lw	$a2, 24($sp)
	sw	$a2, 16($a1)
	lw	$a3, 20($sp)
	sw	$a3, 12($a1)
	lw	$t0, 16($sp)
	sw	$t0, 8($a1)
	lw	$t0, 12($sp)
	sw	$t0, 4($a1)
	lw	$t1, 8($sp)
	sw	$t1, 0($a1)
	lw	$t1, 4($sp)
	sll	$t1, $t1, 2
	lw	$t2, 0($sp)
	add	$s1, $t2, $t1
	sw	$a1, 0($s1)
	addi	$s1, $zero, 3
	bne	$t0, $s1, beq_else.8647
	lwc1	$f0, 0($a2)
	swc1	$f0, 56($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8650
	lwc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	sgn.2476
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	swc1	$f0, 64($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 64($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8651
beq_else.8650:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8651:
	lw	$a0, 24($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 4($a0)
	swc1	$f0, 72($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8652
	lwc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	sgn.2476
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	swc1	$f0, 80($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 80($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8653
beq_else.8652:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8653:
	lw	$a0, 24($sp)
	swc1	$f0, 4($a0)
	lwc1	$f0, 8($a0)
	swc1	$f0, 88($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8654
	lwc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	sgn.2476
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 88($sp)
	swc1	$f0, 96($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 96($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8655
beq_else.8654:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8655:
	lw	$a0, 24($sp)
	swc1	$f0, 8($a0)
	j	beq_cont.8648
beq_else.8647:
	addi	$s1, $zero, 2
	bne	$t0, $s1, beq_else.8656
	lw	$a1, 32($sp)
	bne	$a1, $zero, beq_else.8658
	addi	$a1, $zero, 1
	j	beq_cont.8659
beq_else.8658:
	addi	$a1, $zero, 0
beq_cont.8659:
	add	$a0, $zero, $a2
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	vecunit_sgn.2502
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	j	beq_cont.8657
beq_else.8656:
beq_cont.8657:
beq_cont.8648:
	lw	$a0, 20($sp)
	bne	$a0, $zero, beq_else.8660
	j	beq_cont.8661
beq_else.8660:
	lw	$a0, 24($sp)
	lw	$a1, 44($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	rotate_quadratic_matrix.2607
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
beq_cont.8661:
	addi	$a0, $zero, 1
	jr	$ra
read_object.2612:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	slti	$s0, $a0, 60
	beq	$s0, $zero, bne_else.8662
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a0, 8($sp)
	add	$s7, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8663
	lalo	$ra, tmp.8663
	jr	$s6
tmp.8663:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, bne_else.8664
	lw	$a0, 4($sp)
	lw	$a1, 8($sp)
	sw	$a1, 0($a0)
	jr	$ra
bne_else.8664:
	lw	$a0, 8($sp)
	addi	$a0, $a0, 1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8662:
	jr	$ra
read_all_object.2614:
	lw	$s7, 4($s7)
	addi	$a0, $zero, 0
	lw	$s6, 0($s7)
	jr	$s6
read_net_item.2616:
	sw	$a0, 0($sp)
	readi	$a0
	addi	$s1, $zero, -1
	bne	$a0, $s1, bne_else.8667
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	addi	$a1, $zero, -1
	j	min_caml_create_array
bne_else.8667:
	lw	$a1, 0($sp)
	addi	$a2, $a1, 1
	sw	$a0, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.2616
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 0($sp)
	sll	$a1, $a1, 2
	lw	$a2, 4($sp)
	add	$s1, $a0, $a1
	sw	$a2, 0($s1)
	jr	$ra
read_or_network.2618:
	addi	$a1, $zero, 0
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	read_net_item.2616
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	add	$a1, $a0, $zero
	lw	$a0, 0($a1)
	addi	$s1, $zero, -1
	bne	$a0, $s1, bne_else.8668
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	j	min_caml_create_array
bne_else.8668:
	lw	$a0, 0($sp)
	addi	$a2, $a0, 1
	sw	$a1, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_or_network.2618
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 0($sp)
	sll	$a1, $a1, 2
	lw	$a2, 4($sp)
	add	$s1, $a0, $a1
	sw	$a2, 0($s1)
	jr	$ra
read_and_network.2620:
	lw	$a1, 4($s7)
	addi	$a2, $zero, 0
	sw	$s7, 0($sp)
	sw	$a1, 4($sp)
	sw	$a0, 8($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.2616
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 0($a0)
	addi	$s1, $zero, -1
	bne	$a1, $s1, bne_else.8669
	jr	$ra
bne_else.8669:
	lw	$a1, 8($sp)
	sll	$a2, $a1, 2
	lw	$a3, 4($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	addi	$a0, $a1, 1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
read_parameter.2622:
	lw	$a0, 20($s7)
	lw	$a1, 16($s7)
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sw	$t0, 0($sp)
	sw	$a2, 4($sp)
	sw	$a3, 8($sp)
	sw	$a1, 12($sp)
	add	$s7, $zero, $a0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8671
	lalo	$ra, tmp.8671
	jr	$s6
tmp.8671:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$s7, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8672
	lalo	$ra, tmp.8672
	jr	$s6
tmp.8672:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$s7, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8673
	lalo	$ra, tmp.8673
	jr	$s6
tmp.8673:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a0, $zero, 0
	lw	$s7, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8674
	lalo	$ra, tmp.8674
	jr	$s6
tmp.8674:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a0, $zero, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	read_or_network.2618
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 0($sp)
	sw	$a0, 0($a1)
	jr	$ra
solver_rect_surface.2624:
	lw	$t1, 4($s7)
	sll	$t2, $a2, 2
	add	$s1, $a1, $t2
	lwc1	$f3, 0($s1)
	sw	$t1, 0($sp)
	swc1	$f2, 8($sp)
	sw	$t0, 16($sp)
	swc1	$f1, 24($sp)
	sw	$a3, 32($sp)
	swc1	$f0, 40($sp)
	sw	$a1, 48($sp)
	sw	$a2, 52($sp)
	sw	$a0, 56($sp)
	add.s	$f0, $fzero, $f3
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, bne_else.8679
	lw	$a0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_abc.2546
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a1, 56($sp)
	sw	$a0, 60($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_isinvert.2536
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 52($sp)
	sll	$a2, $a1, 2
	lw	$a3, 48($sp)
	add	$s1, $a3, $a2
	lwc1	$f0, 0($s1)
	sw	$a0, 64($sp)
	c.lt.s	$a0, $f0, $fzero
	add	$a1, $a0, $zero
	lw	$a0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	xor.2473
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 52($sp)
	sll	$a2, $a1, 2
	lw	$a3, 60($sp)
	add	$s1, $a3, $a2
	lwc1	$f0, 0($s1)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	fneg_cond.2478
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 40($sp)
	sub.s	$f0, $f0, $f1
	lw	$a0, 52($sp)
	sll	$a0, $a0, 2
	lw	$a1, 48($sp)
	add	$s1, $a1, $a0
	lwc1	$f1, 0($s1)
	div.s	$f0, $f0, $f1
	lw	$a0, 32($sp)
	sll	$a2, $a0, 2
	add	$s1, $a1, $a2
	lwc1	$f1, 0($s1)
	mul.s	$f1, $f0, $f1
	lwc1	$f2, 24($sp)
	add.s	$f1, $f1, $f2
	swc1	$f0, 72($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fabs
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lw	$a0, 32($sp)
	sll	$a0, $a0, 2
	lw	$a1, 60($sp)
	add	$s1, $a1, $a0
	lwc1	$f1, 0($s1)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, bne_else.8681
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8681:
	lw	$a0, 16($sp)
	sll	$a1, $a0, 2
	lw	$a2, 48($sp)
	add	$s1, $a2, $a1
	lwc1	$f0, 0($s1)
	lwc1	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 8($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fabs
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lw	$a0, 16($sp)
	sll	$a0, $a0, 2
	lw	$a1, 60($sp)
	add	$s1, $a1, $a0
	lwc1	$f1, 0($s1)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, bne_else.8682
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8682:
	lw	$a0, 0($sp)
	lwc1	$f0, 72($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8679:
	addi	$a0, $zero, 0
	jr	$ra
solver_rect.2633:
	lw	$s7, 4($s7)
	addi	$a2, $zero, 0
	addi	$a3, $zero, 1
	addi	$t0, $zero, 2
	swc1	$f0, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	sw	$a1, 24($sp)
	sw	$a0, 28($sp)
	sw	$s7, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8683
	lalo	$ra, tmp.8683
	jr	$s6
tmp.8683:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8684
	addi	$a2, $zero, 1
	addi	$a3, $zero, 2
	addi	$t0, $zero, 0
	lwc1	$f0, 16($sp)
	lwc1	$f1, 8($sp)
	lwc1	$f2, 0($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	lw	$s7, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8685
	lalo	$ra, tmp.8685
	jr	$s6
tmp.8685:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8686
	addi	$a2, $zero, 2
	addi	$a3, $zero, 0
	addi	$t0, $zero, 1
	lwc1	$f0, 8($sp)
	lwc1	$f1, 0($sp)
	lwc1	$f2, 16($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	lw	$s7, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8687
	lalo	$ra, tmp.8687
	jr	$s6
tmp.8687:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8688
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8688:
	addi	$a0, $zero, 3
	jr	$ra
bne_else.8686:
	addi	$a0, $zero, 2
	jr	$ra
bne_else.8684:
	addi	$a0, $zero, 1
	jr	$ra
solver_surface.2639:
	lw	$a2, 4($s7)
	sw	$a2, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	sw	$a1, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.2546
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add	$a1, $a0, $zero
	lw	$a0, 32($sp)
	sw	$a1, 36($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veciprod.2505
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	swc1	$f0, 40($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, bne_else.8690
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8690:
	lwc1	$f0, 24($sp)
	lwc1	$f1, 16($sp)
	lwc1	$f2, 8($sp)
	lw	$a0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	veciprod2.2508
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sub.s	$f0, $fzero, $f0
	lwc1	$f1, 40($sp)
	div.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
quadratic.2645:
	swc1	$f0, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	sw	$a0, 24($sp)
	mul.s	$f0, $f0, $f0
	lw	$a0, 24($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_a.2540
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 16($sp)
	swc1	$f0, 40($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lw	$a0, 24($sp)
	swc1	$f0, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_b.2542
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	lwc1	$f1, 8($sp)
	swc1	$f0, 56($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lw	$a0, 24($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_c.2544
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 24($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_isrot.2538
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, bne_else.8692
	lwc1	$f0, 72($sp)
	jr	$ra
bne_else.8692:
	lwc1	$f0, 8($sp)
	lwc1	$f1, 16($sp)
	mul.s	$f2, $f1, $f0
	lw	$a0, 24($sp)
	swc1	$f2, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_param_r1.2564
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lwc1	$f1, 80($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 72($sp)
	add.s	$f0, $f1, $f0
	lwc1	$f1, 0($sp)
	lwc1	$f2, 8($sp)
	mul.s	$f2, $f2, $f1
	lw	$a0, 24($sp)
	swc1	$f0, 88($sp)
	swc1	$f2, 96($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_r2.2566
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 96($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 88($sp)
	add.s	$f0, $f1, $f0
	lwc1	$f1, 16($sp)
	lwc1	$f2, 0($sp)
	mul.s	$f1, $f2, $f1
	lw	$a0, 24($sp)
	swc1	$f0, 104($sp)
	swc1	$f1, 112($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_param_r3.2568
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 104($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
bilinear.2650:
	mul.s	$f6, $f0, $f3
	swc1	$f3, 0($sp)
	swc1	$f0, 8($sp)
	swc1	$f5, 16($sp)
	swc1	$f2, 24($sp)
	sw	$a0, 32($sp)
	swc1	$f4, 40($sp)
	swc1	$f1, 48($sp)
	swc1	$f6, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_a.2540
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	mul.s	$f3, $f2, $f1
	lw	$a0, 32($sp)
	swc1	$f0, 64($sp)
	swc1	$f3, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_b.2542
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 64($sp)
	add.s	$f0, $f1, $f0
	lwc1	$f1, 16($sp)
	lwc1	$f2, 24($sp)
	mul.s	$f3, $f2, $f1
	lw	$a0, 32($sp)
	swc1	$f0, 80($sp)
	swc1	$f3, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_c.2544
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 88($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 80($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 32($sp)
	swc1	$f0, 96($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_isrot.2538
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	bne	$a0, $zero, bne_else.8694
	lwc1	$f0, 96($sp)
	jr	$ra
bne_else.8694:
	lwc1	$f0, 40($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f2, $f1, $f0
	lwc1	$f3, 16($sp)
	lwc1	$f4, 48($sp)
	mul.s	$f5, $f4, $f3
	add.s	$f2, $f2, $f5
	lw	$a0, 32($sp)
	swc1	$f2, 104($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_r1.2564
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f1, 104($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 16($sp)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f2, $f1
	lwc1	$f3, 0($sp)
	lwc1	$f4, 24($sp)
	mul.s	$f4, $f4, $f3
	add.s	$f1, $f1, $f4
	lw	$a0, 32($sp)
	swc1	$f0, 112($sp)
	swc1	$f1, 120($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	o_param_r2.2566
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	lwc1	$f1, 120($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 112($sp)
	add.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f2, $f1
	lwc1	$f2, 0($sp)
	lwc1	$f3, 48($sp)
	mul.s	$f2, $f3, $f2
	add.s	$f1, $f1, $f2
	lw	$a0, 32($sp)
	swc1	$f0, 128($sp)
	swc1	$f1, 136($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	o_param_r3.2568
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 128($sp)
	add.s	$f0, $f1, $f0
	lui	$s1, 16128
	mtc1	$s1, $f29
	mul.s	$f0, $f0, $f29
	lwc1	$f1, 96($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
solver_second.2658:
	lw	$a2, 4($s7)
	lwc1	$f3, 0($a1)
	lwc1	$f4, 4($a1)
	lwc1	$f5, 8($a1)
	sw	$a2, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	sw	$a0, 32($sp)
	sw	$a1, 36($sp)
	add.s	$f2, $fzero, $f5
	add.s	$f1, $fzero, $f4
	add.s	$f0, $fzero, $f3
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	quadratic.2645
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	swc1	$f0, 40($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, bne_else.8696
	lw	$a0, 36($sp)
	lwc1	$f0, 0($a0)
	lwc1	$f1, 4($a0)
	lwc1	$f2, 8($a0)
	lwc1	$f3, 24($sp)
	lwc1	$f4, 16($sp)
	lwc1	$f5, 8($sp)
	lw	$a0, 32($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	bilinear.2650
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 24($sp)
	lwc1	$f2, 16($sp)
	lwc1	$f3, 8($sp)
	lw	$a0, 32($sp)
	swc1	$f0, 48($sp)
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f2
	add.s	$f2, $fzero, $f3
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	quadratic.2645
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a0, 32($sp)
	swc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_form.2532
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8697
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8698
beq_else.8697:
	lwc1	$f0, 56($sp)
beq_cont.8698:
	lwc1	$f1, 48($sp)
	swc1	$f0, 64($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 64($sp)
	lwc1	$f2, 40($sp)
	mul.s	$f1, $f2, $f1
	sub.s	$f0, $f0, $f1
	swc1	$f0, 72($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, bne_else.8699
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8699:
	lwc1	$f0, 72($sp)
	sqrt	$f0, $f0
	lw	$a0, 32($sp)
	swc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_isinvert.2536
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, beq_else.8700
	lwc1	$f0, 80($sp)
	sub.s	$f0, $fzero, $f0
	j	beq_cont.8701
beq_else.8700:
	lwc1	$f0, 80($sp)
beq_cont.8701:
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f0, $f1
	lwc1	$f1, 40($sp)
	div.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8696:
	addi	$a0, $zero, 0
	jr	$ra
solver.2664:
	lw	$a3, 16($s7)
	lw	$t0, 12($s7)
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$a0, $a0, 2
	add	$s1, $t2, $a0
	lw	$a0, 0($s1)
	lwc1	$f0, 0($a2)
	sw	$t0, 0($sp)
	sw	$a3, 4($sp)
	sw	$a1, 8($sp)
	sw	$t1, 12($sp)
	sw	$a0, 16($sp)
	sw	$a2, 20($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_x.2548
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 20($sp)
	lwc1	$f1, 4($a0)
	lw	$a1, 16($sp)
	swc1	$f0, 32($sp)
	swc1	$f1, 40($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_y.2550
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 20($sp)
	lwc1	$f1, 8($a0)
	lw	$a0, 16($sp)
	swc1	$f0, 48($sp)
	swc1	$f1, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_z.2552
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_form.2532
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8702
	lwc1	$f0, 32($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 16($sp)
	lw	$a1, 8($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8702:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8703
	lwc1	$f0, 32($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 16($sp)
	lw	$a1, 8($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8703:
	lwc1	$f0, 32($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 16($sp)
	lw	$a1, 8($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
solver_rect_fast.2668:
	lw	$a3, 4($s7)
	lwc1	$f3, 0($a2)
	sub.s	$f3, $f3, $f0
	lwc1	$f4, 4($a2)
	mul.s	$f3, $f3, $f4
	lwc1	$f4, 4($a1)
	mul.s	$f4, $f3, $f4
	add.s	$f4, $f4, $f1
	sw	$a3, 0($sp)
	swc1	$f0, 8($sp)
	swc1	$f1, 16($sp)
	sw	$a2, 24($sp)
	swc1	$f2, 32($sp)
	swc1	$f3, 40($sp)
	sw	$a1, 48($sp)
	sw	$a0, 52($sp)
	add.s	$f0, $fzero, $f4
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fabs
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a0, 52($sp)
	swc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_b.2542
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 56($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8706
	addi	$a0, $zero, 0
	j	beq_cont.8707
beq_else.8706:
	lw	$a0, 48($sp)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 32($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fabs
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 52($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_c.2544
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 64($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8708
	addi	$a0, $zero, 0
	j	beq_cont.8709
beq_else.8708:
	lw	$a0, 24($sp)
	lwc1	$f0, 4($a0)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8710
	addi	$a0, $zero, 1
	j	beq_cont.8711
beq_else.8710:
	addi	$a0, $zero, 0
beq_cont.8711:
beq_cont.8709:
beq_cont.8707:
	bne	$a0, $zero, bne_else.8712
	lw	$a0, 24($sp)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 16($sp)
	sub.s	$f0, $f0, $f1
	lwc1	$f2, 12($a0)
	mul.s	$f0, $f0, $f2
	lw	$a1, 48($sp)
	lwc1	$f2, 0($a1)
	mul.s	$f2, $f0, $f2
	lwc1	$f3, 8($sp)
	add.s	$f2, $f2, $f3
	swc1	$f0, 72($sp)
	add.s	$f0, $fzero, $f2
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fabs
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lw	$a0, 52($sp)
	swc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_param_a.2540
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 80($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8713
	addi	$a0, $zero, 0
	j	beq_cont.8714
beq_else.8713:
	lw	$a0, 48($sp)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 32($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fabs
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 52($sp)
	swc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_c.2544
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 88($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8715
	addi	$a0, $zero, 0
	j	beq_cont.8716
beq_else.8715:
	lw	$a0, 24($sp)
	lwc1	$f0, 12($a0)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8717
	addi	$a0, $zero, 1
	j	beq_cont.8718
beq_else.8717:
	addi	$a0, $zero, 0
beq_cont.8718:
beq_cont.8716:
beq_cont.8714:
	bne	$a0, $zero, bne_else.8719
	lw	$a0, 24($sp)
	lwc1	$f0, 16($a0)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f0, $f1
	lwc1	$f1, 20($a0)
	mul.s	$f0, $f0, $f1
	lw	$a1, 48($sp)
	lwc1	$f1, 0($a1)
	mul.s	$f1, $f0, $f1
	lwc1	$f2, 8($sp)
	add.s	$f1, $f1, $f2
	swc1	$f0, 96($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fabs
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lw	$a0, 52($sp)
	swc1	$f0, 104($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_a.2540
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 104($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8720
	addi	$a0, $zero, 0
	j	beq_cont.8721
beq_else.8720:
	lw	$a0, 48($sp)
	lwc1	$f0, 4($a0)
	lwc1	$f1, 96($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 16($sp)
	add.s	$f0, $f0, $f2
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_fabs
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lw	$a0, 52($sp)
	swc1	$f0, 112($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_param_b.2542
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 112($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8722
	addi	$a0, $zero, 0
	j	beq_cont.8723
beq_else.8722:
	lw	$a0, 24($sp)
	lwc1	$f0, 20($a0)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8724
	addi	$a0, $zero, 1
	j	beq_cont.8725
beq_else.8724:
	addi	$a0, $zero, 0
beq_cont.8725:
beq_cont.8723:
beq_cont.8721:
	bne	$a0, $zero, bne_else.8726
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8726:
	lw	$a0, 0($sp)
	lwc1	$f0, 96($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 3
	jr	$ra
bne_else.8719:
	lw	$a0, 0($sp)
	lwc1	$f0, 72($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 2
	jr	$ra
bne_else.8712:
	lw	$a0, 0($sp)
	lwc1	$f0, 40($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
solver_surface_fast.2675:
	lw	$a0, 4($s7)
	lwc1	$f3, 0($a1)
	sw	$a0, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	sw	$a1, 32($sp)
	add.s	$f0, $fzero, $f3
	c.lt.s	$a0, $f0, $fzero
	bne	$a0, $zero, bne_else.8728
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8728:
	lw	$a0, 32($sp)
	lwc1	$f0, 4($a0)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 8($a0)
	lwc1	$f2, 16($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwc1	$f1, 12($a0)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
solver_second_fast.2681:
	lw	$a2, 4($s7)
	lwc1	$f3, 0($a1)
	sw	$a2, 0($sp)
	swc1	$f3, 8($sp)
	sw	$a0, 16($sp)
	swc1	$f2, 24($sp)
	swc1	$f1, 32($sp)
	swc1	$f0, 40($sp)
	sw	$a1, 48($sp)
	add.s	$f0, $fzero, $f3
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, bne_else.8731
	lw	$a0, 48($sp)
	lwc1	$f0, 4($a0)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f2, 8($a0)
	lwc1	$f3, 32($sp)
	mul.s	$f2, $f2, $f3
	add.s	$f0, $f0, $f2
	lwc1	$f2, 12($a0)
	lwc1	$f4, 24($sp)
	mul.s	$f2, $f2, $f4
	add.s	$f0, $f0, $f2
	lw	$a1, 16($sp)
	swc1	$f0, 56($sp)
	add	$a0, $zero, $a1
	add.s	$f2, $fzero, $f4
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f3
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	quadratic.2645
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_form.2532
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8733
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 64($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8734
beq_else.8733:
	lwc1	$f0, 64($sp)
beq_cont.8734:
	lwc1	$f1, 56($sp)
	swc1	$f0, 72($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 72($sp)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f2, $f1
	sub.s	$f0, $f0, $f1
	swc1	$f0, 80($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, bne_else.8735
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8735:
	lw	$a0, 16($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_isinvert.2536
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, beq_else.8736
	lwc1	$f0, 80($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 16($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	j	beq_cont.8737
beq_else.8736:
	lwc1	$f0, 80($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 16($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
beq_cont.8737:
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8731:
	addi	$a0, $zero, 0
	jr	$ra
solver_fast.2687:
	lw	$a3, 16($s7)
	lw	$t0, 12($s7)
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$t3, $a0, 2
	add	$s1, $t2, $t3
	lw	$t2, 0($s1)
	lwc1	$f0, 0($a2)
	sw	$t0, 0($sp)
	sw	$a3, 4($sp)
	sw	$t1, 8($sp)
	sw	$a0, 12($sp)
	sw	$a1, 16($sp)
	sw	$t2, 20($sp)
	sw	$a2, 24($sp)
	swc1	$f0, 32($sp)
	add	$a0, $zero, $t2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_x.2548
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 24($sp)
	lwc1	$f1, 4($a0)
	lw	$a1, 20($sp)
	swc1	$f0, 40($sp)
	swc1	$f1, 48($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_y.2550
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 24($sp)
	lwc1	$f1, 8($a0)
	lw	$a0, 20($sp)
	swc1	$f0, 56($sp)
	swc1	$f1, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_z.2552
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	d_const.2593
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lw	$a1, 12($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a1
	lw	$a0, 0($s1)
	lw	$a1, 20($sp)
	sw	$a0, 80($sp)
	add	$a0, $zero, $a1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_form.2532
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8739
	lw	$a0, 16($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	d_vec.2591
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	add	$a1, $a0, $zero
	lwc1	$f0, 40($sp)
	lwc1	$f1, 56($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 20($sp)
	lw	$a2, 80($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8739:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8740
	lwc1	$f0, 40($sp)
	lwc1	$f1, 56($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 20($sp)
	lw	$a1, 80($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8740:
	lwc1	$f0, 40($sp)
	lwc1	$f1, 56($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 20($sp)
	lw	$a1, 80($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
solver_surface_fast2.2691:
	lw	$a0, 4($s7)
	lwc1	$f0, 0($a1)
	sw	$a0, 0($sp)
	sw	$a2, 4($sp)
	sw	$a1, 8($sp)
	c.lt.s	$a0, $f0, $fzero
	bne	$a0, $zero, bne_else.8741
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8741:
	lw	$a0, 8($sp)
	lwc1	$f0, 0($a0)
	lw	$a0, 4($sp)
	lwc1	$f1, 12($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
solver_second_fast2.2698:
	lw	$a3, 4($s7)
	lwc1	$f3, 0($a1)
	sw	$a3, 0($sp)
	sw	$a0, 4($sp)
	swc1	$f3, 8($sp)
	sw	$a2, 16($sp)
	swc1	$f2, 24($sp)
	swc1	$f1, 32($sp)
	swc1	$f0, 40($sp)
	sw	$a1, 48($sp)
	add.s	$f0, $fzero, $f3
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, bne_else.8743
	lw	$a0, 48($sp)
	lwc1	$f0, 4($a0)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 8($a0)
	lwc1	$f2, 32($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwc1	$f1, 12($a0)
	lwc1	$f2, 24($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lw	$a1, 16($sp)
	lwc1	$f1, 12($a1)
	swc1	$f0, 56($sp)
	swc1	$f1, 64($sp)
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 64($sp)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f2, $f1
	sub.s	$f0, $f0, $f1
	swc1	$f0, 72($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, bne_else.8745
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8745:
	lw	$a0, 4($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_isinvert.2536
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, beq_else.8746
	lwc1	$f0, 72($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 16($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	j	beq_cont.8747
beq_else.8746:
	lwc1	$f0, 72($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 16($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
beq_cont.8747:
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8743:
	addi	$a0, $zero, 0
	jr	$ra
solver_fast2.2705:
	lw	$a2, 16($s7)
	lw	$a3, 12($s7)
	lw	$t0, 8($s7)
	lw	$t1, 4($s7)
	sll	$t2, $a0, 2
	add	$s1, $t1, $t2
	lw	$t1, 0($s1)
	sw	$a3, 0($sp)
	sw	$a2, 4($sp)
	sw	$t0, 8($sp)
	sw	$t1, 12($sp)
	sw	$a0, 16($sp)
	sw	$a1, 20($sp)
	add	$a0, $zero, $t1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_ctbl.2570
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f0, 0($a0)
	lwc1	$f1, 4($a0)
	lwc1	$f2, 8($a0)
	lw	$a1, 20($sp)
	sw	$a0, 24($sp)
	swc1	$f2, 32($sp)
	swc1	$f1, 40($sp)
	swc1	$f0, 48($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_const.2593
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a1, 16($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a1
	lw	$a0, 0($s1)
	lw	$a1, 12($sp)
	sw	$a0, 56($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_form.2532
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8749
	lw	$a0, 20($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.2591
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	add	$a1, $a0, $zero
	lwc1	$f0, 48($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 32($sp)
	lw	$a0, 12($sp)
	lw	$a2, 56($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8749:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8750
	lwc1	$f0, 48($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 32($sp)
	lw	$a0, 12($sp)
	lw	$a1, 56($sp)
	lw	$a2, 24($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8750:
	lwc1	$f0, 48($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 32($sp)
	lw	$a0, 12($sp)
	lw	$a1, 56($sp)
	lw	$a2, 24($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
setup_rect_table.2708:
	addi	$a2, $zero, 6
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 0($a1)
	sw	$a0, 8($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8751
	lw	$a0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.2536
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 0($a1)
	sw	$a0, 12($sp)
	c.lt.s	$a0, $f0, $fzero
	add	$a1, $a0, $zero
	lw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	xor.2473
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 0($sp)
	sw	$a0, 16($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.2540
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg_cond.2478
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 0($a0)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 4($sp)
	lwc1	$f1, 0($a1)
	div.s	$f0, $f0, $f1
	swc1	$f0, 4($a0)
	j	beq_cont.8752
beq_else.8751:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 4($a0)
beq_cont.8752:
	lw	$a1, 4($sp)
	lwc1	$f0, 4($a1)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8753
	lw	$a0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.2536
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 4($a1)
	sw	$a0, 20($sp)
	c.lt.s	$a0, $f0, $fzero
	add	$a1, $a0, $zero
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	xor.2473
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 0($sp)
	sw	$a0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.2542
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg_cond.2478
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 8($a0)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 4($sp)
	lwc1	$f1, 4($a1)
	div.s	$f0, $f0, $f1
	swc1	$f0, 12($a0)
	j	beq_cont.8754
beq_else.8753:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 12($a0)
beq_cont.8754:
	lw	$a1, 4($sp)
	lwc1	$f0, 8($a1)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8755
	lw	$a0, 0($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.2536
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 8($a1)
	sw	$a0, 28($sp)
	c.lt.s	$a0, $f0, $fzero
	add	$a1, $a0, $zero
	lw	$a0, 28($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	xor.2473
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 0($sp)
	sw	$a0, 32($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.2544
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg_cond.2478
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 16($a0)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 4($sp)
	lwc1	$f1, 8($a1)
	div.s	$f0, $f0, $f1
	swc1	$f0, 20($a0)
	j	beq_cont.8756
beq_else.8755:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 20($a0)
beq_cont.8756:
	jr	$ra
setup_surface_table.2711:
	addi	$a2, $zero, 4
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 0($sp)
	sw	$a0, 8($sp)
	swc1	$f0, 16($sp)
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_a.2540
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 4($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 24($sp)
	swc1	$f1, 32($sp)
	add	$a0, $zero, $a1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_b.2542
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 24($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	lw	$a0, 0($sp)
	swc1	$f0, 40($sp)
	swc1	$f1, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_c.2544
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	swc1	$f0, 56($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, beq_else.8758
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 0($a0)
	j	beq_cont.8759
beq_else.8758:
	lui	$s1, -16512
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 56($sp)
	div.s	$f0, $f0, $f1
	lw	$a0, 8($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_a.2540
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	div.s	$f0, $f0, $f1
	sub.s	$f0, $fzero, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 4($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_b.2542
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	div.s	$f0, $f0, $f1
	sub.s	$f0, $fzero, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_c.2544
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	div.s	$f0, $f0, $f1
	sub.s	$f0, $fzero, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 12($a0)
beq_cont.8759:
	jr	$ra
setup_second_table.2714:
	addi	$a2, $zero, 5
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 0($a1)
	lwc1	$f1, 4($a1)
	lwc1	$f2, 8($a1)
	lw	$a2, 0($sp)
	sw	$a0, 8($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	quadratic.2645
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 0($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 16($sp)
	swc1	$f1, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.2540
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	sub.s	$f0, $fzero, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 4($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 32($sp)
	swc1	$f1, 40($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_b.2542
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	sub.s	$f0, $fzero, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 48($sp)
	swc1	$f1, 56($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_c.2544
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	sub.s	$f0, $fzero, $f0
	lw	$a0, 8($sp)
	lwc1	$f1, 16($sp)
	swc1	$f1, 0($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 64($sp)
	add	$a0, $zero, $a1
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_isrot.2538
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	bne	$a0, $zero, beq_else.8761
	lw	$a0, 8($sp)
	lwc1	$f0, 32($sp)
	swc1	$f0, 4($a0)
	lwc1	$f0, 48($sp)
	swc1	$f0, 8($a0)
	lwc1	$f0, 64($sp)
	swc1	$f0, 12($a0)
	j	beq_cont.8762
beq_else.8761:
	lw	$a0, 4($sp)
	lwc1	$f0, 8($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 72($sp)
	add	$a0, $zero, $a1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_r2.2566
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 4($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 80($sp)
	swc1	$f1, 88($sp)
	add	$a0, $zero, $a1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_r3.2568
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 88($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 80($sp)
	add.s	$f0, $f1, $f0
	lui	$s1, 16128
	mtc1	$s1, $f29
	mul.s	$f0, $f0, $f29
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 4($a0)
	lw	$a1, 4($sp)
	lwc1	$f0, 8($a1)
	lw	$a2, 0($sp)
	swc1	$f0, 96($sp)
	add	$a0, $zero, $a2
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_r1.2564
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 96($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 0($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 104($sp)
	swc1	$f1, 112($sp)
	add	$a0, $zero, $a1
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_param_r3.2568
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 104($sp)
	add.s	$f0, $f1, $f0
	lui	$s1, 16128
	mtc1	$s1, $f29
	mul.s	$f0, $f0, $f29
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 4($sp)
	lwc1	$f0, 4($a1)
	lw	$a2, 0($sp)
	swc1	$f0, 120($sp)
	add	$a0, $zero, $a2
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	o_param_r1.2564
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	lwc1	$f1, 120($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 0($a0)
	lw	$a0, 0($sp)
	swc1	$f0, 128($sp)
	swc1	$f1, 136($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	o_param_r2.2566
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 128($sp)
	add.s	$f0, $f1, $f0
	lui	$s1, 16128
	mtc1	$s1, $f29
	mul.s	$f0, $f0, $f29
	lwc1	$f1, 64($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 12($a0)
beq_cont.8762:
	lwc1	$f0, 16($sp)
	c.eq.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8763
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 16($sp)
	div.s	$f0, $f0, $f1
	lw	$a0, 8($sp)
	swc1	$f0, 16($a0)
	j	beq_cont.8764
beq_else.8763:
beq_cont.8764:
	lw	$a0, 8($sp)
	jr	$ra
iter_setup_dirvec_constants.2717:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.8765
	jr	$ra
bne_else.8765:
	sll	$a3, $a1, 2
	add	$s1, $a2, $a3
	lw	$a2, 0($s1)
	sw	$s7, 0($sp)
	sw	$a1, 4($sp)
	sw	$a2, 8($sp)
	sw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_const.2593
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sw	$a0, 16($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_vec.2591
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 8($sp)
	sw	$a0, 20($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_form.2532
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, beq_else.8767
	lw	$a0, 20($sp)
	lw	$a1, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	setup_rect_table.2708
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	j	beq_cont.8768
beq_else.8767:
	addi	$s1, $zero, 2
	bne	$a0, $s1, beq_else.8769
	lw	$a0, 20($sp)
	lw	$a1, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	setup_surface_table.2711
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	j	beq_cont.8770
beq_else.8769:
	lw	$a0, 20($sp)
	lw	$a1, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	setup_second_table.2714
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
beq_cont.8770:
beq_cont.8768:
	addi	$a1, $a1, -1
	lw	$a0, 12($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
setup_dirvec_constants.2720:
	lw	$a1, 8($s7)
	lw	$s7, 4($s7)
	lw	$a1, 0($a1)
	addi	$a1, $a1, -1
	lw	$s6, 0($s7)
	jr	$s6
setup_startp_constants.2722:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.8771
	jr	$ra
bne_else.8771:
	sll	$a3, $a1, 2
	add	$s1, $a2, $a3
	lw	$a2, 0($s1)
	sw	$s7, 0($sp)
	sw	$a1, 4($sp)
	sw	$a0, 8($sp)
	sw	$a2, 12($sp)
	add	$a0, $zero, $a2
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_ctbl.2570
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sw	$a0, 16($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2532
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 8($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 12($sp)
	sw	$a0, 20($sp)
	swc1	$f0, 24($sp)
	add	$a0, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_x.2548
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 8($sp)
	lwc1	$f0, 4($a1)
	lw	$a2, 12($sp)
	swc1	$f0, 32($sp)
	add	$a0, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_y.2550
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 4($a0)
	lw	$a1, 8($sp)
	lwc1	$f0, 8($a1)
	lw	$a2, 12($sp)
	swc1	$f0, 40($sp)
	add	$a0, $zero, $a2
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_z.2552
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 20($sp)
	addi	$s1, $zero, 2
	bne	$a1, $s1, beq_else.8773
	lw	$a1, 12($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_abc.2546
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a1, 16($sp)
	lwc1	$f0, 0($a1)
	lwc1	$f1, 4($a1)
	lwc1	$f2, 8($a1)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	veciprod2.2508
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 12($a0)
	j	beq_cont.8774
beq_else.8773:
	addi	$a2, $zero, 2
	slt	$s0, $a2, $a1
	beq	$s0, $zero, bne_else.8775
	lwc1	$f0, 0($a0)
	lwc1	$f1, 4($a0)
	lwc1	$f2, 8($a0)
	lw	$a2, 12($sp)
	add	$a0, $zero, $a2
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	quadratic.2645
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 20($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8777
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	sub.s	$f0, $f0, $f1
	j	beq_cont.8778
beq_else.8777:
beq_cont.8778:
	lw	$a0, 16($sp)
	swc1	$f0, 12($a0)
	j	bne_cont.8776
bne_else.8775:
bne_cont.8776:
beq_cont.8774:
	lw	$a0, 4($sp)
	addi	$a1, $a0, -1
	lw	$a0, 8($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
setup_startp.2725:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	sw	$a0, 0($sp)
	sw	$a2, 4($sp)
	sw	$a3, 8($sp)
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	veccpy.2494
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 8($sp)
	lw	$a0, 0($a0)
	addi	$a1, $a0, -1
	lw	$a0, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
is_rect_outside.2727:
	swc1	$f2, 0($sp)
	swc1	$f1, 8($sp)
	sw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fabs
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_a.2540
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 24($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8780
	addi	$a0, $zero, 0
	j	beq_cont.8781
beq_else.8780:
	lwc1	$f0, 8($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fabs
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_b.2542
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 32($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8782
	addi	$a0, $zero, 0
	j	beq_cont.8783
beq_else.8782:
	lwc1	$f0, 0($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fabs
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_c.2544
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 40($sp)
	c.lt.s	$a0, $f0, $f1
beq_cont.8783:
beq_cont.8781:
	bne	$a0, $zero, bne_else.8784
	lw	$a0, 16($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.2536
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8785
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8785:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8784:
	lw	$a0, 16($sp)
	j	o_isinvert.2536
is_plane_outside.2732:
	sw	$a0, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.2546
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f0, 24($sp)
	lwc1	$f1, 16($sp)
	lwc1	$f2, 8($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veciprod2.2508
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 0($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.2536
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f0, 32($sp)
	sw	$a0, 40($sp)
	c.lt.s	$a0, $f0, $fzero
	add	$a1, $a0, $zero
	lw	$a0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	xor.2473
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	bne	$a0, $zero, bne_else.8787
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8787:
	addi	$a0, $zero, 0
	jr	$ra
is_second_outside.2737:
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	quadratic.2645
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	swc1	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2532
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8789
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 8($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8790
beq_else.8789:
	lwc1	$f0, 8($sp)
beq_cont.8790:
	lw	$a0, 0($sp)
	swc1	$f0, 16($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.2536
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f0, 16($sp)
	sw	$a0, 24($sp)
	c.lt.s	$a0, $f0, $fzero
	add	$a1, $a0, $zero
	lw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	xor.2473
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, bne_else.8791
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8791:
	addi	$a0, $zero, 0
	jr	$ra
is_outside.2742:
	swc1	$f2, 0($sp)
	swc1	$f1, 8($sp)
	sw	$a0, 16($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_x.2548
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_y.2550
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 8($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_z.2552
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 0($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_form.2532
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8793
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	lw	$a0, 16($sp)
	j	is_rect_outside.2727
bne_else.8793:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8794
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	lw	$a0, 16($sp)
	j	is_plane_outside.2732
bne_else.8794:
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	lw	$a0, 16($sp)
	j	is_second_outside.2737
check_all_inside.2747:
	lw	$a2, 4($s7)
	sll	$a3, $a0, 2
	add	$s1, $a1, $a3
	lw	$a3, 0($s1)
	addi	$s1, $zero, -1
	bne	$a3, $s1, bne_else.8795
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8795:
	sll	$a3, $a3, 2
	add	$s1, $a2, $a3
	lw	$a2, 0($s1)
	swc1	$f2, 0($sp)
	swc1	$f1, 8($sp)
	swc1	$f0, 16($sp)
	sw	$a1, 24($sp)
	sw	$s7, 28($sp)
	sw	$a0, 32($sp)
	add	$a0, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	is_outside.2742
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8796
	lw	$a0, 32($sp)
	addi	$a0, $a0, 1
	lwc1	$f0, 16($sp)
	lwc1	$f1, 8($sp)
	lwc1	$f2, 0($sp)
	lw	$a1, 24($sp)
	lw	$s7, 28($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8796:
	addi	$a0, $zero, 0
	jr	$ra
shadow_check_and_group.2753:
	lw	$a2, 28($s7)
	lw	$a3, 24($s7)
	lw	$t0, 20($s7)
	lw	$t1, 16($s7)
	lw	$t2, 12($s7)
	lw	$t3, 8($s7)
	lw	$t4, 4($s7)
	sll	$t5, $a0, 2
	add	$s1, $a1, $t5
	lw	$t5, 0($s1)
	addi	$s1, $zero, -1
	bne	$t5, $s1, bne_else.8797
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8797:
	sll	$t5, $a0, 2
	add	$s1, $a1, $t5
	lw	$t5, 0($s1)
	sw	$t4, 0($sp)
	sw	$t3, 4($sp)
	sw	$t2, 8($sp)
	sw	$a1, 12($sp)
	sw	$s7, 16($sp)
	sw	$a0, 20($sp)
	sw	$t0, 24($sp)
	sw	$t5, 28($sp)
	sw	$a3, 32($sp)
	add	$a1, $zero, $t1
	add	$a0, $zero, $t5
	add	$s7, $zero, $a2
	add	$a2, $zero, $t3
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8798
	lalo	$ra, tmp.8798
	jr	$s6
tmp.8798:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 32($sp)
	lwc1	$f0, 0($a1)
	swc1	$f0, 40($sp)
	bne	$a0, $zero, beq_else.8800
	addi	$a0, $zero, 0
	j	beq_cont.8801
beq_else.8800:
	lui	$s1, -16820
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
beq_cont.8801:
	bne	$a0, $zero, bne_else.8802
	lw	$a0, 28($sp)
	sll	$a0, $a0, 2
	lw	$a1, 24($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.2536
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8803
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8803:
	lw	$a0, 20($sp)
	addi	$a0, $a0, 1
	lw	$a1, 12($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8802:
	lui	$s1, 15395
	ori	$s1, $s1, 55050
	mtc1	$s1, $f0
	lwc1	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f1, $f0
	lw	$a1, 4($sp)
	lwc1	$f2, 0($a1)
	add.s	$f1, $f1, $f2
	lwc1	$f2, 4($a0)
	mul.s	$f2, $f2, $f0
	lwc1	$f3, 4($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 8($a0)
	mul.s	$f0, $f3, $f0
	lwc1	$f3, 8($a1)
	add.s	$f0, $f0, $f3
	addi	$a0, $zero, 0
	lw	$a1, 12($sp)
	lw	$s7, 0($sp)
	add.s	$f30, $fzero, $f2
	add.s	$f2, $fzero, $f0
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f30
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8804
	lalo	$ra, tmp.8804
	jr	$s6
tmp.8804:
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8805
	lw	$a0, 20($sp)
	addi	$a0, $a0, 1
	lw	$a1, 12($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8805:
	addi	$a0, $zero, 1
	jr	$ra
shadow_check_one_or_group.2756:
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	sll	$t0, $a0, 2
	add	$s1, $a1, $t0
	lw	$t0, 0($s1)
	addi	$s1, $zero, -1
	bne	$t0, $s1, bne_else.8806
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8806:
	sll	$t0, $t0, 2
	add	$s1, $a3, $t0
	lw	$a3, 0($s1)
	addi	$t0, $zero, 0
	sw	$a1, 0($sp)
	sw	$s7, 4($sp)
	sw	$a0, 8($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $t0
	add	$s7, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8807
	lalo	$ra, tmp.8807
	jr	$s6
tmp.8807:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, bne_else.8808
	lw	$a0, 8($sp)
	addi	$a0, $a0, 1
	lw	$a1, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8808:
	addi	$a0, $zero, 1
	jr	$ra
shadow_check_one_or_matrix.2759:
	lw	$a2, 20($s7)
	lw	$a3, 16($s7)
	lw	$t0, 12($s7)
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$t3, $a0, 2
	add	$s1, $a1, $t3
	lw	$t3, 0($s1)
	lw	$t4, 0($t3)
	addi	$s1, $zero, -1
	bne	$t4, $s1, bne_else.8809
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8809:
	sw	$t3, 0($sp)
	sw	$t0, 4($sp)
	sw	$a1, 8($sp)
	sw	$s7, 12($sp)
	sw	$a0, 16($sp)
	addi	$s1, $zero, 99
	bne	$t4, $s1, beq_else.8810
	addi	$a0, $zero, 1
	j	beq_cont.8811
beq_else.8810:
	sw	$a3, 20($sp)
	add	$a1, $zero, $t1
	add	$a0, $zero, $t4
	add	$s7, $zero, $a2
	add	$a2, $zero, $t2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8812
	lalo	$ra, tmp.8812
	jr	$s6
tmp.8812:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, beq_else.8813
	addi	$a0, $zero, 0
	j	beq_cont.8814
beq_else.8813:
	lw	$a0, 20($sp)
	lwc1	$f0, 0($a0)
	lui	$s1, -16948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8815
	addi	$a0, $zero, 0
	j	beq_cont.8816
beq_else.8815:
	addi	$a0, $zero, 1
	lw	$a1, 0($sp)
	lw	$s7, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8817
	lalo	$ra, tmp.8817
	jr	$s6
tmp.8817:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, beq_else.8818
	addi	$a0, $zero, 0
	j	beq_cont.8819
beq_else.8818:
	addi	$a0, $zero, 1
beq_cont.8819:
beq_cont.8816:
beq_cont.8814:
beq_cont.8811:
	bne	$a0, $zero, bne_else.8820
	lw	$a0, 16($sp)
	addi	$a0, $a0, 1
	lw	$a1, 8($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8820:
	addi	$a0, $zero, 1
	lw	$a1, 0($sp)
	lw	$s7, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8821
	lalo	$ra, tmp.8821
	jr	$s6
tmp.8821:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, bne_else.8822
	lw	$a0, 16($sp)
	addi	$a0, $a0, 1
	lw	$a1, 8($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8822:
	addi	$a0, $zero, 1
	jr	$ra
solve_each_element.2762:
	lw	$a3, 36($s7)
	lw	$t0, 32($s7)
	lw	$t1, 28($s7)
	lw	$t2, 24($s7)
	lw	$t3, 20($s7)
	lw	$t4, 16($s7)
	lw	$t5, 12($s7)
	lw	$t6, 8($s7)
	lw	$t7, 4($s7)
	sll	$t8, $a0, 2
	add	$s1, $a1, $t8
	lw	$t8, 0($s1)
	addi	$s1, $zero, -1
	bne	$t8, $s1, bne_else.8823
	jr	$ra
bne_else.8823:
	sw	$t4, 0($sp)
	sw	$t6, 4($sp)
	sw	$t5, 8($sp)
	sw	$t7, 12($sp)
	sw	$t0, 16($sp)
	sw	$a3, 20($sp)
	sw	$t1, 24($sp)
	sw	$a2, 28($sp)
	sw	$a1, 32($sp)
	sw	$s7, 36($sp)
	sw	$a0, 40($sp)
	sw	$t3, 44($sp)
	sw	$t8, 48($sp)
	add	$a1, $zero, $a2
	add	$a0, $zero, $t8
	add	$s7, $zero, $t2
	add	$a2, $zero, $t0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8825
	lalo	$ra, tmp.8825
	jr	$s6
tmp.8825:
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8826
	lw	$a0, 48($sp)
	sll	$a0, $a0, 2
	lw	$a1, 44($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.2536
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8827
	jr	$ra
bne_else.8827:
	lw	$a0, 40($sp)
	addi	$a0, $a0, 1
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$s7, 36($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8826:
	lw	$a1, 24($sp)
	lwc1	$f1, 0($a1)
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 52($sp)
	swc1	$f1, 56($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8829
	j	beq_cont.8830
beq_else.8829:
	lw	$a0, 20($sp)
	lwc1	$f1, 0($a0)
	lwc1	$f0, 56($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8831
	j	beq_cont.8832
beq_else.8831:
	lui	$s1, 15395
	ori	$s1, $s1, 55050
	mtc1	$s1, $f0
	lwc1	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 28($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f1, $f0
	lw	$a1, 16($sp)
	lwc1	$f2, 0($a1)
	add.s	$f1, $f1, $f2
	lwc1	$f2, 4($a0)
	mul.s	$f2, $f2, $f0
	lwc1	$f3, 4($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 8($a0)
	mul.s	$f3, $f3, $f0
	lwc1	$f4, 8($a1)
	add.s	$f3, $f3, $f4
	addi	$a1, $zero, 0
	lw	$a2, 32($sp)
	lw	$s7, 12($sp)
	swc1	$f3, 64($sp)
	swc1	$f2, 72($sp)
	swc1	$f1, 80($sp)
	swc1	$f0, 88($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f2
	add.s	$f2, $fzero, $f3
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8833
	lalo	$ra, tmp.8833
	jr	$s6
tmp.8833:
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	bne	$a0, $zero, beq_else.8834
	j	beq_cont.8835
beq_else.8834:
	lw	$a0, 20($sp)
	lwc1	$f0, 88($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 80($sp)
	lwc1	$f1, 72($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 8($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	vecset.2484
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lw	$a0, 4($sp)
	lw	$a1, 48($sp)
	sw	$a1, 0($a0)
	lw	$a0, 0($sp)
	lw	$a1, 52($sp)
	sw	$a1, 0($a0)
beq_cont.8835:
beq_cont.8832:
beq_cont.8830:
	lw	$a0, 40($sp)
	addi	$a0, $a0, 1
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$s7, 36($sp)
	lw	$s6, 0($s7)
	jr	$s6
solve_one_or_network.2766:
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sll	$t1, $a0, 2
	add	$s1, $a1, $t1
	lw	$t1, 0($s1)
	addi	$s1, $zero, -1
	bne	$t1, $s1, bne_else.8836
	jr	$ra
bne_else.8836:
	sll	$t1, $t1, 2
	add	$s1, $t0, $t1
	lw	$t0, 0($s1)
	addi	$t1, $zero, 0
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$s7, 8($sp)
	sw	$a0, 12($sp)
	add	$a1, $zero, $t0
	add	$a0, $zero, $t1
	add	$s7, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8838
	lalo	$ra, tmp.8838
	jr	$s6
tmp.8838:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_or_matrix.2770:
	lw	$a3, 20($s7)
	lw	$t0, 16($s7)
	lw	$t1, 12($s7)
	lw	$t2, 8($s7)
	lw	$t3, 4($s7)
	sll	$t4, $a0, 2
	add	$s1, $a1, $t4
	lw	$t4, 0($s1)
	lw	$t5, 0($t4)
	addi	$s1, $zero, -1
	bne	$t5, $s1, bne_else.8839
	jr	$ra
bne_else.8839:
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$s7, 8($sp)
	sw	$a0, 12($sp)
	addi	$s1, $zero, 99
	bne	$t5, $s1, beq_else.8841
	addi	$a3, $zero, 1
	add	$a1, $zero, $t4
	add	$a0, $zero, $a3
	add	$s7, $zero, $t3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8843
	lalo	$ra, tmp.8843
	jr	$s6
tmp.8843:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	j	beq_cont.8842
beq_else.8841:
	sw	$t4, 16($sp)
	sw	$t3, 20($sp)
	sw	$a3, 24($sp)
	sw	$t1, 28($sp)
	add	$a1, $zero, $a2
	add	$a0, $zero, $t5
	add	$s7, $zero, $t2
	add	$a2, $zero, $t0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8844
	lalo	$ra, tmp.8844
	jr	$s6
tmp.8844:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8845
	j	beq_cont.8846
beq_else.8845:
	lw	$a0, 28($sp)
	lwc1	$f0, 0($a0)
	lw	$a0, 24($sp)
	lwc1	$f1, 0($a0)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8847
	j	beq_cont.8848
beq_else.8847:
	addi	$a0, $zero, 1
	lw	$a1, 16($sp)
	lw	$a2, 0($sp)
	lw	$s7, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8849
	lalo	$ra, tmp.8849
	jr	$s6
tmp.8849:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8848:
beq_cont.8846:
beq_cont.8842:
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
judge_intersection.2774:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	lui	$s1, 20078
	ori	$s1, $s1, 27432
	mtc1	$s1, $f0
	swc1	$f0, 0($a2)
	addi	$t0, $zero, 0
	lw	$a3, 0($a3)
	sw	$a2, 0($sp)
	add	$a2, $zero, $a0
	add	$s7, $zero, $a1
	add	$a1, $zero, $a3
	add	$a0, $zero, $t0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8850
	lalo	$ra, tmp.8850
	jr	$s6
tmp.8850:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f1, 0($a0)
	lui	$s1, -16948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f0
	swc1	$f1, 8($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, bne_else.8852
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8852:
	lui	$s1, 19646
	ori	$s1, $s1, 48160
	mtc1	$s1, $f1
	lwc1	$f0, 8($sp)
	c.lt.s	$a0, $f0, $f1
	jr	$ra
solve_each_element_fast.2776:
	lw	$a3, 36($s7)
	lw	$t0, 32($s7)
	lw	$t1, 28($s7)
	lw	$t2, 24($s7)
	lw	$t3, 20($s7)
	lw	$t4, 16($s7)
	lw	$t5, 12($s7)
	lw	$t6, 8($s7)
	lw	$t7, 4($s7)
	sw	$t4, 0($sp)
	sw	$t6, 4($sp)
	sw	$t5, 8($sp)
	sw	$t7, 12($sp)
	sw	$t0, 16($sp)
	sw	$a3, 20($sp)
	sw	$t2, 24($sp)
	sw	$s7, 28($sp)
	sw	$t3, 32($sp)
	sw	$a2, 36($sp)
	sw	$t1, 40($sp)
	sw	$a1, 44($sp)
	sw	$a0, 48($sp)
	add	$a0, $zero, $a2
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	d_vec.2591
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a1, 48($sp)
	sll	$a2, $a1, 2
	lw	$a3, 44($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	addi	$s1, $zero, -1
	bne	$a2, $s1, bne_else.8853
	jr	$ra
bne_else.8853:
	lw	$t0, 36($sp)
	lw	$s7, 40($sp)
	sw	$a0, 52($sp)
	sw	$a2, 56($sp)
	add	$a1, $zero, $t0
	add	$a0, $zero, $a2
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8855
	lalo	$ra, tmp.8855
	jr	$s6
tmp.8855:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8856
	lw	$a0, 56($sp)
	sll	$a0, $a0, 2
	lw	$a1, 32($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.2536
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8857
	jr	$ra
bne_else.8857:
	lw	$a0, 48($sp)
	addi	$a0, $a0, 1
	lw	$a1, 44($sp)
	lw	$a2, 36($sp)
	lw	$s7, 28($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8856:
	lw	$a1, 24($sp)
	lwc1	$f1, 0($a1)
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 60($sp)
	swc1	$f1, 64($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8859
	j	beq_cont.8860
beq_else.8859:
	lw	$a0, 20($sp)
	lwc1	$f1, 0($a0)
	lwc1	$f0, 64($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8861
	j	beq_cont.8862
beq_else.8861:
	lui	$s1, 15395
	ori	$s1, $s1, 55050
	mtc1	$s1, $f0
	lwc1	$f1, 64($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 52($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f1, $f0
	lw	$a1, 16($sp)
	lwc1	$f2, 0($a1)
	add.s	$f1, $f1, $f2
	lwc1	$f2, 4($a0)
	mul.s	$f2, $f2, $f0
	lwc1	$f3, 4($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 8($a0)
	mul.s	$f3, $f3, $f0
	lwc1	$f4, 8($a1)
	add.s	$f3, $f3, $f4
	addi	$a0, $zero, 0
	lw	$a1, 44($sp)
	lw	$s7, 12($sp)
	swc1	$f3, 72($sp)
	swc1	$f2, 80($sp)
	swc1	$f1, 88($sp)
	swc1	$f0, 96($sp)
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f2
	add.s	$f2, $fzero, $f3
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8863
	lalo	$ra, tmp.8863
	jr	$s6
tmp.8863:
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	bne	$a0, $zero, beq_else.8864
	j	beq_cont.8865
beq_else.8864:
	lw	$a0, 20($sp)
	lwc1	$f0, 96($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 88($sp)
	lwc1	$f1, 80($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 8($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	vecset.2484
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lw	$a0, 4($sp)
	lw	$a1, 56($sp)
	sw	$a1, 0($a0)
	lw	$a0, 0($sp)
	lw	$a1, 60($sp)
	sw	$a1, 0($a0)
beq_cont.8865:
beq_cont.8862:
beq_cont.8860:
	lw	$a0, 48($sp)
	addi	$a0, $a0, 1
	lw	$a1, 44($sp)
	lw	$a2, 36($sp)
	lw	$s7, 28($sp)
	lw	$s6, 0($s7)
	jr	$s6
solve_one_or_network_fast.2780:
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sll	$t1, $a0, 2
	add	$s1, $a1, $t1
	lw	$t1, 0($s1)
	addi	$s1, $zero, -1
	bne	$t1, $s1, bne_else.8866
	jr	$ra
bne_else.8866:
	sll	$t1, $t1, 2
	add	$s1, $t0, $t1
	lw	$t0, 0($s1)
	addi	$t1, $zero, 0
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$s7, 8($sp)
	sw	$a0, 12($sp)
	add	$a1, $zero, $t0
	add	$a0, $zero, $t1
	add	$s7, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8868
	lalo	$ra, tmp.8868
	jr	$s6
tmp.8868:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_or_matrix_fast.2784:
	lw	$a3, 16($s7)
	lw	$t0, 12($s7)
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$t3, $a0, 2
	add	$s1, $a1, $t3
	lw	$t3, 0($s1)
	lw	$t4, 0($t3)
	addi	$s1, $zero, -1
	bne	$t4, $s1, bne_else.8869
	jr	$ra
bne_else.8869:
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$s7, 8($sp)
	sw	$a0, 12($sp)
	addi	$s1, $zero, 99
	bne	$t4, $s1, beq_else.8871
	addi	$a3, $zero, 1
	add	$a1, $zero, $t3
	add	$a0, $zero, $a3
	add	$s7, $zero, $t2
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8873
	lalo	$ra, tmp.8873
	jr	$s6
tmp.8873:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	j	beq_cont.8872
beq_else.8871:
	sw	$t3, 16($sp)
	sw	$t2, 20($sp)
	sw	$a3, 24($sp)
	sw	$t1, 28($sp)
	add	$a1, $zero, $a2
	add	$a0, $zero, $t4
	add	$s7, $zero, $t0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8874
	lalo	$ra, tmp.8874
	jr	$s6
tmp.8874:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8875
	j	beq_cont.8876
beq_else.8875:
	lw	$a0, 28($sp)
	lwc1	$f0, 0($a0)
	lw	$a0, 24($sp)
	lwc1	$f1, 0($a0)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8877
	j	beq_cont.8878
beq_else.8877:
	addi	$a0, $zero, 1
	lw	$a1, 16($sp)
	lw	$a2, 0($sp)
	lw	$s7, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8879
	lalo	$ra, tmp.8879
	jr	$s6
tmp.8879:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8878:
beq_cont.8876:
beq_cont.8872:
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
judge_intersection_fast.2788:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	lui	$s1, 20078
	ori	$s1, $s1, 27432
	mtc1	$s1, $f0
	swc1	$f0, 0($a2)
	addi	$t0, $zero, 0
	lw	$a3, 0($a3)
	sw	$a2, 0($sp)
	add	$a2, $zero, $a0
	add	$s7, $zero, $a1
	add	$a1, $zero, $a3
	add	$a0, $zero, $t0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8880
	lalo	$ra, tmp.8880
	jr	$s6
tmp.8880:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f1, 0($a0)
	lui	$s1, -16948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f0
	swc1	$f1, 8($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, bne_else.8882
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8882:
	lui	$s1, 19646
	ori	$s1, $s1, 48160
	mtc1	$s1, $f1
	lwc1	$f0, 8($sp)
	c.lt.s	$a0, $f0, $f1
	jr	$ra
get_nvector_rect.2790:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	lw	$a2, 0($a2)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	vecbzero.2492
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, -1
	addi	$a0, $a0, -1
	sll	$a0, $a0, 2
	lw	$a2, 4($sp)
	add	$s1, $a2, $a0
	lwc1	$f0, 0($s1)
	sw	$a1, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	sgn.2476
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sub.s	$f0, $fzero, $f0
	lw	$a0, 12($sp)
	sll	$a0, $a0, 2
	lw	$a1, 0($sp)
	add	$s1, $a1, $a0
	swc1	$f0, 0($s1)
	jr	$ra
get_nvector_plane.2792:
	lw	$a1, 4($s7)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_param_a.2540
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sub.s	$f0, $fzero, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_param_b.2542
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sub.s	$f0, $fzero, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 4($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_param_c.2544
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sub.s	$f0, $fzero, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	jr	$ra
get_nvector_second.2794:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	lwc1	$f0, 0($a2)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	swc1	$f0, 16($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.2548
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f1, 16($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	lwc1	$f1, 4($a0)
	lw	$a1, 4($sp)
	swc1	$f0, 24($sp)
	swc1	$f1, 32($sp)
	add	$a0, $zero, $a1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_y.2550
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	lwc1	$f1, 8($a0)
	lw	$a0, 4($sp)
	swc1	$f0, 40($sp)
	swc1	$f1, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_z.2552
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_a.2540
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_b.2542
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_c.2544
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_isrot.2538
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, beq_else.8886
	lw	$a0, 0($sp)
	lwc1	$f0, 64($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 72($sp)
	swc1	$f0, 4($a0)
	lwc1	$f0, 80($sp)
	swc1	$f0, 8($a0)
	j	beq_cont.8887
beq_else.8886:
	lw	$a0, 4($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_param_r3.2568
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_r2.2566
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 88($sp)
	add.s	$f0, $f2, $f0
	lui	$s1, 16128
	mtc1	$s1, $f29
	mul.s	$f0, $f0, $f29
	lwc1	$f1, 64($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_r3.2568
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 96($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_r1.2564
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 96($sp)
	add.s	$f0, $f1, $f0
	lui	$s1, 16128
	mtc1	$s1, $f29
	mul.s	$f0, $f0, $f29
	lwc1	$f1, 72($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 4($a0)
	lw	$a1, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_r2.2566
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 104($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_r1.2564
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 104($sp)
	add.s	$f0, $f1, $f0
	lui	$s1, 16128
	mtc1	$s1, $f29
	mul.s	$f0, $f0, $f29
	lwc1	$f1, 80($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 8($a0)
beq_cont.8887:
	lw	$a1, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_isinvert.2536
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	add	$a1, $a0, $zero
	lw	$a0, 0($sp)
	j	vecunit_sgn.2502
get_nvector.2796:
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sw	$a2, 0($sp)
	sw	$a0, 4($sp)
	sw	$t0, 8($sp)
	sw	$a1, 12($sp)
	sw	$a3, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2532
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8888
	lw	$a0, 12($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8888:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8889
	lw	$a0, 4($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8889:
	lw	$a0, 4($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
utexture.2799:
	lw	$a2, 4($s7)
	sw	$a1, 0($sp)
	sw	$a2, 4($sp)
	sw	$a0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_texturetype.2530
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 8($sp)
	sw	$a0, 12($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_color_red.2558
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_color_green.2560
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 4($a0)
	lw	$a1, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_color_blue.2562
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 12($sp)
	addi	$s1, $zero, 1
	bne	$a1, $s1, bne_else.8890
	lw	$a1, 0($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 8($sp)
	swc1	$f0, 16($sp)
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.2548
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f1, 16($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 15692
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	mul.s	$f1, $f0, $f1
	swc1	$f0, 24($sp)
	add.s	$f0, $fzero, $f1
	floor	$f0, $f0
	lui	$s1, 16800
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 16672
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
	lw	$a1, 0($sp)
	lwc1	$f0, 8($a1)
	lw	$a1, 8($sp)
	sw	$a0, 32($sp)
	swc1	$f0, 40($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_z.2552
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 15692
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	mul.s	$f1, $f0, $f1
	swc1	$f0, 48($sp)
	add.s	$f0, $fzero, $f1
	floor	$f0, $f0
	lui	$s1, 16800
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 16672
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
	lw	$a1, 32($sp)
	bne	$a1, $zero, beq_else.8892
	bne	$a0, $zero, beq_else.8894
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	beq_cont.8895
beq_else.8894:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8895:
	j	beq_cont.8893
beq_else.8892:
	bne	$a0, $zero, beq_else.8896
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	beq_cont.8897
beq_else.8896:
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8897:
beq_cont.8893:
	lw	$a0, 4($sp)
	swc1	$f0, 4($a0)
	jr	$ra
bne_else.8890:
	addi	$s1, $zero, 2
	bne	$a1, $s1, bne_else.8899
	lw	$a1, 0($sp)
	lwc1	$f0, 4($a1)
	lui	$s1, 16000
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_sin
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	mul.s	$f0, $f0, $f0
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f1, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f1, 0($a0)
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	sub.s	$f0, $f2, $f0
	mul.s	$f0, $f1, $f0
	swc1	$f0, 4($a0)
	jr	$ra
bne_else.8899:
	addi	$s1, $zero, 3
	bne	$a1, $s1, bne_else.8901
	lw	$a1, 0($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 8($sp)
	swc1	$f0, 56($sp)
	add	$a0, $zero, $a2
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_x.2548
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	lwc1	$f1, 8($a0)
	lw	$a0, 8($sp)
	swc1	$f0, 64($sp)
	swc1	$f1, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_z.2552
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	sub.s	$f0, $f1, $f0
	lwc1	$f1, 64($sp)
	swc1	$f0, 80($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 80($sp)
	swc1	$f0, 88($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 88($sp)
	add.s	$f0, $f1, $f0
	sqrt	$f0, $f0
	lui	$s1, 16672
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	div.s	$f0, $f0, $f1
	swc1	$f0, 96($sp)
	floor	$f0, $f0
	lwc1	$f1, 96($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 16457
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_cos
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	mul.s	$f0, $f0, $f0
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f1, $f0, $f1
	lw	$a0, 4($sp)
	swc1	$f1, 4($a0)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	sub.s	$f0, $f1, $f0
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	swc1	$f0, 8($a0)
	jr	$ra
bne_else.8901:
	addi	$s1, $zero, 4
	bne	$a1, $s1, bne_else.8903
	lw	$a1, 0($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 8($sp)
	swc1	$f0, 104($sp)
	add	$a0, $zero, $a2
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_x.2548
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f1, 104($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 112($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_param_a.2540
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 8($sp)
	swc1	$f0, 120($sp)
	swc1	$f1, 128($sp)
	add	$a0, $zero, $a1
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	o_param_z.2552
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lwc1	$f1, 128($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 136($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	o_param_c.2544
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 120($sp)
	swc1	$f0, 144($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 144($sp)
	swc1	$f0, 152($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 152($sp)
	add.s	$f0, $f1, $f0
	lwc1	$f1, 120($sp)
	swc1	$f0, 160($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	min_caml_fabs
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lui	$s1, 14545
	ori	$s1, $s1, 46871
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8904
	lwc1	$f0, 120($sp)
	lwc1	$f1, 144($sp)
	div.s	$f0, $f1, $f0
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	min_caml_fabs
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	min_caml_atan
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lui	$s1, 16880
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	lui	$s1, 16457
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	div.s	$f0, $f0, $f1
	j	beq_cont.8905
beq_else.8904:
	lui	$s1, 16752
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8905:
	swc1	$f0, 168($sp)
	floor	$f0, $f0
	lwc1	$f1, 168($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	lwc1	$f1, 4($a0)
	lw	$a0, 8($sp)
	swc1	$f0, 176($sp)
	swc1	$f1, 184($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	jal	o_param_y.2550
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	lwc1	$f1, 184($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 192($sp)
	sw	$ra, 204($sp)
	addi	$sp, $sp, 208
	jal	o_param_b.2542
	addi	$sp, $sp, -208
	lw	$ra, 204($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 192($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 160($sp)
	swc1	$f0, 200($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 212($sp)
	addi	$sp, $sp, 216
	jal	min_caml_fabs
	addi	$sp, $sp, -216
	lw	$ra, 212($sp)
	lui	$s1, 14545
	ori	$s1, $s1, 46871
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8906
	lwc1	$f0, 160($sp)
	lwc1	$f1, 200($sp)
	div.s	$f0, $f1, $f0
	sw	$ra, 212($sp)
	addi	$sp, $sp, 216
	jal	min_caml_fabs
	addi	$sp, $sp, -216
	lw	$ra, 212($sp)
	sw	$ra, 212($sp)
	addi	$sp, $sp, 216
	jal	min_caml_atan
	addi	$sp, $sp, -216
	lw	$ra, 212($sp)
	lui	$s1, 16880
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	lui	$s1, 16457
	ori	$s1, $s1, 4059
	mtc1	$s1, $f1
	div.s	$f0, $f0, $f1
	j	beq_cont.8907
beq_else.8906:
	lui	$s1, 16752
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8907:
	swc1	$f0, 208($sp)
	floor	$f0, $f0
	lwc1	$f1, 208($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 15897
	ori	$s1, $s1, 39322
	mtc1	$s1, $f1
	lui	$s1, 16128
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	lwc1	$f3, 176($sp)
	sub.s	$f2, $f2, $f3
	swc1	$f0, 216($sp)
	swc1	$f1, 224($sp)
	add.s	$f0, $fzero, $f2
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 224($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 16128
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lwc1	$f2, 216($sp)
	sub.s	$f1, $f1, $f2
	swc1	$f0, 232($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 232($sp)
	sub.s	$f0, $f1, $f0
	swc1	$f0, 240($sp)
	c.lt.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8908
	lwc1	$f0, 240($sp)
	j	beq_cont.8909
beq_else.8908:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8909:
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f1, $f0
	lui	$s1, 16025
	ori	$s1, $s1, 39322
	mtc1	$s1, $f1
	div.s	$f0, $f0, $f1
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	jr	$ra
bne_else.8903:
	jr	$ra
add_light.2802:
	lw	$a0, 8($s7)
	lw	$a1, 4($s7)
	swc1	$f2, 0($sp)
	swc1	$f1, 8($sp)
	swc1	$f0, 16($sp)
	sw	$a0, 24($sp)
	sw	$a1, 28($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, beq_else.8912
	j	beq_cont.8913
beq_else.8912:
	lwc1	$f0, 16($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	vecaccum.2513
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8913:
	lwc1	$f0, 8($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, bne_else.8914
	jr	$ra
bne_else.8914:
	lwc1	$f0, 8($sp)
	mul.s	$f0, $f0, $f0
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 0($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 28($sp)
	lwc1	$f1, 0($a0)
	add.s	$f1, $f1, $f0
	swc1	$f1, 0($a0)
	lwc1	$f1, 4($a0)
	add.s	$f1, $f1, $f0
	swc1	$f1, 4($a0)
	lwc1	$f1, 8($a0)
	add.s	$f0, $f1, $f0
	swc1	$f0, 8($a0)
	jr	$ra
trace_reflections.2806:
	lw	$a2, 32($s7)
	lw	$a3, 28($s7)
	lw	$t0, 24($s7)
	lw	$t1, 20($s7)
	lw	$t2, 16($s7)
	lw	$t3, 12($s7)
	lw	$t4, 8($s7)
	lw	$t5, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.8917
	jr	$ra
bne_else.8917:
	sll	$t6, $a0, 2
	add	$s1, $a3, $t6
	lw	$a3, 0($s1)
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	swc1	$f1, 8($sp)
	sw	$t5, 16($sp)
	sw	$a1, 20($sp)
	swc1	$f0, 24($sp)
	sw	$t1, 32($sp)
	sw	$a2, 36($sp)
	sw	$t0, 40($sp)
	sw	$a3, 44($sp)
	sw	$t3, 48($sp)
	sw	$t4, 52($sp)
	sw	$t2, 56($sp)
	add	$a0, $zero, $a3
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	r_dvec.2597
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$s7, 56($sp)
	sw	$a0, 60($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8919
	lalo	$ra, tmp.8919
	jr	$s6
tmp.8919:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8920
	j	beq_cont.8921
beq_else.8920:
	lw	$a0, 52($sp)
	lw	$a0, 0($a0)
	sll	$a0, $a0, 2
	lw	$a1, 48($sp)
	lw	$a1, 0($a1)
	add	$a0, $a0, $a1
	lw	$a1, 44($sp)
	sw	$a0, 64($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	r_surface_id.2595
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 64($sp)
	bne	$a1, $a0, beq_else.8922
	addi	$a0, $zero, 0
	lw	$a1, 40($sp)
	lw	$a1, 0($a1)
	lw	$s7, 36($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8924
	lalo	$ra, tmp.8924
	jr	$s6
tmp.8924:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8925
	lw	$a0, 60($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	d_vec.2591
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	add	$a1, $a0, $zero
	lw	$a0, 32($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	veciprod.2505
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	r_bright.2599
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f2, $f0, $f1
	lwc1	$f3, 72($sp)
	mul.s	$f2, $f2, $f3
	lw	$a0, 60($sp)
	swc1	$f2, 80($sp)
	swc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	d_vec.2591
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	add	$a1, $a0, $zero
	lw	$a0, 20($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	veciprod.2505
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 88($sp)
	mul.s	$f1, $f1, $f0
	lwc1	$f0, 80($sp)
	lwc1	$f2, 8($sp)
	lw	$s7, 16($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8928
	lalo	$ra, tmp.8928
	jr	$s6
tmp.8928:
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	j	beq_cont.8926
beq_else.8925:
beq_cont.8926:
	j	beq_cont.8923
beq_else.8922:
beq_cont.8923:
beq_cont.8921:
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	lwc1	$f0, 24($sp)
	lwc1	$f1, 8($sp)
	lw	$a1, 20($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_ray.2811:
	lw	$a3, 80($s7)
	lw	$t0, 76($s7)
	lw	$t1, 72($s7)
	lw	$t2, 68($s7)
	lw	$t3, 64($s7)
	lw	$t4, 60($s7)
	lw	$t5, 56($s7)
	lw	$t6, 52($s7)
	lw	$t7, 48($s7)
	lw	$t8, 44($s7)
	lw	$t9, 40($s7)
	lw	$k0, 36($s7)
	lw	$k1, 32($s7)
	lw	$v0, 28($s7)
	lw	$v1, 24($s7)
	lw	$at, 20($s7)
	lw	$s2, 16($s7)
	lw	$s3, 12($s7)
	lw	$s4, 8($s7)
	lw	$s5, 4($s7)
	addi	$s6, $zero, 4
	slt	$s0, $s6, $a0
	beq	$s0, $zero, bne_else.8929
	jr	$ra
bne_else.8929:
	sw	$s7, 0($sp)
	swc1	$f1, 8($sp)
	sw	$t1, 16($sp)
	sw	$t0, 20($sp)
	sw	$k0, 24($sp)
	sw	$t5, 28($sp)
	sw	$s5, 32($sp)
	sw	$t4, 36($sp)
	sw	$t7, 40($sp)
	sw	$t9, 44($sp)
	sw	$t2, 48($sp)
	sw	$a2, 52($sp)
	sw	$v1, 56($sp)
	sw	$a3, 60($sp)
	sw	$at, 64($sp)
	sw	$t3, 68($sp)
	sw	$s3, 72($sp)
	sw	$t8, 76($sp)
	sw	$s2, 80($sp)
	sw	$t6, 84($sp)
	sw	$s4, 88($sp)
	swc1	$f0, 96($sp)
	sw	$k1, 104($sp)
	sw	$a0, 108($sp)
	sw	$a1, 112($sp)
	sw	$v0, 116($sp)
	add	$a0, $zero, $a2
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	p_surface_ids.2576
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lw	$a1, 112($sp)
	lw	$s7, 116($sp)
	sw	$a0, 120($sp)
	add	$a0, $zero, $a1
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8933
	lalo	$ra, tmp.8933
	jr	$s6
tmp.8933:
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	bne	$a0, $zero, bne_else.8934
	addi	$a0, $zero, -1
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	lw	$a3, 120($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	bne	$a1, $zero, bne_else.8935
	jr	$ra
bne_else.8935:
	lw	$a0, 112($sp)
	lw	$a1, 104($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	veciprod.2505
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	sub.s	$f0, $fzero, $f0
	swc1	$f0, 128($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, bne_else.8938
	jr	$ra
bne_else.8938:
	lwc1	$f0, 128($sp)
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 128($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 96($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 88($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 84($sp)
	lwc1	$f1, 0($a0)
	add.s	$f1, $f1, $f0
	swc1	$f1, 0($a0)
	lwc1	$f1, 4($a0)
	add.s	$f1, $f1, $f0
	swc1	$f1, 4($a0)
	lwc1	$f1, 8($a0)
	add.s	$f0, $f1, $f0
	swc1	$f0, 8($a0)
	jr	$ra
bne_else.8934:
	lw	$a0, 80($sp)
	lw	$a0, 0($a0)
	sll	$a1, $a0, 2
	lw	$a2, 76($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	sw	$a0, 136($sp)
	sw	$a1, 140($sp)
	add	$a0, $zero, $a1
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	o_reflectiontype.2534
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lw	$a1, 140($sp)
	sw	$a0, 144($sp)
	add	$a0, $zero, $a1
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	o_diffuse.2554
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 96($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 140($sp)
	lw	$a1, 112($sp)
	lw	$s7, 72($sp)
	swc1	$f0, 152($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8942
	lalo	$ra, tmp.8942
	jr	$s6
tmp.8942:
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a0, 68($sp)
	lw	$a1, 64($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	veccpy.2494
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a0, 140($sp)
	lw	$a1, 64($sp)
	lw	$s7, 60($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8943
	lalo	$ra, tmp.8943
	jr	$s6
tmp.8943:
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a0, 136($sp)
	sll	$a0, $a0, 2
	lw	$a1, 56($sp)
	lw	$a1, 0($a1)
	add	$a0, $a0, $a1
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	lw	$a3, 120($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	lw	$a0, 52($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	p_intersection_points.2574
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a0, 0($s1)
	lw	$a2, 64($sp)
	add	$a1, $zero, $a2
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	veccpy.2494
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a0, 52($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	p_calc_diffuse.2578
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a1, 140($sp)
	sw	$a0, 160($sp)
	add	$a0, $zero, $a1
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	o_diffuse.2554
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lui	$s1, 16128
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, beq_else.8944
	addi	$a0, $zero, 1
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	lw	$a3, 160($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	lw	$a0, 52($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	p_energy.2580
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a2, 0($s1)
	lw	$a3, 48($sp)
	sw	$a0, 164($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	veccpy.2494
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lw	$a0, 108($sp)
	sll	$a1, $a0, 2
	lw	$a2, 164($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lui	$s1, 15232
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 152($sp)
	mul.s	$f0, $f0, $f1
	add	$a0, $zero, $a1
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	vecscale.2523
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lw	$a0, 52($sp)
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	p_nvectors.2589
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a0, 0($s1)
	lw	$a2, 44($sp)
	add	$a1, $zero, $a2
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	veccpy.2494
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	j	beq_cont.8945
beq_else.8944:
	addi	$a0, $zero, 0
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	lw	$a3, 160($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
beq_cont.8945:
	lui	$s1, -16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 112($sp)
	lw	$a1, 44($sp)
	swc1	$f0, 168($sp)
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	veciprod.2505
	addi	$sp, $sp, -184
	lw	$ra, 180($sp)
	lwc1	$f1, 168($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 112($sp)
	lw	$a1, 44($sp)
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	vecaccum.2513
	addi	$sp, $sp, -184
	lw	$ra, 180($sp)
	lw	$a0, 140($sp)
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	o_hilight.2556
	addi	$sp, $sp, -184
	lw	$ra, 180($sp)
	lwc1	$f1, 96($sp)
	mul.s	$f0, $f1, $f0
	addi	$a0, $zero, 0
	lw	$a1, 40($sp)
	lw	$a1, 0($a1)
	lw	$s7, 36($sp)
	swc1	$f0, 176($sp)
	sw	$ra, 188($sp)
	addi	$sp, $sp, 192
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8946
	lalo	$ra, tmp.8946
	jr	$s6
tmp.8946:
	addi	$sp, $sp, -192
	lw	$ra, 188($sp)
	bne	$a0, $zero, beq_else.8947
	lw	$a0, 44($sp)
	lw	$a1, 104($sp)
	sw	$ra, 188($sp)
	addi	$sp, $sp, 192
	jal	veciprod.2505
	addi	$sp, $sp, -192
	lw	$ra, 188($sp)
	sub.s	$f0, $fzero, $f0
	lwc1	$f1, 152($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 112($sp)
	lw	$a1, 104($sp)
	swc1	$f0, 184($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	jal	veciprod.2505
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	sub.s	$f1, $fzero, $f0
	lwc1	$f0, 184($sp)
	lwc1	$f2, 176($sp)
	lw	$s7, 32($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8949
	lalo	$ra, tmp.8949
	jr	$s6
tmp.8949:
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	j	beq_cont.8948
beq_else.8947:
beq_cont.8948:
	lw	$a0, 64($sp)
	lw	$s7, 28($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8950
	lalo	$ra, tmp.8950
	jr	$s6
tmp.8950:
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	lw	$a0, 24($sp)
	lw	$a0, 0($a0)
	addi	$a0, $a0, -1
	lwc1	$f0, 152($sp)
	lwc1	$f1, 176($sp)
	lw	$a1, 112($sp)
	lw	$s7, 20($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8951
	lalo	$ra, tmp.8951
	jr	$s6
tmp.8951:
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	lui	$s1, 15820
	ori	$s1, $s1, 52429
	mtc1	$s1, $f0
	lwc1	$f1, 96($sp)
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, bne_else.8952
	jr	$ra
bne_else.8952:
	lw	$a0, 108($sp)
	slti	$s0, $a0, 4
	beq	$s0, $zero, bne_else.8954
	addi	$a1, $a0, 1
	addi	$a2, $zero, -1
	sll	$a1, $a1, 2
	lw	$a3, 120($sp)
	add	$s1, $a3, $a1
	sw	$a2, 0($s1)
	j	bne_cont.8955
bne_else.8954:
bne_cont.8955:
	lw	$a1, 144($sp)
	addi	$s1, $zero, 2
	bne	$a1, $s1, bne_else.8956
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 140($sp)
	swc1	$f0, 192($sp)
	add	$a0, $zero, $a1
	sw	$ra, 204($sp)
	addi	$sp, $sp, 208
	jal	o_diffuse.2554
	addi	$sp, $sp, -208
	lw	$ra, 204($sp)
	lwc1	$f1, 192($sp)
	sub.s	$f0, $f1, $f0
	lwc1	$f1, 96($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 108($sp)
	addi	$a0, $a0, 1
	lw	$a1, 16($sp)
	lwc1	$f1, 0($a1)
	lwc1	$f2, 8($sp)
	add.s	$f1, $f2, $f1
	lw	$a1, 112($sp)
	lw	$a2, 52($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8956:
	jr	$ra
trace_diffuse_ray.2817:
	lw	$a1, 48($s7)
	lw	$a2, 44($s7)
	lw	$a3, 40($s7)
	lw	$t0, 36($s7)
	lw	$t1, 32($s7)
	lw	$t2, 28($s7)
	lw	$t3, 24($s7)
	lw	$t4, 20($s7)
	lw	$t5, 16($s7)
	lw	$t6, 12($s7)
	lw	$t7, 8($s7)
	lw	$t8, 4($s7)
	sw	$a2, 0($sp)
	sw	$t8, 4($sp)
	swc1	$f0, 8($sp)
	sw	$t3, 16($sp)
	sw	$t2, 20($sp)
	sw	$a3, 24($sp)
	sw	$t0, 28($sp)
	sw	$t5, 32($sp)
	sw	$a1, 36($sp)
	sw	$t7, 40($sp)
	sw	$a0, 44($sp)
	sw	$t1, 48($sp)
	sw	$t6, 52($sp)
	add	$s7, $zero, $t4
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8958
	lalo	$ra, tmp.8958
	jr	$s6
tmp.8958:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8959
	jr	$ra
bne_else.8959:
	lw	$a0, 52($sp)
	lw	$a0, 0($a0)
	sll	$a0, $a0, 2
	lw	$a1, 48($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	lw	$a1, 44($sp)
	sw	$a0, 56($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.2591
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	add	$a1, $a0, $zero
	lw	$a0, 56($sp)
	lw	$s7, 40($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8961
	lalo	$ra, tmp.8961
	jr	$s6
tmp.8961:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a0, 56($sp)
	lw	$a1, 32($sp)
	lw	$s7, 36($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8962
	lalo	$ra, tmp.8962
	jr	$s6
tmp.8962:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$a0, $zero, 0
	lw	$a1, 28($sp)
	lw	$a1, 0($a1)
	lw	$s7, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8963
	lalo	$ra, tmp.8963
	jr	$s6
tmp.8963:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8964
	lw	$a0, 20($sp)
	lw	$a1, 16($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veciprod.2505
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	sub.s	$f0, $fzero, $f0
	swc1	$f0, 64($sp)
	c.lt.s	$a0, $fzero, $f0
	bne	$a0, $zero, beq_else.8966
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	beq_cont.8967
beq_else.8966:
	lwc1	$f0, 64($sp)
beq_cont.8967:
	lwc1	$f1, 8($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 56($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_diffuse.2554
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lw	$a1, 0($sp)
	j	vecaccum.2513
bne_else.8964:
	jr	$ra
iter_trace_diffuse_rays.2820:
	lw	$t0, 4($s7)
	slti	$s0, $a3, 0
	beq	$s0, $zero, bne_else.8969
	jr	$ra
bne_else.8969:
	sll	$t1, $a3, 2
	add	$s1, $a0, $t1
	lw	$t1, 0($s1)
	sw	$a2, 0($sp)
	sw	$s7, 4($sp)
	sw	$t0, 8($sp)
	sw	$a0, 12($sp)
	sw	$a3, 16($sp)
	sw	$a1, 20($sp)
	add	$a0, $zero, $t1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	d_vec.2591
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	veciprod.2505
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	swc1	$f0, 24($sp)
	c.lt.s	$a0, $f0, $fzero
	bne	$a0, $zero, beq_else.8971
	lw	$a0, 16($sp)
	sll	$a1, $a0, 2
	lw	$a2, 12($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lui	$s1, 17174
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 24($sp)
	div.s	$f0, $f1, $f0
	lw	$s7, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8973
	lalo	$ra, tmp.8973
	jr	$s6
tmp.8973:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	j	beq_cont.8972
beq_else.8971:
	lw	$a0, 16($sp)
	addi	$a1, $a0, 1
	sll	$a1, $a1, 2
	lw	$a2, 12($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lui	$s1, -15594
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 24($sp)
	div.s	$f0, $f1, $f0
	lw	$s7, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8974
	lalo	$ra, tmp.8974
	jr	$s6
tmp.8974:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8972:
	lw	$a0, 16($sp)
	addi	$a3, $a0, -2
	lw	$a0, 12($sp)
	lw	$a1, 20($sp)
	lw	$a2, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_diffuse_rays.2825:
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$a0, 8($sp)
	sw	$t0, 12($sp)
	add	$a0, $zero, $a2
	add	$s7, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8975
	lalo	$ra, tmp.8975
	jr	$s6
tmp.8975:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a3, $zero, 118
	lw	$a0, 8($sp)
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_diffuse_ray_80percent.2829:
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$a3, 8($sp)
	sw	$t0, 12($sp)
	sw	$a0, 16($sp)
	bne	$a0, $zero, beq_else.8976
	j	beq_cont.8977
beq_else.8976:
	lw	$t1, 0($t0)
	add	$a0, $zero, $t1
	add	$s7, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8978
	lalo	$ra, tmp.8978
	jr	$s6
tmp.8978:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8977:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, beq_else.8979
	j	beq_cont.8980
beq_else.8979:
	lw	$a1, 12($sp)
	lw	$a2, 4($a1)
	lw	$a3, 4($sp)
	lw	$t0, 0($sp)
	lw	$s7, 8($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	add	$a2, $zero, $t0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8981
	lalo	$ra, tmp.8981
	jr	$s6
tmp.8981:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8980:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 2
	bne	$a0, $s1, beq_else.8982
	j	beq_cont.8983
beq_else.8982:
	lw	$a1, 12($sp)
	lw	$a2, 8($a1)
	lw	$a3, 4($sp)
	lw	$t0, 0($sp)
	lw	$s7, 8($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	add	$a2, $zero, $t0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8984
	lalo	$ra, tmp.8984
	jr	$s6
tmp.8984:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8983:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8985
	j	beq_cont.8986
beq_else.8985:
	lw	$a1, 12($sp)
	lw	$a2, 12($a1)
	lw	$a3, 4($sp)
	lw	$t0, 0($sp)
	lw	$s7, 8($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	add	$a2, $zero, $t0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8987
	lalo	$ra, tmp.8987
	jr	$s6
tmp.8987:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8986:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 4
	bne	$a0, $s1, bne_else.8988
	jr	$ra
bne_else.8988:
	lw	$a0, 12($sp)
	lw	$a0, 16($a0)
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
calc_diffuse_using_1point.2833:
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sw	$a3, 0($sp)
	sw	$a2, 4($sp)
	sw	$t0, 8($sp)
	sw	$a1, 12($sp)
	sw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	p_received_ray_20percent.2582
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 16($sp)
	sw	$a0, 20($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.2589
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 16($sp)
	sw	$a0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_intersection_points.2574
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 16($sp)
	sw	$a0, 28($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_energy.2580
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 12($sp)
	sll	$a2, $a1, 2
	lw	$a3, 20($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	lw	$a3, 8($sp)
	sw	$a0, 32($sp)
	add	$a1, $zero, $a2
	add	$a0, $zero, $a3
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veccpy.2494
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 16($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_group_id.2584
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 12($sp)
	sll	$a2, $a1, 2
	lw	$a3, 24($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	sll	$a3, $a1, 2
	lw	$t0, 28($sp)
	add	$s1, $t0, $a3
	lw	$a3, 0($s1)
	lw	$s7, 4($sp)
	add	$a1, $zero, $a2
	add	$a2, $zero, $a3
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8990
	lalo	$ra, tmp.8990
	jr	$s6
tmp.8990:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 12($sp)
	sll	$a0, $a0, 2
	lw	$a1, 32($sp)
	add	$s1, $a1, $a0
	lw	$a1, 0($s1)
	lw	$a0, 0($sp)
	lw	$a2, 8($sp)
	j	vecaccumv.2526
calc_diffuse_using_5points.2836:
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$t3, $a0, 2
	add	$s1, $a1, $t3
	lw	$a1, 0($s1)
	sw	$t1, 0($sp)
	sw	$t2, 4($sp)
	sw	$t0, 8($sp)
	sw	$a3, 12($sp)
	sw	$a2, 16($sp)
	sw	$a0, 20($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_received_ray_20percent.2582
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	addi	$a2, $a1, -1
	sll	$a2, $a2, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	sw	$a0, 24($sp)
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_received_ray_20percent.2582
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	sw	$a0, 28($sp)
	add	$a0, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_received_ray_20percent.2582
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 20($sp)
	addi	$a2, $a1, 1
	sll	$a2, $a2, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	sw	$a0, 32($sp)
	add	$a0, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_received_ray_20percent.2582
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 20($sp)
	sll	$a2, $a1, 2
	lw	$a3, 12($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	sw	$a0, 36($sp)
	add	$a0, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_received_ray_20percent.2582
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a1, 8($sp)
	sll	$a2, $a1, 2
	lw	$a3, 24($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	lw	$a3, 4($sp)
	sw	$a0, 40($sp)
	add	$a1, $zero, $a2
	add	$a0, $zero, $a3
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2494
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 8($sp)
	sll	$a1, $a0, 2
	lw	$a2, 28($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lw	$a2, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2517
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 8($sp)
	sll	$a1, $a0, 2
	lw	$a2, 32($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lw	$a2, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2517
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 8($sp)
	sll	$a1, $a0, 2
	lw	$a2, 36($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lw	$a2, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2517
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 8($sp)
	sll	$a1, $a0, 2
	lw	$a2, 40($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lw	$a2, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	vecadd.2517
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 20($sp)
	sll	$a0, $a0, 2
	lw	$a1, 16($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_energy.2580
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a1, 8($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a1
	lw	$a1, 0($s1)
	lw	$a0, 0($sp)
	lw	$a2, 4($sp)
	j	vecaccumv.2526
do_without_neighbors.2842:
	lw	$a2, 4($s7)
	addi	$a3, $zero, 4
	slt	$s0, $a3, $a1
	beq	$s0, $zero, bne_else.8991
	jr	$ra
bne_else.8991:
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a0, 8($sp)
	sw	$a1, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	p_surface_ids.2576
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a0, 0($s1)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.8993
	jr	$ra
bne_else.8993:
	lw	$a0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	p_calc_diffuse.2578
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a0, 0($s1)
	bne	$a0, $zero, beq_else.8995
	j	beq_cont.8996
beq_else.8995:
	lw	$a0, 8($sp)
	lw	$s7, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8997
	lalo	$ra, tmp.8997
	jr	$s6
tmp.8997:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8996:
	lw	$a0, 12($sp)
	addi	$a1, $a0, 1
	lw	$a0, 8($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
neighbors_exist.2845:
	lw	$a2, 4($s7)
	lw	$a3, 4($a2)
	addi	$t0, $a1, 1
	slt	$s0, $t0, $a3
	beq	$s0, $zero, bne_else.8998
	addi	$a3, $zero, 0
	slt	$s0, $a3, $a1
	beq	$s0, $zero, bne_else.8999
	lw	$a1, 0($a2)
	addi	$a2, $a0, 1
	slt	$s0, $a2, $a1
	beq	$s0, $zero, bne_else.9000
	addi	$a1, $zero, 0
	slt	$s0, $a1, $a0
	beq	$s0, $zero, bne_else.9001
	addi	$a0, $zero, 1
	jr	$ra
bne_else.9001:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.9000:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8999:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8998:
	addi	$a0, $zero, 0
	jr	$ra
get_surface_id.2849:
	sw	$a1, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	p_surface_ids.2576
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a1
	lw	$a0, 0($s1)
	jr	$ra
neighbors_are_available.2852:
	sll	$t1, $a0, 2
	add	$s1, $a2, $t1
	lw	$t1, 0($s1)
	sw	$a2, 0($sp)
	sw	$a3, 4($sp)
	sw	$t0, 8($sp)
	sw	$a1, 12($sp)
	sw	$a0, 16($sp)
	add	$a1, $zero, $t0
	add	$a0, $zero, $t1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	get_surface_id.2849
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 16($sp)
	sll	$a2, $a1, 2
	lw	$a3, 12($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	lw	$a3, 8($sp)
	sw	$a0, 20($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	get_surface_id.2849
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.9002
	lw	$a0, 16($sp)
	sll	$a2, $a0, 2
	lw	$a3, 4($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	lw	$a3, 8($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	get_surface_id.2849
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.9003
	lw	$a0, 16($sp)
	addi	$a2, $a0, -1
	sll	$a2, $a2, 2
	lw	$a3, 0($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	lw	$t0, 8($sp)
	add	$a1, $zero, $t0
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	get_surface_id.2849
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.9004
	lw	$a0, 16($sp)
	addi	$a0, $a0, 1
	sll	$a0, $a0, 2
	lw	$a2, 0($sp)
	add	$s1, $a2, $a0
	lw	$a0, 0($s1)
	lw	$a2, 8($sp)
	add	$a1, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	get_surface_id.2849
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.9005
	addi	$a0, $zero, 1
	jr	$ra
bne_else.9005:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.9004:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.9003:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.9002:
	addi	$a0, $zero, 0
	jr	$ra
try_exploit_neighbors.2858:
	lw	$t2, 8($s7)
	lw	$t3, 4($s7)
	sll	$t4, $a0, 2
	add	$s1, $a3, $t4
	lw	$t4, 0($s1)
	addi	$t5, $zero, 4
	slt	$s0, $t5, $t1
	beq	$s0, $zero, bne_else.9006
	jr	$ra
bne_else.9006:
	sw	$a1, 0($sp)
	sw	$s7, 4($sp)
	sw	$t3, 8($sp)
	sw	$t4, 12($sp)
	sw	$t2, 16($sp)
	sw	$t1, 20($sp)
	sw	$t0, 24($sp)
	sw	$a3, 28($sp)
	sw	$a2, 32($sp)
	sw	$a0, 36($sp)
	add	$a1, $zero, $t1
	add	$a0, $zero, $t4
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	get_surface_id.2849
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9008
	jr	$ra
bne_else.9008:
	lw	$a0, 36($sp)
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$a3, 24($sp)
	lw	$t0, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	neighbors_are_available.2852
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	bne	$a0, $zero, bne_else.9010
	lw	$a0, 36($sp)
	sll	$a0, $a0, 2
	lw	$a1, 28($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	lw	$a1, 20($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9010:
	lw	$a0, 12($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_calc_diffuse.2578
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$t0, 20($sp)
	sll	$a1, $t0, 2
	add	$s1, $a0, $a1
	lw	$a0, 0($s1)
	bne	$a0, $zero, beq_else.9011
	j	beq_cont.9012
beq_else.9011:
	lw	$a0, 36($sp)
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$a3, 24($sp)
	lw	$s7, 8($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9013
	lalo	$ra, tmp.9013
	jr	$s6
tmp.9013:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
beq_cont.9012:
	lw	$a0, 20($sp)
	addi	$t1, $a0, 1
	lw	$a0, 36($sp)
	lw	$a1, 0($sp)
	lw	$a2, 32($sp)
	lw	$a3, 28($sp)
	lw	$t0, 24($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
syou.2865:
	slt	$s0, $a0, $a1
	beq	$s0, $zero, bne_else.9014
	addi	$a0, $zero, 0
	jr	$ra
bne_else.9014:
	sub	$a0, $a0, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	syou.2865
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $a0, 1
	jr	$ra
amari.2868:
	slt	$s0, $a0, $a1
	beq	$s0, $zero, bne_else.9015
	jr	$ra
bne_else.9015:
	sub	$a0, $a0, $a1
	j	amari.2868
print_my_sub.2871:
	slti	$s0, $a0, 10
	beq	$s0, $zero, bne_else.9016
	addi	$a0, $a0, 48
	outc	$a0
	jr	$ra
bne_else.9016:
	addi	$a1, $zero, 10
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	syou.2865
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	print_my_sub.2871
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 10
	lw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	amari.2868
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $a0, 48
	outc	$a0
	jr	$ra
write_ppm_header.2873:
	lw	$a0, 4($s7)
	addi	$a1, $zero, 80
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	outc	$a0
	addi	$a0, $zero, 54
	outc	$a0
	addi	$a0, $zero, 10
	outc	$a0
	lw	$a0, 0($sp)
	lw	$a1, 0($a0)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	print_my_sub.2871
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 32
	outc	$a0
	lw	$a0, 0($sp)
	lw	$a0, 4($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	print_my_sub.2871
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 32
	outc	$a0
	addi	$a0, $zero, 50
	outc	$a0
	addi	$a0, $zero, 53
	outc	$a0
	addi	$a0, $zero, 53
	outc	$a0
	addi	$a0, $zero, 10
	outc	$a0
	jr	$ra
write_rgb_element.2875:
	ftoi	$a0, $f0
	addi	$a1, $zero, 255
	slt	$s0, $a1, $a0
	beq	$s0, $zero, bne_else.9017
	addi	$a0, $zero, 255
	j	bne_cont.9018
bne_else.9017:
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9019
	addi	$a0, $zero, 0
	j	bne_cont.9020
bne_else.9019:
bne_cont.9020:
bne_cont.9018:
	outc	$a0
	jr	$ra
write_rgb.2877:
	lw	$a0, 4($s7)
	lwc1	$f0, 0($a0)
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.2875
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f0, 4($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.2875
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f0, 8($a0)
	j	write_rgb_element.2875
pretrace_diffuse_rays.2879:
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	addi	$t1, $zero, 4
	slt	$s0, $t1, $a1
	beq	$s0, $zero, bne_else.9021
	jr	$ra
bne_else.9021:
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a3, 8($sp)
	sw	$t0, 12($sp)
	sw	$a1, 16($sp)
	sw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	get_surface_id.2849
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9023
	jr	$ra
bne_else.9023:
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_calc_diffuse.2578
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 16($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a0, 0($s1)
	bne	$a0, $zero, beq_else.9025
	j	beq_cont.9026
beq_else.9025:
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_group_id.2584
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 12($sp)
	sw	$a0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	vecbzero.2492
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.2589
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	sw	$a0, 28($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_intersection_points.2574
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 24($sp)
	sll	$a1, $a1, 2
	lw	$a2, 8($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lw	$a2, 16($sp)
	sll	$a3, $a2, 2
	lw	$t0, 28($sp)
	add	$s1, $t0, $a3
	lw	$a3, 0($s1)
	sll	$t0, $a2, 2
	add	$s1, $a0, $t0
	lw	$a0, 0($s1)
	lw	$s7, 4($sp)
	add	$a2, $zero, $a0
	add	$a0, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9027
	lalo	$ra, tmp.9027
	jr	$s6
tmp.9027:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_received_ray_20percent.2582
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 16($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a0, 0($s1)
	lw	$a2, 12($sp)
	add	$a1, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veccpy.2494
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.9026:
	lw	$a0, 16($sp)
	addi	$a1, $a0, 1
	lw	$a0, 20($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
pretrace_pixels.2882:
	lw	$a3, 36($s7)
	lw	$t0, 32($s7)
	lw	$t1, 28($s7)
	lw	$t2, 24($s7)
	lw	$t3, 20($s7)
	lw	$t4, 16($s7)
	lw	$t5, 12($s7)
	lw	$t6, 8($s7)
	lw	$t7, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.9028
	jr	$ra
bne_else.9028:
	lwc1	$f3, 0($t3)
	lw	$t3, 0($t7)
	sub	$t3, $a1, $t3
	sw	$s7, 0($sp)
	sw	$t6, 4($sp)
	sw	$a2, 8($sp)
	sw	$t0, 12($sp)
	sw	$a0, 16($sp)
	sw	$a1, 20($sp)
	sw	$a3, 24($sp)
	sw	$t1, 28($sp)
	sw	$t4, 32($sp)
	swc1	$f2, 40($sp)
	swc1	$f1, 48($sp)
	sw	$t5, 56($sp)
	swc1	$f0, 64($sp)
	sw	$t2, 72($sp)
	swc1	$f3, 80($sp)
	add	$a0, $zero, $t3
	itof	$f0, $a0
	lwc1	$f1, 80($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 72($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f0, $f1
	lwc1	$f2, 64($sp)
	add.s	$f1, $f1, $f2
	lw	$a1, 56($sp)
	swc1	$f1, 0($a1)
	lwc1	$f1, 4($a0)
	mul.s	$f1, $f0, $f1
	lwc1	$f3, 48($sp)
	add.s	$f1, $f1, $f3
	swc1	$f1, 4($a1)
	lwc1	$f1, 8($a0)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 40($sp)
	add.s	$f0, $f0, $f1
	swc1	$f0, 8($a1)
	addi	$a0, $zero, 0
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	vecunit_sgn.2502
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 32($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	vecbzero.2492
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	veccpy.2494
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	addi	$a0, $zero, 0
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 20($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lw	$t0, 56($sp)
	lw	$s7, 12($sp)
	add	$a1, $zero, $t0
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9033
	lalo	$ra, tmp.9033
	jr	$s6
tmp.9033:
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 20($sp)
	sll	$a1, $a0, 2
	lw	$a2, 16($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	add	$a0, $zero, $a1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	p_rgb.2572
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a1, 32($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	veccpy.2494
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 20($sp)
	sll	$a1, $a0, 2
	lw	$a2, 16($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	lw	$a3, 8($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	p_set_group_id.2586
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 20($sp)
	sll	$a1, $a0, 2
	lw	$a2, 16($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	addi	$a3, $zero, 0
	lw	$s7, 4($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9034
	lalo	$ra, tmp.9034
	jr	$s6
tmp.9034:
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 20($sp)
	addi	$a0, $a0, -1
	addi	$a1, $zero, 1
	lw	$a2, 8($sp)
	sw	$a0, 88($sp)
	add	$a0, $zero, $a2
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	add_mod5.2481
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	add	$a2, $a0, $zero
	lwc1	$f0, 64($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 40($sp)
	lw	$a0, 16($sp)
	lw	$a1, 88($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
pretrace_line.2889:
	lw	$a3, 24($s7)
	lw	$t0, 20($s7)
	lw	$t1, 16($s7)
	lw	$t2, 12($s7)
	lw	$t3, 8($s7)
	lw	$t4, 4($s7)
	lwc1	$f0, 0($t1)
	lw	$t1, 4($t4)
	sub	$a1, $a1, $t1
	sw	$a2, 0($sp)
	sw	$a0, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	sw	$a3, 16($sp)
	sw	$t0, 20($sp)
	swc1	$f0, 24($sp)
	add	$a0, $zero, $a1
	itof	$f0, $a0
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 20($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f0, $f1
	lw	$a1, 16($sp)
	lwc1	$f2, 0($a1)
	add.s	$f1, $f1, $f2
	lwc1	$f2, 4($a0)
	mul.s	$f2, $f0, $f2
	lwc1	$f3, 4($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 8($a0)
	mul.s	$f0, $f0, $f3
	lwc1	$f3, 8($a1)
	add.s	$f0, $f0, $f3
	lw	$a0, 12($sp)
	lw	$a0, 0($a0)
	addi	$a1, $a0, -1
	lw	$a0, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	add.s	$f30, $fzero, $f2
	add.s	$f2, $fzero, $f0
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f30
	lw	$s6, 0($s7)
	jr	$s6
scan_pixel.2893:
	lw	$t1, 24($s7)
	lw	$t2, 20($s7)
	lw	$t3, 16($s7)
	lw	$t4, 12($s7)
	lw	$t5, 8($s7)
	lw	$t6, 4($s7)
	lw	$t5, 0($t5)
	slt	$s0, $a0, $t5
	beq	$s0, $zero, bne_else.9035
	sll	$t5, $a0, 2
	add	$s1, $a3, $t5
	lw	$t5, 0($s1)
	sw	$s7, 0($sp)
	sw	$t1, 4($sp)
	sw	$a2, 8($sp)
	sw	$t2, 12($sp)
	sw	$t6, 16($sp)
	sw	$a3, 20($sp)
	sw	$t0, 24($sp)
	sw	$a1, 28($sp)
	sw	$a0, 32($sp)
	sw	$t4, 36($sp)
	sw	$t3, 40($sp)
	add	$a0, $zero, $t5
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_rgb.2572
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	add	$a1, $a0, $zero
	lw	$a0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2494
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 32($sp)
	lw	$a1, 28($sp)
	lw	$a2, 24($sp)
	lw	$s7, 36($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9036
	lalo	$ra, tmp.9036
	jr	$s6
tmp.9036:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	bne	$a0, $zero, beq_else.9037
	lw	$a0, 32($sp)
	sll	$a1, $a0, 2
	lw	$a2, 20($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	addi	$a3, $zero, 0
	lw	$s7, 16($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9039
	lalo	$ra, tmp.9039
	jr	$s6
tmp.9039:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	j	beq_cont.9038
beq_else.9037:
	addi	$t1, $zero, 0
	lw	$a0, 32($sp)
	lw	$a1, 28($sp)
	lw	$a2, 8($sp)
	lw	$a3, 20($sp)
	lw	$t0, 24($sp)
	lw	$s7, 12($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9040
	lalo	$ra, tmp.9040
	jr	$s6
tmp.9040:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
beq_cont.9038:
	lw	$s7, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9041
	lalo	$ra, tmp.9041
	jr	$s6
tmp.9041:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 32($sp)
	addi	$a0, $a0, 1
	lw	$a1, 28($sp)
	lw	$a2, 8($sp)
	lw	$a3, 20($sp)
	lw	$t0, 24($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9035:
	jr	$ra
scan_line.2899:
	lw	$t1, 12($s7)
	lw	$t2, 8($s7)
	lw	$t3, 4($s7)
	lw	$t4, 4($t3)
	slt	$s0, $a0, $t4
	beq	$s0, $zero, bne_else.9043
	lw	$t3, 4($t3)
	addi	$t3, $t3, -1
	sw	$s7, 0($sp)
	sw	$t0, 4($sp)
	sw	$a3, 8($sp)
	sw	$a2, 12($sp)
	sw	$a1, 16($sp)
	sw	$a0, 20($sp)
	sw	$t1, 24($sp)
	slt	$s0, $a0, $t3
	beq	$s0, $zero, bne_else.9044
	addi	$t3, $a0, 1
	add	$a2, $zero, $t0
	add	$a1, $zero, $t3
	add	$a0, $zero, $a3
	add	$s7, $zero, $t2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9046
	lalo	$ra, tmp.9046
	jr	$s6
tmp.9046:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	j	bne_cont.9045
bne_else.9044:
bne_cont.9045:
	addi	$a0, $zero, 0
	lw	$a1, 20($sp)
	lw	$a2, 16($sp)
	lw	$a3, 12($sp)
	lw	$t0, 8($sp)
	lw	$s7, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9047
	lalo	$ra, tmp.9047
	jr	$s6
tmp.9047:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 20($sp)
	addi	$a0, $a0, 1
	addi	$a1, $zero, 2
	lw	$a2, 4($sp)
	sw	$a0, 28($sp)
	add	$a0, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	add_mod5.2481
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add	$t0, $a0, $zero
	lw	$a0, 28($sp)
	lw	$a1, 12($sp)
	lw	$a2, 8($sp)
	lw	$a3, 16($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9043:
	jr	$ra
create_float5x3array.2905:
	addi	$a0, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	add	$a1, $a0, $zero
	addi	$a0, $zero, 5
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	sw	$a0, 4($a1)
	addi	$a0, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	sw	$a0, 8($a1)
	addi	$a0, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	sw	$a0, 12($a1)
	addi	$a0, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	sw	$a0, 16($a1)
	add	$a0, $a1, $zero
	jr	$ra
create_pixel.2907:
	addi	$a0, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	create_float5x3array.2905
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 5
	addi	$a2, $zero, 0
	sw	$a0, 4($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a1, $zero, 5
	addi	$a2, $zero, 0
	sw	$a0, 8($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	create_float5x3array.2905
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	create_float5x3array.2905
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a1, $zero, 1
	addi	$a2, $zero, 0
	sw	$a0, 20($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_array
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	sw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	create_float5x3array.2905
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 32
	sw	$a0, 28($a1)
	lw	$a0, 24($sp)
	sw	$a0, 24($a1)
	lw	$a0, 20($sp)
	sw	$a0, 20($a1)
	lw	$a0, 16($sp)
	sw	$a0, 16($a1)
	lw	$a0, 12($sp)
	sw	$a0, 12($a1)
	lw	$a0, 8($sp)
	sw	$a0, 8($a1)
	lw	$a0, 4($sp)
	sw	$a0, 4($a1)
	lw	$a0, 0($sp)
	sw	$a0, 0($a1)
	add	$a0, $a1, $zero
	jr	$ra
init_line_elements.2909:
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.9049
	jr	$ra
bne_else.9049:
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	create_pixel.2907
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 0($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	addi	$a1, $a1, -1
	add	$a0, $zero, $a3
	j	init_line_elements.2909
create_pixelline.2912:
	lw	$a0, 4($s7)
	lw	$a1, 0($a0)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	create_pixel.2907
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	add	$a1, $a0, $zero
	lw	$a0, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 0($sp)
	lw	$a1, 0($a1)
	addi	$a1, $a1, -2
	j	init_line_elements.2909
tan.2914:
	swc1	$f0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_sin
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lwc1	$f1, 0($sp)
	swc1	$f0, 8($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_cos
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 8($sp)
	div.s	$f0, $f1, $f0
	jr	$ra
adjust_position.2916:
	mul.s	$f0, $f0, $f0
	lui	$s1, 15820
	ori	$s1, $s1, 52429
	mtc1	$s1, $f2
	add.s	$f0, $f0, $f2
	swc1	$f1, 0($sp)
	sqrt	$f0, $f0
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	div.s	$f1, $f1, $f0
	swc1	$f0, 8($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_atan
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 0($sp)
	mul.s	$f0, $f0, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	tan.2914
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 8($sp)
	mul.s	$f0, $f0, $f1
	jr	$ra
calc_dirvec.2919:
	lw	$a3, 4($s7)
	slti	$s0, $a0, 5
	beq	$s0, $zero, bne_else.9050
	swc1	$f2, 0($sp)
	sw	$a2, 8($sp)
	sw	$a1, 12($sp)
	sw	$s7, 16($sp)
	swc1	$f3, 24($sp)
	sw	$a0, 32($sp)
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	adjust_position.2916
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 32($sp)
	addi	$a0, $a0, 1
	lwc1	$f1, 24($sp)
	swc1	$f0, 40($sp)
	sw	$a0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	adjust_position.2916
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 40($sp)
	lwc1	$f2, 0($sp)
	lwc1	$f3, 24($sp)
	lw	$a0, 48($sp)
	lw	$a1, 12($sp)
	lw	$a2, 8($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9050:
	sw	$a2, 8($sp)
	sw	$a3, 52($sp)
	sw	$a1, 12($sp)
	swc1	$f0, 56($sp)
	swc1	$f1, 64($sp)
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 64($sp)
	swc1	$f0, 72($sp)
	add.s	$f0, $fzero, $f1
	mul.s	$f0, $f0, $f0
	lwc1	$f1, 72($sp)
	add.s	$f0, $f1, $f0
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	add.s	$f0, $f0, $f1
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	div.s	$f1, $f1, $f0
	lwc1	$f2, 64($sp)
	div.s	$f2, $f2, $f0
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f3
	div.s	$f0, $f3, $f0
	lw	$a0, 12($sp)
	sll	$a0, $a0, 2
	lw	$a1, 52($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	lw	$a1, 8($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a2
	lw	$a2, 0($s1)
	sw	$a0, 80($sp)
	swc1	$f0, 88($sp)
	swc1	$f2, 96($sp)
	swc1	$f1, 104($sp)
	add	$a0, $zero, $a2
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	d_vec.2591
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f0, 104($sp)
	lwc1	$f1, 96($sp)
	lwc1	$f2, 88($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	vecset.2484
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, 40
	sll	$a1, $a1, 2
	lw	$a2, 80($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	add	$a0, $zero, $a1
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	d_vec.2591
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f0, 96($sp)
	sub.s	$f2, $fzero, $f0
	lwc1	$f1, 104($sp)
	lwc1	$f3, 88($sp)
	swc1	$f2, 112($sp)
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f3
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	vecset.2484
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, 80
	sll	$a1, $a1, 2
	lw	$a2, 80($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	add	$a0, $zero, $a1
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	d_vec.2591
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lwc1	$f0, 104($sp)
	sub.s	$f1, $fzero, $f0
	lwc1	$f2, 88($sp)
	lwc1	$f3, 112($sp)
	swc1	$f1, 120($sp)
	add.s	$f0, $fzero, $f2
	add.s	$f2, $fzero, $f3
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	vecset.2484
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, 1
	sll	$a1, $a1, 2
	lw	$a2, 80($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	add	$a0, $zero, $a1
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	d_vec.2591
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	lwc1	$f0, 88($sp)
	sub.s	$f2, $fzero, $f0
	lwc1	$f0, 120($sp)
	lwc1	$f1, 112($sp)
	swc1	$f2, 128($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	vecset.2484
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, 41
	sll	$a1, $a1, 2
	lw	$a2, 80($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	add	$a0, $zero, $a1
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	d_vec.2591
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lwc1	$f0, 120($sp)
	lwc1	$f1, 128($sp)
	lwc1	$f2, 96($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	vecset.2484
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lw	$a0, 8($sp)
	addi	$a0, $a0, 81
	sll	$a0, $a0, 2
	lw	$a1, 80($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	d_vec.2591
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lwc1	$f0, 128($sp)
	lwc1	$f1, 104($sp)
	lwc1	$f2, 96($sp)
	j	vecset.2484
calc_dirvecs.2927:
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9054
	jr	$ra
bne_else.9054:
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	swc1	$f0, 8($sp)
	sw	$a2, 16($sp)
	sw	$a1, 20($sp)
	sw	$a3, 24($sp)
	itof	$f0, $a0
	lui	$s1, 15948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	lui	$s1, 16230
	ori	$s1, $s1, 26214
	mtc1	$s1, $f1
	sub.s	$f2, $f0, $f1
	addi	$a0, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lwc1	$f3, 8($sp)
	lw	$a1, 20($sp)
	lw	$a2, 16($sp)
	lw	$s7, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9056
	lalo	$ra, tmp.9056
	jr	$s6
tmp.9056:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 4($sp)
	itof	$f0, $a0
	lui	$s1, 15948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	lui	$s1, 15820
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	add.s	$f2, $f0, $f1
	addi	$a0, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lw	$a1, 16($sp)
	addi	$a2, $a1, 2
	lwc1	$f3, 8($sp)
	lw	$a3, 20($sp)
	lw	$s7, 24($sp)
	add	$a1, $zero, $a3
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9057
	lalo	$ra, tmp.9057
	jr	$s6
tmp.9057:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	addi	$a1, $zero, 1
	lw	$a2, 20($sp)
	sw	$a0, 28($sp)
	add	$a0, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	add_mod5.2481
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add	$a1, $a0, $zero
	lwc1	$f0, 8($sp)
	lw	$a0, 28($sp)
	lw	$a2, 16($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
calc_dirvec_rows.2932:
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9058
	jr	$ra
bne_else.9058:
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	sw	$a1, 12($sp)
	sw	$a3, 16($sp)
	itof	$f0, $a0
	lui	$s1, 15948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	lui	$s1, 16230
	ori	$s1, $s1, 26214
	mtc1	$s1, $f1
	sub.s	$f0, $f0, $f1
	addi	$a0, $zero, 4
	lw	$a1, 12($sp)
	lw	$a2, 8($sp)
	lw	$s7, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9060
	lalo	$ra, tmp.9060
	jr	$s6
tmp.9060:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	addi	$a1, $zero, 2
	lw	$a2, 12($sp)
	sw	$a0, 20($sp)
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	add_mod5.2481
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	add	$a1, $a0, $zero
	lw	$a0, 8($sp)
	addi	$a2, $a0, 4
	lw	$a0, 20($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
create_dirvec.2936:
	lw	$a0, 4($s7)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	add	$a1, $a0, $zero
	lw	$a0, 0($sp)
	lw	$a0, 0($a0)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 8
	sw	$a0, 4($a1)
	lw	$a0, 4($sp)
	sw	$a0, 0($a1)
	add	$a0, $a1, $zero
	jr	$ra
create_dirvec_elements.2938:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.9061
	jr	$ra
bne_else.9061:
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	add	$s7, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9063
	lalo	$ra, tmp.9063
	jr	$s6
tmp.9063:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 8($sp)
	sll	$a2, $a1, 2
	lw	$a3, 4($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	addi	$a1, $a1, -1
	lw	$s7, 0($sp)
	add	$a0, $zero, $a3
	lw	$s6, 0($s7)
	jr	$s6
create_dirvecs.2941:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9064
	jr	$ra
bne_else.9064:
	addi	$t0, $zero, 120
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a1, 8($sp)
	sw	$a0, 12($sp)
	sw	$t0, 16($sp)
	add	$s7, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9066
	lalo	$ra, tmp.9066
	jr	$s6
tmp.9066:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	add	$a1, $a0, $zero
	lw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_array
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sll	$a2, $a1, 2
	lw	$a3, 8($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	sll	$a0, $a1, 2
	add	$s1, $a3, $a0
	lw	$a0, 0($s1)
	addi	$a2, $zero, 118
	lw	$s7, 4($sp)
	add	$a1, $zero, $a2
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9067
	lalo	$ra, tmp.9067
	jr	$s6
tmp.9067:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	addi	$a0, $a0, -1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
init_dirvec_constants.2943:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.9068
	jr	$ra
bne_else.9068:
	sll	$a3, $a1, 2
	add	$s1, $a0, $a3
	lw	$a3, 0($s1)
	sw	$a0, 0($sp)
	sw	$s7, 4($sp)
	sw	$a1, 8($sp)
	add	$a0, $zero, $a3
	add	$s7, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9070
	lalo	$ra, tmp.9070
	jr	$s6
tmp.9070:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, -1
	lw	$a0, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
init_vecset_constants.2946:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9071
	jr	$ra
bne_else.9071:
	sll	$a3, $a0, 2
	add	$s1, $a2, $a3
	lw	$a2, 0($s1)
	addi	$a3, $zero, 119
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	add	$a0, $zero, $a2
	add	$s7, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9073
	lalo	$ra, tmp.9073
	jr	$s6
tmp.9073:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
init_dirvecs.2948:
	lw	$a0, 12($s7)
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	addi	$a3, $zero, 4
	sw	$a0, 0($sp)
	sw	$a2, 4($sp)
	add	$a0, $zero, $a3
	add	$s7, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9074
	lalo	$ra, tmp.9074
	jr	$s6
tmp.9074:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a0, $zero, 9
	addi	$a1, $zero, 0
	addi	$a2, $zero, 0
	lw	$s7, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9075
	lalo	$ra, tmp.9075
	jr	$s6
tmp.9075:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a0, $zero, 4
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
add_reflection.2950:
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$s7, 4($s7)
	sw	$a3, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	swc1	$f0, 16($sp)
	sw	$a2, 24($sp)
	swc1	$f3, 32($sp)
	swc1	$f2, 40($sp)
	swc1	$f1, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9078
	lalo	$ra, tmp.9078
	jr	$s6
tmp.9078:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	sw	$a0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.2591
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f0, 48($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecset.2484
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a0, 56($sp)
	lw	$s7, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9079
	lalo	$ra, tmp.9079
	jr	$s6
tmp.9079:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	add	$a0, $gp, $zero
	addi	$gp, $gp, 16
	lwc1	$f0, 16($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 56($sp)
	sw	$a1, 4($a0)
	lw	$a1, 8($sp)
	sw	$a1, 0($a0)
	lw	$a1, 4($sp)
	sll	$a1, $a1, 2
	lw	$a2, 0($sp)
	add	$s1, $a2, $a1
	sw	$a0, 0($s1)
	jr	$ra
setup_rect_reflection.2957:
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sll	$a0, $a0, 2
	lw	$t1, 0($a2)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a2, 0($sp)
	sw	$t1, 4($sp)
	sw	$t0, 8($sp)
	sw	$a0, 12($sp)
	sw	$a3, 16($sp)
	swc1	$f0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_diffuse.2554
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	lwc1	$f1, 0($a0)
	sub.s	$f1, $fzero, $f1
	lwc1	$f2, 4($a0)
	sub.s	$f2, $fzero, $f2
	lwc1	$f3, 8($a0)
	sub.s	$f3, $fzero, $f3
	lw	$a1, 12($sp)
	addi	$a2, $a1, 1
	lwc1	$f4, 0($a0)
	lw	$a3, 4($sp)
	lw	$s7, 8($sp)
	swc1	$f2, 32($sp)
	swc1	$f3, 40($sp)
	swc1	$f1, 48($sp)
	swc1	$f0, 56($sp)
	add	$a1, $zero, $a2
	add	$a0, $zero, $a3
	add.s	$f1, $fzero, $f4
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9082
	lalo	$ra, tmp.9082
	jr	$s6
tmp.9082:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 4($sp)
	addi	$a1, $a0, 1
	lw	$a2, 12($sp)
	addi	$a3, $a2, 2
	lw	$t0, 16($sp)
	lwc1	$f2, 4($t0)
	lwc1	$f0, 56($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f3, 40($sp)
	lw	$s7, 8($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9083
	lalo	$ra, tmp.9083
	jr	$s6
tmp.9083:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 4($sp)
	addi	$a1, $a0, 2
	lw	$a2, 12($sp)
	addi	$a2, $a2, 3
	lw	$a3, 16($sp)
	lwc1	$f3, 8($a3)
	lwc1	$f0, 56($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 32($sp)
	lw	$s7, 8($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9084
	lalo	$ra, tmp.9084
	jr	$s6
tmp.9084:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, 3
	lw	$a1, 0($sp)
	sw	$a0, 0($a1)
	jr	$ra
setup_surface_reflection.2960:
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sll	$a0, $a0, 2
	addi	$a0, $a0, 1
	lw	$t1, 0($a2)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a2, 0($sp)
	sw	$a0, 4($sp)
	sw	$t1, 8($sp)
	sw	$t0, 12($sp)
	sw	$a3, 16($sp)
	sw	$a1, 20($sp)
	swc1	$f0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_diffuse.2554
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 20($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_abc.2546
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	add	$a1, $a0, $zero
	lw	$a0, 16($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veciprod.2505
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lw	$a0, 20($sp)
	swc1	$f0, 40($sp)
	swc1	$f1, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_a.2540
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 16($sp)
	lwc1	$f2, 0($a0)
	sub.s	$f0, $f0, $f2
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	lw	$a1, 20($sp)
	swc1	$f0, 56($sp)
	swc1	$f2, 64($sp)
	add	$a0, $zero, $a1
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_b.2542
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 16($sp)
	lwc1	$f2, 4($a0)
	sub.s	$f0, $f0, $f2
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f2
	lw	$a1, 20($sp)
	swc1	$f0, 72($sp)
	swc1	$f2, 80($sp)
	add	$a0, $zero, $a1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_param_c.2544
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lwc1	$f1, 80($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 16($sp)
	lwc1	$f1, 8($a0)
	sub.s	$f3, $f0, $f1
	lwc1	$f0, 32($sp)
	lwc1	$f1, 56($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 8($sp)
	lw	$a1, 4($sp)
	lw	$s7, 12($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9086
	lalo	$ra, tmp.9086
	jr	$s6
tmp.9086:
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 8($sp)
	addi	$a0, $a0, 1
	lw	$a1, 0($sp)
	sw	$a0, 0($a1)
	jr	$ra
setup_reflections.2963:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9088
	jr	$ra
bne_else.9088:
	sll	$t0, $a0, 2
	add	$s1, $a3, $t0
	lw	$a3, 0($s1)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	sw	$a3, 12($sp)
	add	$a0, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_reflectiontype.2534
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.9090
	lw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_diffuse.2554
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$a0, $f0, $f1
	bne	$a0, $zero, bne_else.9091
	jr	$ra
bne_else.9091:
	lw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2532
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.9093
	lw	$a0, 4($sp)
	lw	$a1, 12($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9093:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.9094
	lw	$a0, 4($sp)
	lw	$a1, 12($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9094:
	jr	$ra
bne_else.9090:
	jr	$ra
rt.2965:
	lw	$a2, 56($s7)
	lw	$a3, 52($s7)
	lw	$t0, 48($s7)
	lw	$t1, 44($s7)
	lw	$t2, 40($s7)
	lw	$t3, 36($s7)
	lw	$t4, 32($s7)
	lw	$t5, 28($s7)
	lw	$t6, 24($s7)
	lw	$t7, 20($s7)
	lw	$t8, 16($s7)
	lw	$t9, 12($s7)
	lw	$k0, 8($s7)
	lw	$k1, 4($s7)
	sw	$a0, 0($t9)
	sw	$a1, 4($t9)
	srl	$t9, $a0, 1
	sw	$t9, 0($k0)
	srl	$a1, $a1, 1
	sw	$a1, 4($k0)
	lui	$s1, 17152
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$t2, 0($sp)
	sw	$t4, 4($sp)
	sw	$a3, 8($sp)
	sw	$t5, 12($sp)
	sw	$t0, 16($sp)
	sw	$t7, 20($sp)
	sw	$t6, 24($sp)
	sw	$t8, 28($sp)
	sw	$a2, 32($sp)
	sw	$t3, 36($sp)
	sw	$k1, 40($sp)
	sw	$t1, 44($sp)
	swc1	$f0, 48($sp)
	itof	$f0, $a0
	lwc1	$f1, 48($sp)
	div.s	$f0, $f1, $f0
	lw	$a0, 44($sp)
	swc1	$f0, 0($a0)
	lw	$s7, 40($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9097
	lalo	$ra, tmp.9097
	jr	$s6
tmp.9097:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$s7, 40($sp)
	sw	$a0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9098
	lalo	$ra, tmp.9098
	jr	$s6
tmp.9098:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$s7, 40($sp)
	sw	$a0, 60($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9099
	lalo	$ra, tmp.9099
	jr	$s6
tmp.9099:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$s7, 36($sp)
	sw	$a0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9100
	lalo	$ra, tmp.9100
	jr	$s6
tmp.9100:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$s7, 32($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9101
	lalo	$ra, tmp.9101
	jr	$s6
tmp.9101:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$s7, 28($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9102
	lalo	$ra, tmp.9102
	jr	$s6
tmp.9102:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 24($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	d_vec.2591
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 20($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	veccpy.2494
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 24($sp)
	lw	$s7, 16($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9103
	lalo	$ra, tmp.9103
	jr	$s6
tmp.9103:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 12($sp)
	lw	$a0, 0($a0)
	addi	$a0, $a0, -1
	lw	$s7, 8($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9104
	lalo	$ra, tmp.9104
	jr	$s6
tmp.9104:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	addi	$a1, $zero, 0
	addi	$a2, $zero, 0
	lw	$a0, 60($sp)
	lw	$s7, 4($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9105
	lalo	$ra, tmp.9105
	jr	$s6
tmp.9105:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	addi	$a0, $zero, 0
	addi	$t0, $zero, 2
	lw	$a1, 56($sp)
	lw	$a2, 60($sp)
	lw	$a3, 64($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
_min_caml_start:
	lui	$sp, 1
	lui	$gp, 3
	addi	$a0, $zero, 1
	addi	$a1, $zero, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 60
	addi	$a2, $zero, 0
	addi	$a3, $zero, 0
	addi	$t0, $zero, 0
	addi	$t1, $zero, 0
	addi	$t2, $zero, 0
	add	$t3, $gp, $zero
	addi	$gp, $gp, 48
	sw	$a0, 40($t3)
	sw	$a0, 36($t3)
	sw	$a0, 32($t3)
	sw	$a0, 28($t3)
	sw	$t2, 24($t3)
	sw	$a0, 20($t3)
	sw	$a0, 16($t3)
	sw	$t1, 12($t3)
	sw	$t0, 8($t3)
	sw	$a3, 4($t3)
	sw	$a2, 0($t3)
	add	$a0, $t3, $zero
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 12($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_float_array
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a1, $zero, 1
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 16($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_create_float_array
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a1, $zero, 50
	addi	$a2, $zero, 1
	addi	$a3, $zero, -1
	sw	$a0, 20($sp)
	sw	$a1, 24($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_array
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	add	$a1, $a0, $zero
	lw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_create_array
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	addi	$a1, $zero, 1
	addi	$a2, $zero, 1
	lw	$a3, 0($a0)
	sw	$a0, 28($sp)
	sw	$a1, 32($sp)
	add	$a1, $zero, $a3
	add	$a0, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_create_array
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add	$a1, $a0, $zero
	lw	$a0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_create_array
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	addi	$a1, $zero, 1
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 36($sp)
	add	$a0, $zero, $a1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_float_array
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	addi	$a1, $zero, 1
	addi	$a2, $zero, 0
	sw	$a0, 40($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_create_array
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	addi	$a1, $zero, 1
	lui	$s1, 20078
	ori	$s1, $s1, 27432
	mtc1	$s1, $f0
	sw	$a0, 44($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_create_float_array
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 48($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_create_float_array
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	addi	$a1, $zero, 1
	addi	$a2, $zero, 0
	sw	$a0, 52($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_create_array
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 56($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_create_float_array
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 60($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_create_float_array
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 64($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_create_float_array
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 68($sp)
	add	$a0, $zero, $a1
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_create_float_array
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	addi	$a1, $zero, 2
	addi	$a2, $zero, 0
	sw	$a0, 72($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_create_array
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	addi	$a1, $zero, 2
	addi	$a2, $zero, 0
	sw	$a0, 76($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_create_array
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	addi	$a1, $zero, 1
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 80($sp)
	add	$a0, $zero, $a1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_create_float_array
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 84($sp)
	add	$a0, $zero, $a1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_create_float_array
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 88($sp)
	add	$a0, $zero, $a1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_create_float_array
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 92($sp)
	add	$a0, $zero, $a1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_create_float_array
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 96($sp)
	add	$a0, $zero, $a1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_create_float_array
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 100($sp)
	add	$a0, $zero, $a1
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_create_float_array
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 104($sp)
	add	$a0, $zero, $a1
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_create_float_array
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	addi	$a1, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 108($sp)
	add	$a0, $zero, $a1
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_float_array
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	add	$a1, $a0, $zero
	addi	$a0, $zero, 0
	sw	$a1, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_array
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	addi	$a1, $zero, 0
	add	$a2, $gp, $zero
	addi	$gp, $gp, 8
	sw	$a0, 4($a2)
	lw	$a0, 112($sp)
	sw	$a0, 0($a2)
	add	$a0, $a2, $zero
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_array
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	add	$a1, $a0, $zero
	addi	$a0, $zero, 5
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_create_array
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	addi	$a1, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 116($sp)
	add	$a0, $zero, $a1
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_float_array
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	addi	$a1, $zero, 3
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 120($sp)
	add	$a0, $zero, $a1
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_create_float_array
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	addi	$a1, $zero, 60
	lw	$a2, 120($sp)
	sw	$a0, 124($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_create_array
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 8
	sw	$a0, 4($a1)
	lw	$a0, 124($sp)
	sw	$a0, 0($a1)
	add	$a0, $a1, $zero
	addi	$a1, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 128($sp)
	add	$a0, $zero, $a1
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_create_float_array
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	add	$a1, $a0, $zero
	addi	$a0, $zero, 0
	sw	$a1, 132($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_create_array
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 8
	sw	$a0, 4($a1)
	lw	$a0, 132($sp)
	sw	$a0, 0($a1)
	add	$a0, $a1, $zero
	addi	$a1, $zero, 180
	addi	$a2, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	add	$a3, $gp, $zero
	addi	$gp, $gp, 16
	swc1	$f0, 8($a3)
	sw	$a0, 4($a3)
	sw	$a2, 0($a3)
	add	$a0, $a3, $zero
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_create_array
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	addi	$a1, $zero, 1
	addi	$a2, $zero, 0
	sw	$a0, 136($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_create_array
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$a2, read_screen_settings.2603
	lalo	$a2, read_screen_settings.2603
	sw	$a2, 0($a1)
	lw	$a2, 12($sp)
	sw	$a2, 20($a1)
	lw	$a3, 104($sp)
	sw	$a3, 16($a1)
	lw	$t0, 100($sp)
	sw	$t0, 12($a1)
	lw	$t1, 96($sp)
	sw	$t1, 8($a1)
	lw	$t2, 8($sp)
	sw	$t2, 4($a1)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t3, read_light.2605
	lalo	$t3, read_light.2605
	sw	$t3, 0($t2)
	lw	$t3, 16($sp)
	sw	$t3, 8($t2)
	lw	$t4, 20($sp)
	sw	$t4, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t6, read_nth_object.2610
	lalo	$t6, read_nth_object.2610
	sw	$t6, 0($t5)
	lw	$t6, 4($sp)
	sw	$t6, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t8, read_object.2612
	lalo	$t8, read_object.2612
	sw	$t8, 0($t7)
	sw	$t5, 8($t7)
	lw	$t5, 0($sp)
	sw	$t5, 4($t7)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, read_all_object.2614
	lalo	$t9, read_all_object.2614
	sw	$t9, 0($t8)
	sw	$t7, 4($t8)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, read_and_network.2620
	lalo	$t9, read_and_network.2620
	sw	$t9, 0($t7)
	lw	$t9, 28($sp)
	sw	$t9, 4($t7)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$k1, read_parameter.2622
	lalo	$k1, read_parameter.2622
	sw	$k1, 0($k0)
	sw	$a1, 20($k0)
	sw	$t2, 16($k0)
	sw	$t7, 12($k0)
	sw	$t8, 8($k0)
	lw	$a1, 36($sp)
	sw	$a1, 4($k0)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t7, solver_rect_surface.2624
	lalo	$t7, solver_rect_surface.2624
	sw	$t7, 0($t2)
	lw	$t7, 40($sp)
	sw	$t7, 4($t2)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_rect.2633
	lalo	$k1, solver_rect.2633
	sw	$k1, 0($t8)
	sw	$t2, 4($t8)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_surface.2639
	lalo	$k1, solver_surface.2639
	sw	$k1, 0($t2)
	sw	$t7, 4($t2)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v0, solver_second.2658
	lalo	$v0, solver_second.2658
	sw	$v0, 0($k1)
	sw	$t7, 4($k1)
	add	$v0, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$v1, solver.2664
	lalo	$v1, solver.2664
	sw	$v1, 0($v0)
	sw	$t2, 16($v0)
	sw	$k1, 12($v0)
	sw	$t8, 8($v0)
	sw	$t6, 4($v0)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, solver_rect_fast.2668
	lalo	$t8, solver_rect_fast.2668
	sw	$t8, 0($t2)
	sw	$t7, 4($t2)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_surface_fast.2675
	lalo	$k1, solver_surface_fast.2675
	sw	$k1, 0($t8)
	sw	$t7, 4($t8)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v1, solver_second_fast.2681
	lalo	$v1, solver_second_fast.2681
	sw	$v1, 0($k1)
	sw	$t7, 4($k1)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$at, solver_fast.2687
	lalo	$at, solver_fast.2687
	sw	$at, 0($v1)
	sw	$t8, 16($v1)
	sw	$k1, 12($v1)
	sw	$t2, 8($v1)
	sw	$t6, 4($v1)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_surface_fast2.2691
	lalo	$k1, solver_surface_fast2.2691
	sw	$k1, 0($t8)
	sw	$t7, 4($t8)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$at, solver_second_fast2.2698
	lalo	$at, solver_second_fast2.2698
	sw	$at, 0($k1)
	sw	$t7, 4($k1)
	add	$at, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$s2, solver_fast2.2705
	lalo	$s2, solver_fast2.2705
	sw	$s2, 0($at)
	sw	$t8, 16($at)
	sw	$k1, 12($at)
	sw	$t2, 8($at)
	sw	$t6, 4($at)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, iter_setup_dirvec_constants.2717
	lalo	$t8, iter_setup_dirvec_constants.2717
	sw	$t8, 0($t2)
	sw	$t6, 4($t2)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k1, setup_dirvec_constants.2720
	lalo	$k1, setup_dirvec_constants.2720
	sw	$k1, 0($t8)
	sw	$t5, 8($t8)
	sw	$t2, 4($t8)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, setup_startp_constants.2722
	lalo	$k1, setup_startp_constants.2722
	sw	$k1, 0($t2)
	sw	$t6, 4($t2)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$s2, setup_startp.2725
	lalo	$s2, setup_startp.2725
	sw	$s2, 0($k1)
	lw	$s2, 92($sp)
	sw	$s2, 12($k1)
	sw	$t2, 8($k1)
	sw	$t5, 4($k1)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$s3, check_all_inside.2747
	lalo	$s3, check_all_inside.2747
	sw	$s3, 0($t2)
	sw	$t6, 4($t2)
	add	$s3, $gp, $zero
	addi	$gp, $gp, 32
	lahi	$s4, shadow_check_and_group.2753
	lalo	$s4, shadow_check_and_group.2753
	sw	$s4, 0($s3)
	sw	$v1, 28($s3)
	sw	$t7, 24($s3)
	sw	$t6, 20($s3)
	lw	$s4, 128($sp)
	sw	$s4, 16($s3)
	sw	$t3, 12($s3)
	lw	$s5, 52($sp)
	sw	$s5, 8($s3)
	sw	$t2, 4($s3)
	add	$s6, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$s7, shadow_check_one_or_group.2756
	lalo	$s7, shadow_check_one_or_group.2756
	sw	$s7, 0($s6)
	sw	$s3, 8($s6)
	sw	$t9, 4($s6)
	add	$s3, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$s7, shadow_check_one_or_matrix.2759
	lalo	$s7, shadow_check_one_or_matrix.2759
	sw	$s7, 0($s3)
	sw	$v1, 20($s3)
	sw	$t7, 16($s3)
	sw	$s6, 12($s3)
	sw	$s4, 8($s3)
	sw	$s5, 4($s3)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$s6, solve_each_element.2762
	lalo	$s6, solve_each_element.2762
	sw	$s6, 0($v1)
	lw	$s6, 48($sp)
	sw	$s6, 36($v1)
	lw	$s7, 88($sp)
	sw	$s7, 32($v1)
	sw	$t7, 28($v1)
	sw	$v0, 24($v1)
	sw	$t6, 20($v1)
	lw	$s4, 44($sp)
	sw	$s4, 16($v1)
	sw	$s5, 12($v1)
	sw	$k0, 140($sp)
	lw	$k0, 56($sp)
	sw	$k0, 8($v1)
	sw	$t2, 4($v1)
	sw	$t8, 144($sp)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t5, solve_one_or_network.2766
	lalo	$t5, solve_one_or_network.2766
	sw	$t5, 0($t8)
	sw	$v1, 8($t8)
	sw	$t9, 4($t8)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$v1, trace_or_matrix.2770
	lalo	$v1, trace_or_matrix.2770
	sw	$v1, 0($t5)
	sw	$s6, 20($t5)
	sw	$s7, 16($t5)
	sw	$t7, 12($t5)
	sw	$v0, 8($t5)
	sw	$t8, 4($t5)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v0, judge_intersection.2774
	lalo	$v0, judge_intersection.2774
	sw	$v0, 0($t8)
	sw	$t5, 12($t8)
	sw	$s6, 8($t8)
	sw	$a1, 4($t8)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$v0, solve_each_element_fast.2776
	lalo	$v0, solve_each_element_fast.2776
	sw	$v0, 0($t5)
	sw	$s6, 36($t5)
	sw	$s2, 32($t5)
	sw	$at, 28($t5)
	sw	$t7, 24($t5)
	sw	$t6, 20($t5)
	sw	$s4, 16($t5)
	sw	$s5, 12($t5)
	sw	$k0, 8($t5)
	sw	$t2, 4($t5)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v0, solve_one_or_network_fast.2780
	lalo	$v0, solve_one_or_network_fast.2780
	sw	$v0, 0($t2)
	sw	$t5, 8($t2)
	sw	$t9, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$t9, trace_or_matrix_fast.2784
	lalo	$t9, trace_or_matrix_fast.2784
	sw	$t9, 0($t5)
	sw	$s6, 16($t5)
	sw	$at, 12($t5)
	sw	$t7, 8($t5)
	sw	$t2, 4($t5)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, judge_intersection_fast.2788
	lalo	$t7, judge_intersection_fast.2788
	sw	$t7, 0($t2)
	sw	$t5, 12($t2)
	sw	$s6, 8($t2)
	sw	$a1, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, get_nvector_rect.2790
	lalo	$t7, get_nvector_rect.2790
	sw	$t7, 0($t5)
	lw	$t7, 60($sp)
	sw	$t7, 8($t5)
	sw	$s4, 4($t5)
	add	$t9, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v0, get_nvector_plane.2792
	lalo	$v0, get_nvector_plane.2792
	sw	$v0, 0($t9)
	sw	$t7, 4($t9)
	add	$v0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v1, get_nvector_second.2794
	lalo	$v1, get_nvector_second.2794
	sw	$v1, 0($v0)
	sw	$t7, 8($v0)
	sw	$s5, 4($v0)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$at, get_nvector.2796
	lalo	$at, get_nvector.2796
	sw	$at, 0($v1)
	sw	$v0, 12($v1)
	sw	$t5, 8($v1)
	sw	$t9, 4($v1)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, utexture.2799
	lalo	$t9, utexture.2799
	sw	$t9, 0($t5)
	lw	$t9, 64($sp)
	sw	$t9, 4($t5)
	add	$v0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$at, add_light.2802
	lalo	$at, add_light.2802
	sw	$at, 0($v0)
	sw	$t9, 8($v0)
	lw	$at, 72($sp)
	sw	$at, 4($v0)
	add	$s2, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$t0, trace_reflections.2806
	lalo	$t0, trace_reflections.2806
	sw	$t0, 0($s2)
	sw	$s3, 32($s2)
	lw	$t0, 136($sp)
	sw	$t0, 28($s2)
	sw	$a1, 24($s2)
	sw	$t7, 20($s2)
	sw	$t2, 16($s2)
	sw	$s4, 12($s2)
	sw	$k0, 8($s2)
	sw	$v0, 4($s2)
	add	$t0, $gp, $zero
	addi	$gp, $gp, 88
	lahi	$a3, trace_ray.2811
	lalo	$a3, trace_ray.2811
	sw	$a3, 0($t0)
	sw	$t5, 80($t0)
	sw	$s2, 76($t0)
	sw	$s6, 72($t0)
	sw	$t9, 68($t0)
	sw	$s7, 64($t0)
	sw	$s3, 60($t0)
	sw	$k1, 56($t0)
	sw	$at, 52($t0)
	sw	$a1, 48($t0)
	sw	$t6, 44($t0)
	sw	$t7, 40($t0)
	sw	$a0, 36($t0)
	sw	$t3, 32($t0)
	sw	$t8, 28($t0)
	sw	$s4, 24($t0)
	sw	$s5, 20($t0)
	sw	$k0, 16($t0)
	sw	$v1, 12($t0)
	sw	$t4, 8($t0)
	sw	$v0, 4($t0)
	add	$a3, $gp, $zero
	addi	$gp, $gp, 56
	lahi	$t4, trace_diffuse_ray.2817
	lalo	$t4, trace_diffuse_ray.2817
	sw	$t4, 0($a3)
	sw	$t5, 48($a3)
	sw	$t9, 44($a3)
	sw	$s3, 40($a3)
	sw	$a1, 36($a3)
	sw	$t6, 32($a3)
	sw	$t7, 28($a3)
	sw	$t3, 24($a3)
	sw	$t2, 20($a3)
	sw	$s5, 16($a3)
	sw	$k0, 12($a3)
	sw	$v1, 8($a3)
	lw	$a1, 68($sp)
	sw	$a1, 4($a3)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t4, iter_trace_diffuse_rays.2820
	lalo	$t4, iter_trace_diffuse_rays.2820
	sw	$t4, 0($t2)
	sw	$a3, 4($t2)
	add	$a3, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t4, trace_diffuse_rays.2825
	lalo	$t4, trace_diffuse_rays.2825
	sw	$t4, 0($a3)
	sw	$k1, 8($a3)
	sw	$t2, 4($a3)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t4, trace_diffuse_ray_80percent.2829
	lalo	$t4, trace_diffuse_ray_80percent.2829
	sw	$t4, 0($t2)
	sw	$a3, 8($t2)
	lw	$t4, 116($sp)
	sw	$t4, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, calc_diffuse_using_1point.2833
	lalo	$t7, calc_diffuse_using_1point.2833
	sw	$t7, 0($t5)
	sw	$t2, 12($t5)
	sw	$at, 8($t5)
	sw	$a1, 4($t5)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, calc_diffuse_using_5points.2836
	lalo	$t7, calc_diffuse_using_5points.2836
	sw	$t7, 0($t2)
	sw	$at, 8($t2)
	sw	$a1, 4($t2)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, do_without_neighbors.2842
	lalo	$t8, do_without_neighbors.2842
	sw	$t8, 0($t7)
	sw	$t5, 4($t7)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, neighbors_exist.2845
	lalo	$t8, neighbors_exist.2845
	sw	$t8, 0($t5)
	lw	$t8, 76($sp)
	sw	$t8, 4($t5)
	add	$t9, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, try_exploit_neighbors.2858
	lalo	$k0, try_exploit_neighbors.2858
	sw	$k0, 0($t9)
	sw	$t7, 8($t9)
	sw	$t2, 4($t9)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k0, write_ppm_header.2873
	lalo	$k0, write_ppm_header.2873
	sw	$k0, 0($t2)
	sw	$t8, 4($t2)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, write_rgb.2877
	lalo	$k1, write_rgb.2877
	sw	$k1, 0($k0)
	sw	$at, 4($k0)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v0, pretrace_diffuse_rays.2879
	lalo	$v0, pretrace_diffuse_rays.2879
	sw	$v0, 0($k1)
	sw	$a3, 12($k1)
	sw	$t4, 8($k1)
	sw	$a1, 4($k1)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$a3, pretrace_pixels.2882
	lalo	$a3, pretrace_pixels.2882
	sw	$a3, 0($a1)
	sw	$a2, 36($a1)
	sw	$t0, 32($a1)
	sw	$s7, 28($a1)
	sw	$t1, 24($a1)
	lw	$a2, 84($sp)
	sw	$a2, 20($a1)
	sw	$at, 16($a1)
	lw	$a3, 108($sp)
	sw	$a3, 12($a1)
	sw	$k1, 8($a1)
	lw	$a3, 80($sp)
	sw	$a3, 4($a1)
	add	$t0, $gp, $zero
	addi	$gp, $gp, 32
	lahi	$t1, pretrace_line.2889
	lalo	$t1, pretrace_line.2889
	sw	$t1, 0($t0)
	lw	$t1, 104($sp)
	sw	$t1, 24($t0)
	lw	$t1, 100($sp)
	sw	$t1, 20($t0)
	sw	$a2, 16($t0)
	sw	$a1, 12($t0)
	sw	$t8, 8($t0)
	sw	$a3, 4($t0)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 32
	lahi	$t1, scan_pixel.2893
	lalo	$t1, scan_pixel.2893
	sw	$t1, 0($a1)
	sw	$k0, 24($a1)
	sw	$t9, 20($a1)
	sw	$at, 16($a1)
	sw	$t5, 12($a1)
	sw	$t8, 8($a1)
	sw	$t7, 4($a1)
	add	$t1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t5, scan_line.2899
	lalo	$t5, scan_line.2899
	sw	$t5, 0($t1)
	sw	$a1, 12($t1)
	sw	$t0, 8($t1)
	sw	$t8, 4($t1)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t5, create_pixelline.2912
	lalo	$t5, create_pixelline.2912
	sw	$t5, 0($a1)
	sw	$t8, 4($a1)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t7, calc_dirvec.2919
	lalo	$t7, calc_dirvec.2919
	sw	$t7, 0($t5)
	sw	$t4, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, calc_dirvecs.2927
	lalo	$t9, calc_dirvecs.2927
	sw	$t9, 0($t7)
	sw	$t5, 4($t7)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, calc_dirvec_rows.2932
	lalo	$t9, calc_dirvec_rows.2932
	sw	$t9, 0($t5)
	sw	$t7, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, create_dirvec.2936
	lalo	$t9, create_dirvec.2936
	sw	$t9, 0($t7)
	lw	$t9, 0($sp)
	sw	$t9, 4($t7)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, create_dirvec_elements.2938
	lalo	$k1, create_dirvec_elements.2938
	sw	$k1, 0($k0)
	sw	$t7, 4($k0)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v0, create_dirvecs.2941
	lalo	$v0, create_dirvecs.2941
	sw	$v0, 0($k1)
	sw	$t4, 12($k1)
	sw	$k0, 8($k1)
	sw	$t7, 4($k1)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v0, init_dirvec_constants.2943
	lalo	$v0, init_dirvec_constants.2943
	sw	$v0, 0($k0)
	lw	$v0, 144($sp)
	sw	$v0, 4($k0)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$at, init_vecset_constants.2946
	lalo	$at, init_vecset_constants.2946
	sw	$at, 0($v1)
	sw	$k0, 8($v1)
	sw	$t4, 4($v1)
	add	$t4, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, init_dirvecs.2948
	lalo	$k0, init_dirvecs.2948
	sw	$k0, 0($t4)
	sw	$v1, 12($t4)
	sw	$k1, 8($t4)
	sw	$t5, 4($t4)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, add_reflection.2950
	lalo	$k0, add_reflection.2950
	sw	$k0, 0($t5)
	sw	$v0, 12($t5)
	lw	$k0, 136($sp)
	sw	$k0, 8($t5)
	sw	$t7, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, setup_rect_reflection.2957
	lalo	$k0, setup_rect_reflection.2957
	sw	$k0, 0($t7)
	sw	$a0, 12($t7)
	sw	$t3, 8($t7)
	sw	$t5, 4($t7)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k1, setup_surface_reflection.2960
	lalo	$k1, setup_surface_reflection.2960
	sw	$k1, 0($k0)
	sw	$a0, 12($k0)
	sw	$t3, 8($k0)
	sw	$t5, 4($k0)
	add	$a0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t5, setup_reflections.2963
	lalo	$t5, setup_reflections.2963
	sw	$t5, 0($a0)
	sw	$k0, 12($a0)
	sw	$t7, 8($a0)
	sw	$t6, 4($a0)
	add	$s7, $gp, $zero
	addi	$gp, $gp, 64
	lahi	$t5, rt.2965
	lalo	$t5, rt.2965
	sw	$t5, 0($s7)
	sw	$t2, 56($s7)
	sw	$a0, 52($s7)
	sw	$v0, 48($s7)
	sw	$a2, 44($s7)
	sw	$t1, 40($s7)
	lw	$a0, 140($sp)
	sw	$a0, 36($s7)
	sw	$t0, 32($s7)
	sw	$t9, 28($s7)
	lw	$a0, 128($sp)
	sw	$a0, 24($s7)
	sw	$t3, 20($s7)
	sw	$t4, 16($s7)
	sw	$t8, 12($s7)
	sw	$a3, 8($s7)
	sw	$a1, 4($s7)
	addi	$a0, $zero, 128
	addi	$a1, $zero, 128
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9106
	lalo	$ra, tmp.9106
	jr	$s6
tmp.9106:
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	addi	$zero, $zero, 0
