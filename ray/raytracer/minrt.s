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
xor.2461:
	bne	$a0, $zero, bne_else.8612
	add	$a0, $a1, $zero
	jr	$ra
bne_else.8612:
	bne	$a1, $zero, bne_else.8613
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8613:
	addi	$a0, $zero, 0
	jr	$ra
sgn.2464:
	swc1	$f0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fiszero
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, bne_else.8614
	lwc1	$f0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fispos
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, bne_else.8615
	lui	$s1, -16512
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	jr	$ra
bne_else.8615:
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	jr	$ra
bne_else.8614:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	jr	$ra
fneg_cond.2466:
	bne	$a0, $zero, bne_else.8616
	j	min_caml_fneg
bne_else.8616:
	jr	$ra
add_mod5.2469:
	add	$a0, $a0, $a1
	slti	$s0, $a0, 5
	beq	$s0, $zero, bne_else.8617
	jr	$ra
bne_else.8617:
	addi	$a0, $a0, -5
	jr	$ra
vecset.2472:
	swc1	$f0, 0($a0)
	swc1	$f1, 8($a0)
	swc1	$f2, 16($a0)
	jr	$ra
vecfill.2477:
	swc1	$f0, 0($a0)
	swc1	$f0, 8($a0)
	swc1	$f0, 16($a0)
	jr	$ra
vecbzero.2480:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	vecfill.2477
veccpy.2482:
	lwc1	$f0, 0($a1)
	swc1	$f0, 0($a0)
	lwc1	$f0, 8($a1)
	swc1	$f0, 8($a0)
	lwc1	$f0, 16($a1)
	swc1	$f0, 16($a0)
	jr	$ra
vecunit_sgn.2490:
	lwc1	$f0, 0($a0)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fsqr
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	swc1	$f0, 8($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fsqr
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 8($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 16($a0)
	swc1	$f0, 16($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fsqr
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f1, 16($sp)
	add.s	$f0, $f1, $f0
	sqrt	$f0, $f0
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fiszero
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8621
	lw	$a0, 0($sp)
	bne	$a0, $zero, beq_else.8623
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 24($sp)
	div.s	$f0, $f0, $f1
	j	beq_cont.8624
beq_else.8623:
	lui	$s1, -16512
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 24($sp)
	div.s	$f0, $f0, $f1
beq_cont.8624:
	j	beq_cont.8622
beq_else.8621:
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8622:
	lw	$a0, 4($sp)
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 0($a0)
	lwc1	$f1, 8($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 8($a0)
	lwc1	$f1, 16($a0)
	mul.s	$f0, $f1, $f0
	swc1	$f0, 16($a0)
	jr	$ra
veciprod.2493:
	lwc1	$f0, 0($a0)
	lwc1	$f1, 0($a1)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 8($a0)
	lwc1	$f2, 8($a1)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwc1	$f1, 16($a0)
	lwc1	$f2, 16($a1)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	jr	$ra
veciprod2.2496:
	lwc1	$f3, 0($a0)
	mul.s	$f0, $f3, $f0
	lwc1	$f3, 8($a0)
	mul.s	$f1, $f3, $f1
	add.s	$f0, $f0, $f1
	lwc1	$f1, 16($a0)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	jr	$ra
vecaccum.2501:
	lwc1	$f1, 0($a0)
	lwc1	$f2, 0($a1)
	mul.s	$f2, $f0, $f2
	add.s	$f1, $f1, $f2
	swc1	$f1, 0($a0)
	lwc1	$f1, 8($a0)
	lwc1	$f2, 8($a1)
	mul.s	$f2, $f0, $f2
	add.s	$f1, $f1, $f2
	swc1	$f1, 8($a0)
	lwc1	$f1, 16($a0)
	lwc1	$f2, 16($a1)
	mul.s	$f0, $f0, $f2
	add.s	$f0, $f1, $f0
	swc1	$f0, 16($a0)
	jr	$ra
vecadd.2505:
	lwc1	$f0, 0($a0)
	lwc1	$f1, 0($a1)
	add.s	$f0, $f0, $f1
	swc1	$f0, 0($a0)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 8($a1)
	add.s	$f0, $f0, $f1
	swc1	$f0, 8($a0)
	lwc1	$f0, 16($a0)
	lwc1	$f1, 16($a1)
	add.s	$f0, $f0, $f1
	swc1	$f0, 16($a0)
	jr	$ra
vecscale.2511:
	lwc1	$f1, 0($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 0($a0)
	lwc1	$f1, 8($a0)
	mul.s	$f1, $f1, $f0
	swc1	$f1, 8($a0)
	lwc1	$f1, 16($a0)
	mul.s	$f0, $f1, $f0
	swc1	$f0, 16($a0)
	jr	$ra
vecaccumv.2514:
	lwc1	$f0, 0($a0)
	lwc1	$f1, 0($a1)
	lwc1	$f2, 0($a2)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	swc1	$f0, 0($a0)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 8($a1)
	lwc1	$f2, 8($a2)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	swc1	$f0, 8($a0)
	lwc1	$f0, 16($a0)
	lwc1	$f1, 16($a1)
	lwc1	$f2, 16($a2)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	swc1	$f0, 16($a0)
	jr	$ra
o_texturetype.2518:
	lw	$a0, 0($a0)
	jr	$ra
o_form.2520:
	lw	$a0, 4($a0)
	jr	$ra
o_reflectiontype.2522:
	lw	$a0, 8($a0)
	jr	$ra
o_isinvert.2524:
	lw	$a0, 24($a0)
	jr	$ra
o_isrot.2526:
	lw	$a0, 12($a0)
	jr	$ra
o_param_a.2528:
	lw	$a0, 16($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_param_b.2530:
	lw	$a0, 16($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_param_c.2532:
	lw	$a0, 16($a0)
	lwc1	$f0, 16($a0)
	jr	$ra
o_param_abc.2534:
	lw	$a0, 16($a0)
	jr	$ra
o_param_x.2536:
	lw	$a0, 20($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_param_y.2538:
	lw	$a0, 20($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_param_z.2540:
	lw	$a0, 20($a0)
	lwc1	$f0, 16($a0)
	jr	$ra
o_diffuse.2542:
	lw	$a0, 28($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_hilight.2544:
	lw	$a0, 28($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_color_red.2546:
	lw	$a0, 32($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_color_green.2548:
	lw	$a0, 32($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_color_blue.2550:
	lw	$a0, 32($a0)
	lwc1	$f0, 16($a0)
	jr	$ra
o_param_r1.2552:
	lw	$a0, 36($a0)
	lwc1	$f0, 0($a0)
	jr	$ra
o_param_r2.2554:
	lw	$a0, 36($a0)
	lwc1	$f0, 8($a0)
	jr	$ra
o_param_r3.2556:
	lw	$a0, 36($a0)
	lwc1	$f0, 16($a0)
	jr	$ra
o_param_ctbl.2558:
	lw	$a0, 40($a0)
	jr	$ra
p_rgb.2560:
	lw	$a0, 0($a0)
	jr	$ra
p_intersection_points.2562:
	lw	$a0, 4($a0)
	jr	$ra
p_surface_ids.2564:
	lw	$a0, 8($a0)
	jr	$ra
p_calc_diffuse.2566:
	lw	$a0, 12($a0)
	jr	$ra
p_energy.2568:
	lw	$a0, 16($a0)
	jr	$ra
p_received_ray_20percent.2570:
	lw	$a0, 20($a0)
	jr	$ra
p_group_id.2572:
	lw	$a0, 24($a0)
	lw	$a0, 0($a0)
	jr	$ra
p_set_group_id.2574:
	lw	$a0, 24($a0)
	sw	$a1, 0($a0)
	jr	$ra
p_nvectors.2577:
	lw	$a0, 28($a0)
	jr	$ra
d_vec.2579:
	lw	$a0, 0($a0)
	jr	$ra
d_const.2581:
	lw	$a0, 4($a0)
	jr	$ra
r_surface_id.2583:
	lw	$a0, 0($a0)
	jr	$ra
r_dvec.2585:
	lw	$a0, 4($a0)
	jr	$ra
r_bright.2587:
	lwc1	$f0, 8($a0)
	jr	$ra
rad.2589:
	lui	$s1, 15502
	ori	$s1, $s1, 64053
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	jr	$ra
read_screen_settings.2591:
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
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 0($a0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 8($a0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 16($a0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.2589
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
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2589
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
	swc1	$f2, 8($a0)
	lwc1	$f2, 56($sp)
	mul.s	$f4, $f1, $f2
	lui	$s1, 17224
	ori	$s1, $s1, 0
	mtc1	$s1, $f5
	mul.s	$f4, $f4, $f5
	swc1	$f4, 16($a0)
	lw	$a1, 8($sp)
	swc1	$f2, 0($a1)
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f4
	swc1	$f4, 8($a1)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fneg
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 16($a0)
	lwc1	$f0, 40($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fneg
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 32($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fneg
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	lwc1	$f0, 40($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fneg
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 4($sp)
	swc1	$f0, 16($a0)
	lw	$a0, 16($sp)
	lwc1	$f0, 0($a0)
	lw	$a1, 12($sp)
	lwc1	$f1, 0($a1)
	sub.s	$f0, $f0, $f1
	lw	$a2, 0($sp)
	swc1	$f0, 0($a2)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 8($a1)
	sub.s	$f0, $f0, $f1
	swc1	$f0, 8($a2)
	lwc1	$f0, 16($a0)
	lwc1	$f1, 16($a1)
	sub.s	$f0, $f0, $f1
	swc1	$f0, 16($a2)
	jr	$ra
read_light.2593:
	lw	$a0, 8($s7)
	lw	$a1, 4($s7)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_float
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	rad.2589
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	swc1	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_sin
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fneg
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_float
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	rad.2589
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
	swc1	$f0, 16($a0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	jr	$ra
rotate_quadratic_matrix.2595:
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
	lwc1	$f1, 8($a0)
	swc1	$f0, 16($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_cos
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	swc1	$f0, 24($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_sin
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 16($a0)
	swc1	$f0, 32($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_cos
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 16($a0)
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
	swc1	$f0, 48($sp)
	swc1	$f10, 56($sp)
	swc1	$f6, 64($sp)
	swc1	$f7, 72($sp)
	swc1	$f11, 80($sp)
	swc1	$f3, 88($sp)
	add.s	$f0, $fzero, $f4
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fneg
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 24($sp)
	lwc1	$f2, 16($sp)
	mul.s	$f2, $f2, $f1
	lwc1	$f3, 8($sp)
	mul.s	$f1, $f3, $f1
	lw	$a0, 0($sp)
	lwc1	$f3, 0($a0)
	lwc1	$f4, 8($a0)
	lwc1	$f5, 16($a0)
	lwc1	$f6, 88($sp)
	swc1	$f1, 96($sp)
	swc1	$f2, 104($sp)
	swc1	$f5, 112($sp)
	swc1	$f0, 120($sp)
	swc1	$f4, 128($sp)
	swc1	$f3, 136($sp)
	add.s	$f0, $fzero, $f6
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fsqr
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 80($sp)
	swc1	$f0, 144($sp)
	add.s	$f0, $fzero, $f2
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	jal	min_caml_fsqr
	addi	$sp, $sp, -160
	lw	$ra, 156($sp)
	lwc1	$f1, 128($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 144($sp)
	add.s	$f0, $f2, $f0
	lwc1	$f2, 120($sp)
	swc1	$f0, 152($sp)
	add.s	$f0, $fzero, $f2
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	min_caml_fsqr
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 152($sp)
	add.s	$f0, $f2, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 72($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	min_caml_fsqr
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 64($sp)
	swc1	$f0, 160($sp)
	add.s	$f0, $fzero, $f2
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	min_caml_fsqr
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lwc1	$f1, 128($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 160($sp)
	add.s	$f0, $f2, $f0
	lwc1	$f2, 104($sp)
	swc1	$f0, 168($sp)
	add.s	$f0, $fzero, $f2
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	min_caml_fsqr
	addi	$sp, $sp, -184
	lw	$ra, 180($sp)
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 168($sp)
	add.s	$f0, $f2, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 8($a0)
	lwc1	$f0, 56($sp)
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	min_caml_fsqr
	addi	$sp, $sp, -184
	lw	$ra, 180($sp)
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 48($sp)
	swc1	$f0, 176($sp)
	add.s	$f0, $fzero, $f2
	sw	$ra, 188($sp)
	addi	$sp, $sp, 192
	jal	min_caml_fsqr
	addi	$sp, $sp, -192
	lw	$ra, 188($sp)
	lwc1	$f1, 128($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 176($sp)
	add.s	$f0, $f2, $f0
	lwc1	$f2, 96($sp)
	swc1	$f0, 184($sp)
	add.s	$f0, $fzero, $f2
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	jal	min_caml_fsqr
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 184($sp)
	add.s	$f0, $f2, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 16($a0)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f2, 72($sp)
	lwc1	$f3, 136($sp)
	mul.s	$f4, $f3, $f2
	lwc1	$f5, 56($sp)
	mul.s	$f4, $f4, $f5
	lwc1	$f6, 64($sp)
	lwc1	$f7, 128($sp)
	mul.s	$f8, $f7, $f6
	lwc1	$f9, 48($sp)
	mul.s	$f8, $f8, $f9
	add.s	$f4, $f4, $f8
	lwc1	$f8, 104($sp)
	mul.s	$f10, $f1, $f8
	lwc1	$f11, 96($sp)
	mul.s	$f10, $f10, $f11
	add.s	$f4, $f4, $f10
	mul.s	$f0, $f0, $f4
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f4, 88($sp)
	mul.s	$f3, $f3, $f4
	mul.s	$f4, $f3, $f5
	lwc1	$f5, 80($sp)
	mul.s	$f5, $f7, $f5
	mul.s	$f7, $f5, $f9
	add.s	$f4, $f4, $f7
	lwc1	$f7, 120($sp)
	mul.s	$f1, $f1, $f7
	mul.s	$f7, $f1, $f11
	add.s	$f4, $f4, $f7
	mul.s	$f0, $f0, $f4
	swc1	$f0, 8($a0)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	mul.s	$f2, $f3, $f2
	mul.s	$f3, $f5, $f6
	add.s	$f2, $f2, $f3
	mul.s	$f1, $f1, $f8
	add.s	$f1, $f2, $f1
	mul.s	$f0, $f0, $f1
	swc1	$f0, 16($a0)
	jr	$ra
read_nth_object.2598:
	lw	$a1, 4($s7)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$s1, $zero, -1
	bne	$a0, $s1, bne_else.8635
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8635:
	sw	$a0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_read_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_read_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
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
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 24($sp)
	swc1	$f0, 0($a0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 24($sp)
	swc1	$f0, 8($a0)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_read_float
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 24($sp)
	swc1	$f0, 16($a0)
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
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 28($sp)
	swc1	$f0, 0($a0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 28($sp)
	swc1	$f0, 8($a0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 28($sp)
	swc1	$f0, 16($a0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_read_float
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fisneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
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
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 36($sp)
	swc1	$f0, 0($a0)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 36($sp)
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
	sw	$a0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 40($sp)
	swc1	$f0, 0($a0)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 40($sp)
	swc1	$f0, 8($a0)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_read_float
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 40($sp)
	swc1	$f0, 16($a0)
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
	bne	$a1, $zero, beq_else.8636
	j	beq_cont.8637
beq_else.8636:
	sw	$a0, 44($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2589
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 0($a0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2589
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 8($a0)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_read_float
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	rad.2589
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 16($a0)
beq_cont.8637:
	lw	$a1, 12($sp)
	addi	$s1, $zero, 2
	bne	$a1, $s1, beq_else.8638
	addi	$a2, $zero, 1
	j	beq_cont.8639
beq_else.8638:
	lw	$a2, 32($sp)
beq_cont.8639:
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
	add	$s1, $t2, $a1
	sw	$a1, 0($s1)
	addi	$s1, $zero, 3
	bne	$t0, $s1, beq_else.8640
	lwc1	$f0, 0($a2)
	swc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fiszero
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8643
	lwc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	sgn.2464
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	swc1	$f0, 64($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fsqr
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8644
beq_else.8643:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8644:
	lw	$a0, 24($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 8($a0)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fiszero
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, beq_else.8645
	lwc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	sgn.2464
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	swc1	$f0, 80($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lwc1	$f1, 80($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8646
beq_else.8645:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8646:
	lw	$a0, 24($sp)
	swc1	$f0, 8($a0)
	lwc1	$f0, 16($a0)
	swc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fiszero
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	bne	$a0, $zero, beq_else.8647
	lwc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	sgn.2464
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 88($sp)
	swc1	$f0, 96($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fsqr
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 96($sp)
	div.s	$f0, $f1, $f0
	j	beq_cont.8648
beq_else.8647:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8648:
	lw	$a0, 24($sp)
	swc1	$f0, 16($a0)
	j	beq_cont.8641
beq_else.8640:
	addi	$s1, $zero, 2
	bne	$t0, $s1, beq_else.8649
	lw	$a1, 32($sp)
	bne	$a1, $zero, beq_else.8651
	addi	$a1, $zero, 1
	j	beq_cont.8652
beq_else.8651:
	addi	$a1, $zero, 0
beq_cont.8652:
	add	$a0, $zero, $a2
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	vecunit_sgn.2490
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	j	beq_cont.8650
beq_else.8649:
beq_cont.8650:
beq_cont.8641:
	lw	$a0, 20($sp)
	bne	$a0, $zero, beq_else.8653
	j	beq_cont.8654
beq_else.8653:
	lw	$a0, 24($sp)
	lw	$a1, 44($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	rotate_quadratic_matrix.2595
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
beq_cont.8654:
	addi	$a0, $zero, 1
	jr	$ra
read_object.2600:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	slti	$s0, $a0, 60
	beq	$s0, $zero, bne_else.8655
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a0, 8($sp)
	add	$s7, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8656
	lalo	$ra, tmp.8656
	jr	$s6
tmp.8656:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, bne_else.8657
	lw	$a0, 4($sp)
	lw	$a1, 8($sp)
	sw	$a1, 0($a0)
	jr	$ra
bne_else.8657:
	lw	$a0, 8($sp)
	addi	$a0, $a0, 1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8655:
	jr	$ra
read_all_object.2602:
	lw	$s7, 4($s7)
	addi	$a0, $zero, 0
	lw	$s6, 0($s7)
	jr	$s6
read_net_item.2604:
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_read_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$s1, $zero, -1
	bne	$a0, $s1, bne_else.8660
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	addi	$a1, $zero, -1
	j	min_caml_create_array
bne_else.8660:
	lw	$a1, 0($sp)
	addi	$a2, $a1, 1
	sw	$a0, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.2604
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 0($sp)
	sll	$a1, $a1, 2
	lw	$a2, 4($sp)
	add	$s1, $a0, $a2
	sw	$a2, 0($s1)
	jr	$ra
read_or_network.2606:
	addi	$a1, $zero, 0
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	read_net_item.2604
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	add	$a1, $a0, $zero
	lw	$a0, 0($a1)
	addi	$s1, $zero, -1
	bne	$a0, $s1, bne_else.8661
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	j	min_caml_create_array
bne_else.8661:
	lw	$a0, 0($sp)
	addi	$a2, $a0, 1
	sw	$a1, 4($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_or_network.2606
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 0($sp)
	sll	$a1, $a1, 2
	lw	$a2, 4($sp)
	add	$s1, $a0, $a2
	sw	$a2, 0($s1)
	jr	$ra
read_and_network.2608:
	lw	$a1, 4($s7)
	addi	$a2, $zero, 0
	sw	$s7, 0($sp)
	sw	$a1, 4($sp)
	sw	$a0, 8($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	read_net_item.2604
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 0($a0)
	addi	$s1, $zero, -1
	bne	$a1, $s1, bne_else.8662
	jr	$ra
bne_else.8662:
	lw	$a1, 8($sp)
	sll	$a2, $a1, 2
	lw	$a3, 4($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	addi	$a0, $a1, 1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
read_parameter.2610:
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
	lahi	$ra, tmp.8664
	lalo	$ra, tmp.8664
	jr	$s6
tmp.8664:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$s7, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8665
	lalo	$ra, tmp.8665
	jr	$s6
tmp.8665:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$s7, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8666
	lalo	$ra, tmp.8666
	jr	$s6
tmp.8666:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a0, $zero, 0
	lw	$s7, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8667
	lalo	$ra, tmp.8667
	jr	$s6
tmp.8667:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a0, $zero, 0
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	read_or_network.2606
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 0($sp)
	sw	$a0, 0($a1)
	jr	$ra
solver_rect_surface.2612:
	lw	$t1, 4($s7)
	sll	$t2, $a2, 3
	add	$s1, $a1, $f3
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
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fiszero
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8672
	lw	$a0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_abc.2534
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a1, 56($sp)
	sw	$a0, 60($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_isinvert.2524
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 52($sp)
	sll	$a2, $a1, 3
	lw	$a3, 48($sp)
	add	$s1, $a3, $f0
	lwc1	$f0, 0($s1)
	sw	$a0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fisneg
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	add	$a1, $a0, $zero
	lw	$a0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	xor.2461
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 52($sp)
	sll	$a2, $a1, 3
	lw	$a3, 60($sp)
	add	$s1, $a3, $f0
	lwc1	$f0, 0($s1)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	fneg_cond.2466
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 40($sp)
	sub.s	$f0, $f0, $f1
	lw	$a0, 52($sp)
	sll	$a0, $a0, 3
	lw	$a1, 48($sp)
	add	$s1, $a1, $f1
	lwc1	$f1, 0($s1)
	div.s	$f0, $f0, $f1
	lw	$a0, 32($sp)
	sll	$a2, $a0, 3
	add	$s1, $a1, $f1
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
	sll	$a0, $a0, 3
	lw	$a1, 60($sp)
	add	$s1, $a1, $f1
	lwc1	$f1, 0($s1)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fless
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, bne_else.8674
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8674:
	lw	$a0, 16($sp)
	sll	$a1, $a0, 3
	lw	$a2, 48($sp)
	add	$s1, $a2, $f0
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
	sll	$a0, $a0, 3
	lw	$a1, 60($sp)
	add	$s1, $a1, $f1
	lwc1	$f1, 0($s1)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fless
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, bne_else.8675
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8675:
	lw	$a0, 0($sp)
	lwc1	$f0, 72($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8672:
	addi	$a0, $zero, 0
	jr	$ra
solver_rect.2621:
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
	lahi	$ra, tmp.8676
	lalo	$ra, tmp.8676
	jr	$s6
tmp.8676:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8677
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
	lahi	$ra, tmp.8678
	lalo	$ra, tmp.8678
	jr	$s6
tmp.8678:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8679
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
	lahi	$ra, tmp.8680
	lalo	$ra, tmp.8680
	jr	$s6
tmp.8680:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8681
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8681:
	addi	$a0, $zero, 3
	jr	$ra
bne_else.8679:
	addi	$a0, $zero, 2
	jr	$ra
bne_else.8677:
	addi	$a0, $zero, 1
	jr	$ra
solver_surface.2627:
	lw	$a2, 4($s7)
	sw	$a2, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	sw	$a1, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.2534
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add	$a1, $a0, $zero
	lw	$a0, 32($sp)
	sw	$a1, 36($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veciprod.2493
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	swc1	$f0, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fispos
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8683
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8683:
	lwc1	$f0, 24($sp)
	lwc1	$f1, 16($sp)
	lwc1	$f2, 8($sp)
	lw	$a0, 36($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	veciprod2.2496
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	div.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
quadratic.2633:
	swc1	$f0, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	sw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fsqr
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 24($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_a.2528
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 16($sp)
	swc1	$f0, 40($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fsqr
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 24($sp)
	swc1	$f0, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_b.2530
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	lwc1	$f1, 8($sp)
	swc1	$f0, 56($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fsqr
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 24($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_c.2532
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
	jal	o_isrot.2526
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, bne_else.8685
	lwc1	$f0, 72($sp)
	jr	$ra
bne_else.8685:
	lwc1	$f0, 8($sp)
	lwc1	$f1, 16($sp)
	mul.s	$f2, $f1, $f0
	lw	$a0, 24($sp)
	swc1	$f2, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_param_r1.2552
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
	jal	o_param_r2.2554
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
	jal	o_param_r3.2556
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 104($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
bilinear.2638:
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
	jal	o_param_a.2528
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
	jal	o_param_b.2530
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
	jal	o_param_c.2532
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
	jal	o_isrot.2526
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	bne	$a0, $zero, bne_else.8687
	lwc1	$f0, 96($sp)
	jr	$ra
bne_else.8687:
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
	jal	o_param_r1.2552
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
	jal	o_param_r2.2554
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
	jal	o_param_r3.2556
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 128($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fhalf
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 96($sp)
	add.s	$f0, $f1, $f0
	jr	$ra
solver_second.2646:
	lw	$a2, 4($s7)
	lwc1	$f3, 0($a1)
	lwc1	$f4, 8($a1)
	lwc1	$f5, 16($a1)
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
	jal	quadratic.2633
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	swc1	$f0, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fiszero
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8689
	lw	$a0, 36($sp)
	lwc1	$f0, 0($a0)
	lwc1	$f1, 8($a0)
	lwc1	$f2, 16($a0)
	lwc1	$f3, 24($sp)
	lwc1	$f4, 16($sp)
	lwc1	$f5, 8($sp)
	lw	$a0, 32($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	bilinear.2638
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
	jal	quadratic.2633
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a0, 32($sp)
	swc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_form.2520
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8690
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8691
beq_else.8690:
	lwc1	$f0, 56($sp)
beq_cont.8691:
	lwc1	$f1, 48($sp)
	swc1	$f0, 64($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fsqr
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	lwc1	$f2, 40($sp)
	mul.s	$f1, $f2, $f1
	sub.s	$f0, $f0, $f1
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fispos
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, bne_else.8692
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8692:
	lwc1	$f0, 72($sp)
	sqrt	$f0, $f0
	lw	$a0, 32($sp)
	swc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_isinvert.2524
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, beq_else.8693
	lwc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fneg
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	j	beq_cont.8694
beq_else.8693:
	lwc1	$f0, 80($sp)
beq_cont.8694:
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f0, $f1
	lwc1	$f1, 40($sp)
	div.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8689:
	addi	$a0, $zero, 0
	jr	$ra
solver.2652:
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
	jal	o_param_x.2536
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 20($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 16($sp)
	swc1	$f0, 32($sp)
	swc1	$f1, 40($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_y.2538
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 20($sp)
	lwc1	$f1, 16($a0)
	lw	$a0, 16($sp)
	swc1	$f0, 48($sp)
	swc1	$f1, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_z.2540
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_form.2520
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8695
	lwc1	$f0, 32($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 16($sp)
	lw	$a1, 8($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8695:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8696
	lwc1	$f0, 32($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 16($sp)
	lw	$a1, 8($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8696:
	lwc1	$f0, 32($sp)
	lwc1	$f1, 48($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 16($sp)
	lw	$a1, 8($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
solver_rect_fast.2656:
	lw	$a3, 4($s7)
	lwc1	$f3, 0($a2)
	sub.s	$f3, $f3, $f0
	lwc1	$f4, 8($a2)
	mul.s	$f3, $f3, $f4
	lwc1	$f4, 8($a1)
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
	jal	o_param_b.2530
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8699
	addi	$a0, $zero, 0
	j	beq_cont.8700
beq_else.8699:
	lw	$a0, 48($sp)
	lwc1	$f0, 16($a0)
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
	jal	o_param_c.2532
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fless
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	bne	$a0, $zero, beq_else.8701
	addi	$a0, $zero, 0
	j	beq_cont.8702
beq_else.8701:
	lw	$a0, 24($sp)
	lwc1	$f0, 8($a0)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fiszero
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	bne	$a0, $zero, beq_else.8703
	addi	$a0, $zero, 1
	j	beq_cont.8704
beq_else.8703:
	addi	$a0, $zero, 0
beq_cont.8704:
beq_cont.8702:
beq_cont.8700:
	bne	$a0, $zero, bne_else.8705
	lw	$a0, 24($sp)
	lwc1	$f0, 16($a0)
	lwc1	$f1, 16($sp)
	sub.s	$f0, $f0, $f1
	lwc1	$f2, 24($a0)
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
	jal	o_param_a.2528
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fless
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, beq_else.8706
	addi	$a0, $zero, 0
	j	beq_cont.8707
beq_else.8706:
	lw	$a0, 48($sp)
	lwc1	$f0, 16($a0)
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
	jal	o_param_c.2532
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fless
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	bne	$a0, $zero, beq_else.8708
	addi	$a0, $zero, 0
	j	beq_cont.8709
beq_else.8708:
	lw	$a0, 24($sp)
	lwc1	$f0, 24($a0)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fiszero
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
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
	lwc1	$f0, 32($a0)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f0, $f1
	lwc1	$f1, 40($a0)
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
	jal	o_param_a.2528
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 104($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_fless
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	bne	$a0, $zero, beq_else.8713
	addi	$a0, $zero, 0
	j	beq_cont.8714
beq_else.8713:
	lw	$a0, 48($sp)
	lwc1	$f0, 8($a0)
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
	jal	o_param_b.2530
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 112($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_fless
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	bne	$a0, $zero, beq_else.8715
	addi	$a0, $zero, 0
	j	beq_cont.8716
beq_else.8715:
	lw	$a0, 24($sp)
	lwc1	$f0, 40($a0)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_fiszero
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	bne	$a0, $zero, beq_else.8717
	addi	$a0, $zero, 1
	j	beq_cont.8718
beq_else.8717:
	addi	$a0, $zero, 0
beq_cont.8718:
beq_cont.8716:
beq_cont.8714:
	bne	$a0, $zero, bne_else.8719
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8719:
	lw	$a0, 0($sp)
	lwc1	$f0, 96($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 3
	jr	$ra
bne_else.8712:
	lw	$a0, 0($sp)
	lwc1	$f0, 72($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 2
	jr	$ra
bne_else.8705:
	lw	$a0, 0($sp)
	lwc1	$f0, 40($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
solver_surface_fast.2663:
	lw	$a0, 4($s7)
	lwc1	$f3, 0($a1)
	sw	$a0, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	sw	$a1, 32($sp)
	add.s	$f0, $fzero, $f3
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fisneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8721
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8721:
	lw	$a0, 32($sp)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 16($a0)
	lwc1	$f2, 16($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwc1	$f1, 24($a0)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
solver_second_fast.2669:
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
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fiszero
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8724
	lw	$a0, 48($sp)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f2, 16($a0)
	lwc1	$f3, 32($sp)
	mul.s	$f2, $f2, $f3
	add.s	$f0, $f0, $f2
	lwc1	$f2, 24($a0)
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
	jal	quadratic.2633
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_form.2520
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8726
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 64($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8727
beq_else.8726:
	lwc1	$f0, 64($sp)
beq_cont.8727:
	lwc1	$f1, 56($sp)
	swc1	$f0, 72($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fsqr
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f2, $f1
	sub.s	$f0, $f0, $f1
	swc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fispos
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, bne_else.8728
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8728:
	lw	$a0, 16($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_isinvert.2524
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, beq_else.8729
	lwc1	$f0, 80($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 32($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	j	beq_cont.8730
beq_else.8729:
	lwc1	$f0, 80($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 32($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
beq_cont.8730:
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8724:
	addi	$a0, $zero, 0
	jr	$ra
solver_fast.2675:
	lw	$a3, 16($s7)
	lw	$t0, 12($s7)
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$t3, $a0, 2
	add	$s1, $t2, $t2
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
	jal	o_param_x.2536
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 24($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 20($sp)
	swc1	$f0, 40($sp)
	swc1	$f1, 48($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_y.2538
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 24($sp)
	lwc1	$f1, 16($a0)
	lw	$a0, 20($sp)
	swc1	$f0, 56($sp)
	swc1	$f1, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_z.2540
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	d_const.2581
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lw	$a1, 12($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	lw	$a1, 20($sp)
	sw	$a0, 80($sp)
	add	$a0, $zero, $a1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_form.2520
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8732
	lw	$a0, 16($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	d_vec.2579
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
bne_else.8732:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8733
	lwc1	$f0, 40($sp)
	lwc1	$f1, 56($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 20($sp)
	lw	$a1, 80($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8733:
	lwc1	$f0, 40($sp)
	lwc1	$f1, 56($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 20($sp)
	lw	$a1, 80($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
solver_surface_fast2.2679:
	lw	$a0, 4($s7)
	lwc1	$f0, 0($a1)
	sw	$a0, 0($sp)
	sw	$a2, 4($sp)
	sw	$a1, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fisneg
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, bne_else.8734
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8734:
	lw	$a0, 8($sp)
	lwc1	$f0, 0($a0)
	lw	$a0, 4($sp)
	lwc1	$f1, 24($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	addi	$a0, $zero, 1
	jr	$ra
solver_second_fast2.2686:
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
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fiszero
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8736
	lw	$a0, 48($sp)
	lwc1	$f0, 8($a0)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 16($a0)
	lwc1	$f2, 32($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lwc1	$f1, 24($a0)
	lwc1	$f2, 24($sp)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	lw	$a1, 16($sp)
	lwc1	$f1, 24($a1)
	swc1	$f0, 56($sp)
	swc1	$f1, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fsqr
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	lwc1	$f2, 8($sp)
	mul.s	$f1, $f2, $f1
	sub.s	$f0, $f0, $f1
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fispos
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, bne_else.8738
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8738:
	lw	$a0, 4($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_isinvert.2524
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	bne	$a0, $zero, beq_else.8739
	lwc1	$f0, 72($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 32($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	j	beq_cont.8740
beq_else.8739:
	lwc1	$f0, 72($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 56($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 48($sp)
	lwc1	$f1, 32($a0)
	mul.s	$f0, $f0, $f1
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
beq_cont.8740:
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8736:
	addi	$a0, $zero, 0
	jr	$ra
solver_fast2.2693:
	lw	$a2, 16($s7)
	lw	$a3, 12($s7)
	lw	$t0, 8($s7)
	lw	$t1, 4($s7)
	sll	$t2, $a0, 2
	add	$s1, $t1, $t1
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
	jal	o_param_ctbl.2558
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f0, 0($a0)
	lwc1	$f1, 8($a0)
	lwc1	$f2, 16($a0)
	lw	$a1, 20($sp)
	sw	$a0, 24($sp)
	swc1	$f2, 32($sp)
	swc1	$f1, 40($sp)
	swc1	$f0, 48($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_const.2581
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a1, 16($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	lw	$a1, 12($sp)
	sw	$a0, 56($sp)
	add	$a0, $zero, $a1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_form.2520
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8742
	lw	$a0, 20($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.2579
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
bne_else.8742:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8743
	lwc1	$f0, 48($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 32($sp)
	lw	$a0, 12($sp)
	lw	$a1, 56($sp)
	lw	$a2, 24($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8743:
	lwc1	$f0, 48($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 32($sp)
	lw	$a0, 12($sp)
	lw	$a1, 56($sp)
	lw	$a2, 24($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
setup_rect_table.2696:
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
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fiszero
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, beq_else.8744
	lw	$a0, 0($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_isinvert.2524
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 0($a1)
	sw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fisneg
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	add	$a1, $a0, $zero
	lw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	xor.2461
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 0($sp)
	sw	$a0, 16($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_a.2528
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	fneg_cond.2466
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
	swc1	$f0, 8($a0)
	j	beq_cont.8745
beq_else.8744:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 8($a0)
beq_cont.8745:
	lw	$a1, 4($sp)
	lwc1	$f0, 8($a1)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fiszero
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	bne	$a0, $zero, beq_else.8746
	lw	$a0, 0($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_isinvert.2524
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 8($a1)
	sw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fisneg
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	add	$a1, $a0, $zero
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	xor.2461
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 0($sp)
	sw	$a0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_b.2530
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	fneg_cond.2466
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 16($a0)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 4($sp)
	lwc1	$f1, 8($a1)
	div.s	$f0, $f0, $f1
	swc1	$f0, 24($a0)
	j	beq_cont.8747
beq_else.8746:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 24($a0)
beq_cont.8747:
	lw	$a1, 4($sp)
	lwc1	$f0, 16($a1)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fiszero
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, beq_else.8748
	lw	$a0, 0($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.2524
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	lwc1	$f0, 16($a1)
	sw	$a0, 28($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fisneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add	$a1, $a0, $zero
	lw	$a0, 28($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	xor.2461
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 0($sp)
	sw	$a0, 32($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_c.2532
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 32($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	fneg_cond.2466
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 32($a0)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 4($sp)
	lwc1	$f1, 16($a1)
	div.s	$f0, $f0, $f1
	swc1	$f0, 40($a0)
	j	beq_cont.8749
beq_else.8748:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 40($a0)
beq_cont.8749:
	jr	$ra
setup_surface_table.2699:
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
	jal	o_param_a.2528
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f1, 16($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 24($sp)
	swc1	$f1, 32($sp)
	add	$a0, $zero, $a1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_b.2530
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 24($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 16($a0)
	lw	$a0, 0($sp)
	swc1	$f0, 40($sp)
	swc1	$f1, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_c.2532
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	add.s	$f0, $f1, $f0
	swc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fispos
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8751
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 0($a0)
	j	beq_cont.8752
beq_else.8751:
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
	jal	o_param_a.2528
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fneg
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_b.2530
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fneg
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 16($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_c.2532
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	div.s	$f0, $f0, $f1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fneg
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 8($sp)
	swc1	$f0, 24($a0)
beq_cont.8752:
	jr	$ra
setup_second_table.2702:
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
	lwc1	$f1, 8($a1)
	lwc1	$f2, 16($a1)
	lw	$a2, 0($sp)
	sw	$a0, 8($sp)
	add	$a0, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	quadratic.2633
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
	jal	o_param_a.2528
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 32($sp)
	swc1	$f1, 40($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_b.2530
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 4($sp)
	lwc1	$f1, 16($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 48($sp)
	swc1	$f1, 56($sp)
	add	$a0, $zero, $a1
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_c.2532
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fneg
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 8($sp)
	lwc1	$f1, 16($sp)
	swc1	$f1, 0($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 64($sp)
	add	$a0, $zero, $a1
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_isrot.2526
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	bne	$a0, $zero, beq_else.8754
	lw	$a0, 8($sp)
	lwc1	$f0, 32($sp)
	swc1	$f0, 8($a0)
	lwc1	$f0, 48($sp)
	swc1	$f0, 16($a0)
	lwc1	$f0, 64($sp)
	swc1	$f0, 24($a0)
	j	beq_cont.8755
beq_else.8754:
	lw	$a0, 4($sp)
	lwc1	$f0, 16($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 72($sp)
	add	$a0, $zero, $a1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_r2.2554
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 0($sp)
	swc1	$f0, 80($sp)
	swc1	$f1, 88($sp)
	add	$a0, $zero, $a1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_r3.2556
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 88($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 80($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fhalf
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 4($sp)
	lwc1	$f0, 16($a1)
	lw	$a2, 0($sp)
	swc1	$f0, 96($sp)
	add	$a0, $zero, $a2
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_r1.2552
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
	jal	o_param_r3.2556
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 104($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_fhalf
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 16($a0)
	lw	$a1, 4($sp)
	lwc1	$f0, 8($a1)
	lw	$a2, 0($sp)
	swc1	$f0, 120($sp)
	add	$a0, $zero, $a2
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	o_param_r1.2552
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
	jal	o_param_r2.2554
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 128($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fhalf
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 64($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 24($a0)
beq_cont.8755:
	lwc1	$f0, 16($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fiszero
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	bne	$a0, $zero, beq_else.8756
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 16($sp)
	div.s	$f0, $f0, $f1
	lw	$a0, 8($sp)
	swc1	$f0, 32($a0)
	j	beq_cont.8757
beq_else.8756:
beq_cont.8757:
	lw	$a0, 8($sp)
	jr	$ra
iter_setup_dirvec_constants.2705:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.8758
	jr	$ra
bne_else.8758:
	sll	$a3, $a1, 2
	add	$s1, $a2, $a2
	lw	$a2, 0($s1)
	sw	$s7, 0($sp)
	sw	$a1, 4($sp)
	sw	$a2, 8($sp)
	sw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_const.2581
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sw	$a0, 16($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	d_vec.2579
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 8($sp)
	sw	$a0, 20($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_form.2520
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, beq_else.8760
	lw	$a0, 20($sp)
	lw	$a1, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	setup_rect_table.2696
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	j	beq_cont.8761
beq_else.8760:
	addi	$s1, $zero, 2
	bne	$a0, $s1, beq_else.8762
	lw	$a0, 20($sp)
	lw	$a1, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	setup_surface_table.2699
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	j	beq_cont.8763
beq_else.8762:
	lw	$a0, 20($sp)
	lw	$a1, 8($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	setup_second_table.2702
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 16($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
beq_cont.8763:
beq_cont.8761:
	addi	$a1, $a1, -1
	lw	$a0, 12($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
setup_dirvec_constants.2708:
	lw	$a1, 8($s7)
	lw	$s7, 4($s7)
	lw	$a1, 0($a1)
	addi	$a1, $a1, -1
	lw	$s6, 0($s7)
	jr	$s6
setup_startp_constants.2710:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.8764
	jr	$ra
bne_else.8764:
	sll	$a3, $a1, 2
	add	$s1, $a2, $a2
	lw	$a2, 0($s1)
	sw	$s7, 0($sp)
	sw	$a1, 4($sp)
	sw	$a0, 8($sp)
	sw	$a2, 12($sp)
	add	$a0, $zero, $a2
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_param_ctbl.2558
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sw	$a0, 16($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2520
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
	jal	o_param_x.2536
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 8($sp)
	lwc1	$f0, 8($a1)
	lw	$a2, 12($sp)
	swc1	$f0, 32($sp)
	add	$a0, $zero, $a2
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_y.2538
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 8($sp)
	lwc1	$f0, 16($a1)
	lw	$a2, 12($sp)
	swc1	$f0, 40($sp)
	add	$a0, $zero, $a2
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_z.2540
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 40($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 16($a0)
	lw	$a1, 20($sp)
	addi	$s1, $zero, 2
	bne	$a1, $s1, beq_else.8766
	lw	$a1, 12($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_abc.2534
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a1, 16($sp)
	lwc1	$f0, 0($a1)
	lwc1	$f1, 8($a1)
	lwc1	$f2, 16($a1)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	veciprod2.2496
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 16($sp)
	swc1	$f0, 24($a0)
	j	beq_cont.8767
beq_else.8766:
	slti	$s0, $a1, 3
	beq	$s0, $zero, bne_else.8768
	j	bne_cont.8769
bne_else.8768:
	lwc1	$f0, 0($a0)
	lwc1	$f1, 8($a0)
	lwc1	$f2, 16($a0)
	lw	$a2, 12($sp)
	add	$a0, $zero, $a2
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	quadratic.2633
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 20($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8770
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	sub.s	$f0, $f0, $f1
	j	beq_cont.8771
beq_else.8770:
beq_cont.8771:
	lw	$a0, 16($sp)
	swc1	$f0, 24($a0)
bne_cont.8769:
beq_cont.8767:
	lw	$a0, 4($sp)
	addi	$a1, $a0, -1
	lw	$a0, 8($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
setup_startp.2713:
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
	jal	veccpy.2482
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 8($sp)
	lw	$a0, 0($a0)
	addi	$a1, $a0, -1
	lw	$a0, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
is_rect_outside.2715:
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
	jal	o_param_a.2528
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fless
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8773
	addi	$a0, $zero, 0
	j	beq_cont.8774
beq_else.8773:
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
	jal	o_param_b.2530
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fless
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	bne	$a0, $zero, beq_else.8775
	addi	$a0, $zero, 0
	j	beq_cont.8776
beq_else.8775:
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
	jal	o_param_c.2532
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fless
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
beq_cont.8776:
beq_cont.8774:
	bne	$a0, $zero, bne_else.8777
	lw	$a0, 16($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.2524
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8778
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8778:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8777:
	lw	$a0, 16($sp)
	j	o_isinvert.2524
is_plane_outside.2720:
	sw	$a0, 0($sp)
	swc1	$f2, 8($sp)
	swc1	$f1, 16($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_abc.2534
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f0, 24($sp)
	lwc1	$f1, 16($sp)
	lwc1	$f2, 8($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veciprod2.2496
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 0($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_isinvert.2524
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f0, 32($sp)
	sw	$a0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fisneg
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	add	$a1, $a0, $zero
	lw	$a0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	xor.2461
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	bne	$a0, $zero, bne_else.8780
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8780:
	addi	$a0, $zero, 0
	jr	$ra
is_second_outside.2725:
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	quadratic.2633
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	swc1	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2520
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8782
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lwc1	$f1, 8($sp)
	sub.s	$f0, $f1, $f0
	j	beq_cont.8783
beq_else.8782:
	lwc1	$f0, 8($sp)
beq_cont.8783:
	lw	$a0, 0($sp)
	swc1	$f0, 16($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_isinvert.2524
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f0, 16($sp)
	sw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fisneg
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	add	$a1, $a0, $zero
	lw	$a0, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	xor.2461
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, bne_else.8784
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8784:
	addi	$a0, $zero, 0
	jr	$ra
is_outside.2730:
	swc1	$f2, 0($sp)
	swc1	$f1, 8($sp)
	sw	$a0, 16($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	o_param_x.2536
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_y.2538
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 8($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 40($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_z.2540
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lwc1	$f1, 0($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	swc1	$f0, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_form.2520
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8786
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	lw	$a0, 16($sp)
	j	is_rect_outside.2715
bne_else.8786:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8787
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	lw	$a0, 16($sp)
	j	is_plane_outside.2720
bne_else.8787:
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	lw	$a0, 16($sp)
	j	is_second_outside.2725
check_all_inside.2735:
	lw	$a2, 4($s7)
	sll	$a3, $a0, 2
	add	$s1, $a1, $a3
	lw	$a3, 0($s1)
	addi	$s1, $zero, -1
	bne	$a3, $s1, bne_else.8788
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8788:
	sll	$a3, $a3, 2
	add	$s1, $a2, $a2
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
	jal	is_outside.2730
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8789
	lw	$a0, 32($sp)
	addi	$a0, $a0, 1
	lwc1	$f0, 16($sp)
	lwc1	$f1, 8($sp)
	lwc1	$f2, 0($sp)
	lw	$a1, 24($sp)
	lw	$s7, 28($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8789:
	addi	$a0, $zero, 0
	jr	$ra
shadow_check_and_group.2741:
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
	bne	$t5, $s1, bne_else.8790
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8790:
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
	lahi	$ra, tmp.8791
	lalo	$ra, tmp.8791
	jr	$s6
tmp.8791:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 32($sp)
	lwc1	$f0, 0($a1)
	swc1	$f0, 40($sp)
	bne	$a0, $zero, beq_else.8793
	addi	$a0, $zero, 0
	j	beq_cont.8794
beq_else.8793:
	lui	$s1, -16820
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fless
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
beq_cont.8794:
	bne	$a0, $zero, bne_else.8795
	lw	$a0, 28($sp)
	sll	$a0, $a0, 2
	lw	$a1, 24($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.2524
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8796
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8796:
	lw	$a0, 20($sp)
	addi	$a0, $a0, 1
	lw	$a1, 12($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8795:
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
	lwc1	$f2, 8($a0)
	mul.s	$f2, $f2, $f0
	lwc1	$f3, 8($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 16($a0)
	mul.s	$f0, $f3, $f0
	lwc1	$f3, 16($a1)
	add.s	$f0, $f0, $f3
	addi	$a0, $zero, 0
	lw	$a1, 12($sp)
	lw	$s7, 0($sp)
	add.s	$f31, $fzero, $f2
	add.s	$f2, $fzero, $f0
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f31
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8797
	lalo	$ra, tmp.8797
	jr	$s6
tmp.8797:
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8798
	lw	$a0, 20($sp)
	addi	$a0, $a0, 1
	lw	$a1, 12($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8798:
	addi	$a0, $zero, 1
	jr	$ra
shadow_check_one_or_group.2744:
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	sll	$t0, $a0, 2
	add	$s1, $a1, $t0
	lw	$t0, 0($s1)
	addi	$s1, $zero, -1
	bne	$t0, $s1, bne_else.8799
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8799:
	sll	$t0, $t0, 2
	add	$s1, $a3, $a3
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
	lahi	$ra, tmp.8800
	lalo	$ra, tmp.8800
	jr	$s6
tmp.8800:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	bne	$a0, $zero, bne_else.8801
	lw	$a0, 8($sp)
	addi	$a0, $a0, 1
	lw	$a1, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8801:
	addi	$a0, $zero, 1
	jr	$ra
shadow_check_one_or_matrix.2747:
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
	bne	$t4, $s1, bne_else.8802
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8802:
	sw	$t3, 0($sp)
	sw	$t0, 4($sp)
	sw	$a1, 8($sp)
	sw	$s7, 12($sp)
	sw	$a0, 16($sp)
	addi	$s1, $zero, 99
	bne	$t4, $s1, beq_else.8803
	addi	$a0, $zero, 1
	j	beq_cont.8804
beq_else.8803:
	sw	$a3, 20($sp)
	add	$a1, $zero, $t1
	add	$a0, $zero, $t4
	add	$s7, $zero, $a2
	add	$a2, $zero, $t2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8805
	lalo	$ra, tmp.8805
	jr	$s6
tmp.8805:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, beq_else.8806
	addi	$a0, $zero, 0
	j	beq_cont.8807
beq_else.8806:
	lw	$a0, 20($sp)
	lwc1	$f0, 0($a0)
	lui	$s1, -16948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	min_caml_fless
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, beq_else.8808
	addi	$a0, $zero, 0
	j	beq_cont.8809
beq_else.8808:
	addi	$a0, $zero, 1
	lw	$a1, 0($sp)
	lw	$s7, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8810
	lalo	$ra, tmp.8810
	jr	$s6
tmp.8810:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, beq_else.8811
	addi	$a0, $zero, 0
	j	beq_cont.8812
beq_else.8811:
	addi	$a0, $zero, 1
beq_cont.8812:
beq_cont.8809:
beq_cont.8807:
beq_cont.8804:
	bne	$a0, $zero, bne_else.8813
	lw	$a0, 16($sp)
	addi	$a0, $a0, 1
	lw	$a1, 8($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8813:
	addi	$a0, $zero, 1
	lw	$a1, 0($sp)
	lw	$s7, 4($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8814
	lalo	$ra, tmp.8814
	jr	$s6
tmp.8814:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	bne	$a0, $zero, bne_else.8815
	lw	$a0, 16($sp)
	addi	$a0, $a0, 1
	lw	$a1, 8($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8815:
	addi	$a0, $zero, 1
	jr	$ra
solve_each_element.2750:
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
	bne	$t8, $s1, bne_else.8816
	jr	$ra
bne_else.8816:
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
	lahi	$ra, tmp.8818
	lalo	$ra, tmp.8818
	jr	$s6
tmp.8818:
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8819
	lw	$a0, 48($sp)
	sll	$a0, $a0, 2
	lw	$a1, 44($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_isinvert.2524
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	bne	$a0, $zero, bne_else.8820
	jr	$ra
bne_else.8820:
	lw	$a0, 40($sp)
	addi	$a0, $a0, 1
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$s7, 36($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8819:
	lw	$a1, 24($sp)
	lwc1	$f1, 0($a1)
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 52($sp)
	swc1	$f1, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8822
	j	beq_cont.8823
beq_else.8822:
	lw	$a0, 20($sp)
	lwc1	$f1, 0($a0)
	lwc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	min_caml_fless
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8824
	j	beq_cont.8825
beq_else.8824:
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
	lwc1	$f2, 8($a0)
	mul.s	$f2, $f2, $f0
	lwc1	$f3, 8($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 16($a0)
	mul.s	$f3, $f3, $f0
	lwc1	$f4, 16($a1)
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
	lahi	$ra, tmp.8826
	lalo	$ra, tmp.8826
	jr	$s6
tmp.8826:
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	bne	$a0, $zero, beq_else.8827
	j	beq_cont.8828
beq_else.8827:
	lw	$a0, 20($sp)
	lwc1	$f0, 88($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 80($sp)
	lwc1	$f1, 72($sp)
	lwc1	$f2, 64($sp)
	lw	$a0, 8($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	vecset.2472
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lw	$a0, 4($sp)
	lw	$a1, 48($sp)
	sw	$a1, 0($a0)
	lw	$a0, 0($sp)
	lw	$a1, 52($sp)
	sw	$a1, 0($a0)
beq_cont.8828:
beq_cont.8825:
beq_cont.8823:
	lw	$a0, 40($sp)
	addi	$a0, $a0, 1
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$s7, 36($sp)
	lw	$s6, 0($s7)
	jr	$s6
solve_one_or_network.2754:
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sll	$t1, $a0, 2
	add	$s1, $a1, $t1
	lw	$t1, 0($s1)
	addi	$s1, $zero, -1
	bne	$t1, $s1, bne_else.8829
	jr	$ra
bne_else.8829:
	sll	$t1, $t1, 2
	add	$s1, $t0, $t0
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
	lahi	$ra, tmp.8831
	lalo	$ra, tmp.8831
	jr	$s6
tmp.8831:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_or_matrix.2758:
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
	bne	$t5, $s1, bne_else.8832
	jr	$ra
bne_else.8832:
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$s7, 8($sp)
	sw	$a0, 12($sp)
	addi	$s1, $zero, 99
	bne	$t5, $s1, beq_else.8834
	addi	$a3, $zero, 1
	add	$a1, $zero, $t4
	add	$a0, $zero, $a3
	add	$s7, $zero, $t3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8836
	lalo	$ra, tmp.8836
	jr	$s6
tmp.8836:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	j	beq_cont.8835
beq_else.8834:
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
	lahi	$ra, tmp.8837
	lalo	$ra, tmp.8837
	jr	$s6
tmp.8837:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8838
	j	beq_cont.8839
beq_else.8838:
	lw	$a0, 28($sp)
	lwc1	$f0, 0($a0)
	lw	$a0, 24($sp)
	lwc1	$f1, 0($a0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fless
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8840
	j	beq_cont.8841
beq_else.8840:
	addi	$a0, $zero, 1
	lw	$a1, 16($sp)
	lw	$a2, 0($sp)
	lw	$s7, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8842
	lalo	$ra, tmp.8842
	jr	$s6
tmp.8842:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8841:
beq_cont.8839:
beq_cont.8835:
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
judge_intersection.2762:
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
	lahi	$ra, tmp.8843
	lalo	$ra, tmp.8843
	jr	$s6
tmp.8843:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f1, 0($a0)
	lui	$s1, -16948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f0
	swc1	$f1, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fless
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	bne	$a0, $zero, bne_else.8845
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8845:
	lui	$s1, 19646
	ori	$s1, $s1, 48160
	mtc1	$s1, $f1
	lwc1	$f0, 8($sp)
	j	min_caml_fless
solve_each_element_fast.2764:
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
	jal	d_vec.2579
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a1, 48($sp)
	sll	$a2, $a1, 2
	lw	$a3, 44($sp)
	add	$s1, $a3, $a2
	lw	$a2, 0($s1)
	addi	$s1, $zero, -1
	bne	$a2, $s1, bne_else.8846
	jr	$ra
bne_else.8846:
	lw	$t0, 36($sp)
	lw	$s7, 40($sp)
	sw	$a0, 52($sp)
	sw	$a2, 56($sp)
	add	$a1, $zero, $t0
	add	$a0, $zero, $a2
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8848
	lalo	$ra, tmp.8848
	jr	$s6
tmp.8848:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8849
	lw	$a0, 56($sp)
	sll	$a0, $a0, 2
	lw	$a1, 32($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_isinvert.2524
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8850
	jr	$ra
bne_else.8850:
	lw	$a0, 48($sp)
	addi	$a0, $a0, 1
	lw	$a1, 44($sp)
	lw	$a2, 36($sp)
	lw	$s7, 28($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8849:
	lw	$a1, 24($sp)
	lwc1	$f1, 0($a1)
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$a0, 60($sp)
	swc1	$f1, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fless
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	bne	$a0, $zero, beq_else.8852
	j	beq_cont.8853
beq_else.8852:
	lw	$a0, 20($sp)
	lwc1	$f1, 0($a0)
	lwc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fless
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	bne	$a0, $zero, beq_else.8854
	j	beq_cont.8855
beq_else.8854:
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
	lwc1	$f2, 8($a0)
	mul.s	$f2, $f2, $f0
	lwc1	$f3, 8($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 16($a0)
	mul.s	$f3, $f3, $f0
	lwc1	$f4, 16($a1)
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
	lahi	$ra, tmp.8856
	lalo	$ra, tmp.8856
	jr	$s6
tmp.8856:
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	bne	$a0, $zero, beq_else.8857
	j	beq_cont.8858
beq_else.8857:
	lw	$a0, 20($sp)
	lwc1	$f0, 96($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 88($sp)
	lwc1	$f1, 80($sp)
	lwc1	$f2, 72($sp)
	lw	$a0, 8($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	vecset.2472
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lw	$a0, 4($sp)
	lw	$a1, 56($sp)
	sw	$a1, 0($a0)
	lw	$a0, 0($sp)
	lw	$a1, 60($sp)
	sw	$a1, 0($a0)
beq_cont.8858:
beq_cont.8855:
beq_cont.8853:
	lw	$a0, 48($sp)
	addi	$a0, $a0, 1
	lw	$a1, 44($sp)
	lw	$a2, 36($sp)
	lw	$s7, 28($sp)
	lw	$s6, 0($s7)
	jr	$s6
solve_one_or_network_fast.2768:
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sll	$t1, $a0, 2
	add	$s1, $a1, $t1
	lw	$t1, 0($s1)
	addi	$s1, $zero, -1
	bne	$t1, $s1, bne_else.8859
	jr	$ra
bne_else.8859:
	sll	$t1, $t1, 2
	add	$s1, $t0, $t0
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
	lahi	$ra, tmp.8861
	lalo	$ra, tmp.8861
	jr	$s6
tmp.8861:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_or_matrix_fast.2772:
	lw	$a3, 16($s7)
	lw	$t0, 12($s7)
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$t3, $a0, 2
	add	$s1, $a1, $t3
	lw	$t3, 0($s1)
	lw	$t4, 0($t3)
	addi	$s1, $zero, -1
	bne	$t4, $s1, bne_else.8862
	jr	$ra
bne_else.8862:
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$s7, 8($sp)
	sw	$a0, 12($sp)
	addi	$s1, $zero, 99
	bne	$t4, $s1, beq_else.8864
	addi	$a3, $zero, 1
	add	$a1, $zero, $t3
	add	$a0, $zero, $a3
	add	$s7, $zero, $t2
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8866
	lalo	$ra, tmp.8866
	jr	$s6
tmp.8866:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	j	beq_cont.8865
beq_else.8864:
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
	lahi	$ra, tmp.8867
	lalo	$ra, tmp.8867
	jr	$s6
tmp.8867:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8868
	j	beq_cont.8869
beq_else.8868:
	lw	$a0, 28($sp)
	lwc1	$f0, 0($a0)
	lw	$a0, 24($sp)
	lwc1	$f1, 0($a0)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fless
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8870
	j	beq_cont.8871
beq_else.8870:
	addi	$a0, $zero, 1
	lw	$a1, 16($sp)
	lw	$a2, 0($sp)
	lw	$s7, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8872
	lalo	$ra, tmp.8872
	jr	$s6
tmp.8872:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8871:
beq_cont.8869:
beq_cont.8865:
	lw	$a0, 12($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
judge_intersection_fast.2776:
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
	lahi	$ra, tmp.8873
	lalo	$ra, tmp.8873
	jr	$s6
tmp.8873:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f1, 0($a0)
	lui	$s1, -16948
	ori	$s1, $s1, 52429
	mtc1	$s1, $f0
	swc1	$f1, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fless
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	bne	$a0, $zero, bne_else.8875
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8875:
	lui	$s1, 19646
	ori	$s1, $s1, 48160
	mtc1	$s1, $f1
	lwc1	$f0, 8($sp)
	j	min_caml_fless
get_nvector_rect.2778:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	lw	$a2, 0($a2)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	vecbzero.2480
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, -1
	addi	$a0, $a0, -1
	sll	$a0, $a0, 3
	lw	$a2, 4($sp)
	add	$s1, $a2, $f0
	lwc1	$f0, 0($s1)
	sw	$a1, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	sgn.2464
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fneg
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	sll	$a0, $a0, 3
	lw	$a1, 0($sp)
	add	$s1, $a1, $f0
	swc1	$f0, 0($s1)
	jr	$ra
get_nvector_plane.2780:
	lw	$a1, 4($s7)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_param_a.2528
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fneg
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_param_b.2530
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fneg
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_param_c.2532
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_fneg
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 16($a0)
	jr	$ra
get_nvector_second.2782:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	lwc1	$f0, 0($a2)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	swc1	$f0, 16($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.2536
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lwc1	$f1, 16($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	lwc1	$f1, 8($a0)
	lw	$a1, 4($sp)
	swc1	$f0, 24($sp)
	swc1	$f1, 32($sp)
	add	$a0, $zero, $a1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_y.2538
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lwc1	$f1, 32($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	lwc1	$f1, 16($a0)
	lw	$a0, 4($sp)
	swc1	$f0, 40($sp)
	swc1	$f1, 48($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	o_param_z.2540
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f1, 48($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 56($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_a.2528
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	o_param_b.2530
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_c.2532
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 80($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_isrot.2526
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	bne	$a0, $zero, beq_else.8879
	lw	$a0, 0($sp)
	lwc1	$f0, 64($sp)
	swc1	$f0, 0($a0)
	lwc1	$f0, 72($sp)
	swc1	$f0, 8($a0)
	lwc1	$f0, 80($sp)
	swc1	$f0, 16($a0)
	j	beq_cont.8880
beq_else.8879:
	lw	$a0, 4($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	o_param_r3.2556
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 88($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_r2.2554
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f2, 88($sp)
	add.s	$f0, $f2, $f0
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fhalf
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 64($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	o_param_r3.2556
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 96($sp)
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_r1.2552
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 56($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 96($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fhalf
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 72($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	o_param_r2.2554
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lwc1	$f1, 24($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	swc1	$f0, 104($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_r1.2552
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 104($sp)
	add.s	$f0, $f1, $f0
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_fhalf
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f1, 80($sp)
	add.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	swc1	$f0, 16($a0)
beq_cont.8880:
	lw	$a1, 4($sp)
	add	$a0, $zero, $a1
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_isinvert.2524
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	add	$a1, $a0, $zero
	lw	$a0, 0($sp)
	j	vecunit_sgn.2490
get_nvector.2784:
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
	jal	o_form.2520
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.8881
	lw	$a0, 12($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8881:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.8882
	lw	$a0, 4($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8882:
	lw	$a0, 4($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
utexture.2787:
	lw	$a2, 4($s7)
	sw	$a1, 0($sp)
	sw	$a2, 4($sp)
	sw	$a0, 8($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	o_texturetype.2518
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 8($sp)
	sw	$a0, 12($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_color_red.2546
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 0($a0)
	lw	$a1, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_color_green.2548
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	lw	$a1, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_color_blue.2550
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 4($sp)
	swc1	$f0, 16($a0)
	lw	$a1, 12($sp)
	addi	$s1, $zero, 1
	bne	$a1, $s1, bne_else.8883
	lw	$a1, 0($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 8($sp)
	swc1	$f0, 16($sp)
	add	$a0, $zero, $a2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	o_param_x.2536
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
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fless
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 0($sp)
	lwc1	$f0, 16($a1)
	lw	$a1, 8($sp)
	sw	$a0, 32($sp)
	swc1	$f0, 40($sp)
	add	$a0, $zero, $a1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	o_param_z.2540
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
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fless
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a1, 32($sp)
	bne	$a1, $zero, beq_else.8885
	bne	$a0, $zero, beq_else.8887
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	beq_cont.8888
beq_else.8887:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8888:
	j	beq_cont.8886
beq_else.8885:
	bne	$a0, $zero, beq_else.8889
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	beq_cont.8890
beq_else.8889:
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8890:
beq_cont.8886:
	lw	$a0, 4($sp)
	swc1	$f0, 8($a0)
	jr	$ra
bne_else.8883:
	addi	$s1, $zero, 2
	bne	$a1, $s1, bne_else.8892
	lw	$a1, 0($sp)
	lwc1	$f0, 8($a1)
	lui	$s1, 16000
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_sin
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fsqr
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
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
	swc1	$f0, 8($a0)
	jr	$ra
bne_else.8892:
	addi	$s1, $zero, 3
	bne	$a1, $s1, bne_else.8894
	lw	$a1, 0($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 8($sp)
	swc1	$f0, 56($sp)
	add	$a0, $zero, $a2
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	o_param_x.2536
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lwc1	$f1, 56($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	lwc1	$f1, 16($a0)
	lw	$a0, 8($sp)
	swc1	$f0, 64($sp)
	swc1	$f1, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_param_z.2540
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	sub.s	$f0, $f1, $f0
	lwc1	$f1, 64($sp)
	swc1	$f0, 80($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	min_caml_fsqr
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lwc1	$f1, 80($sp)
	swc1	$f0, 88($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	min_caml_fsqr
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
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
	sw	$ra, 108($sp)
	addi	$sp, $sp, 112
	jal	min_caml_fsqr
	addi	$sp, $sp, -112
	lw	$ra, 108($sp)
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f1, $f0, $f1
	lw	$a0, 4($sp)
	swc1	$f1, 8($a0)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	sub.s	$f0, $f1, $f0
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f0, $f1
	swc1	$f0, 16($a0)
	jr	$ra
bne_else.8894:
	addi	$s1, $zero, 4
	bne	$a1, $s1, bne_else.8896
	lw	$a1, 0($sp)
	lwc1	$f0, 0($a1)
	lw	$a2, 8($sp)
	swc1	$f0, 104($sp)
	add	$a0, $zero, $a2
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	o_param_x.2536
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f1, 104($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 112($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	o_param_a.2528
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 112($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	lwc1	$f1, 16($a0)
	lw	$a1, 8($sp)
	swc1	$f0, 120($sp)
	swc1	$f1, 128($sp)
	add	$a0, $zero, $a1
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	o_param_z.2540
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	lwc1	$f1, 128($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 136($sp)
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	o_param_c.2532
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	sqrt	$f0, $f0
	lwc1	$f1, 136($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 120($sp)
	swc1	$f0, 144($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	jal	min_caml_fsqr
	addi	$sp, $sp, -160
	lw	$ra, 156($sp)
	lwc1	$f1, 144($sp)
	swc1	$f0, 152($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	min_caml_fsqr
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
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
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	min_caml_fless
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	bne	$a0, $zero, beq_else.8897
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
	j	beq_cont.8898
beq_else.8897:
	lui	$s1, 16752
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8898:
	swc1	$f0, 168($sp)
	floor	$f0, $f0
	lwc1	$f1, 168($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 0($sp)
	lwc1	$f1, 8($a0)
	lw	$a0, 8($sp)
	swc1	$f0, 176($sp)
	swc1	$f1, 184($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	jal	o_param_y.2538
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	lwc1	$f1, 184($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 8($sp)
	swc1	$f0, 192($sp)
	sw	$ra, 204($sp)
	addi	$sp, $sp, 208
	jal	o_param_b.2530
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
	sw	$ra, 212($sp)
	addi	$sp, $sp, 216
	jal	min_caml_fless
	addi	$sp, $sp, -216
	lw	$ra, 212($sp)
	bne	$a0, $zero, beq_else.8899
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
	j	beq_cont.8900
beq_else.8899:
	lui	$s1, 16752
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8900:
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
	sw	$ra, 236($sp)
	addi	$sp, $sp, 240
	jal	min_caml_fsqr
	addi	$sp, $sp, -240
	lw	$ra, 236($sp)
	lwc1	$f1, 224($sp)
	sub.s	$f0, $f1, $f0
	lui	$s1, 16128
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	lwc1	$f2, 216($sp)
	sub.s	$f1, $f1, $f2
	swc1	$f0, 232($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 244($sp)
	addi	$sp, $sp, 248
	jal	min_caml_fsqr
	addi	$sp, $sp, -248
	lw	$ra, 244($sp)
	lwc1	$f1, 232($sp)
	sub.s	$f0, $f1, $f0
	swc1	$f0, 240($sp)
	sw	$ra, 252($sp)
	addi	$sp, $sp, 256
	jal	min_caml_fisneg
	addi	$sp, $sp, -256
	lw	$ra, 252($sp)
	bne	$a0, $zero, beq_else.8901
	lwc1	$f0, 240($sp)
	j	beq_cont.8902
beq_else.8901:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
beq_cont.8902:
	lui	$s1, 17279
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	mul.s	$f0, $f1, $f0
	lui	$s1, 16025
	ori	$s1, $s1, 39322
	mtc1	$s1, $f1
	div.s	$f0, $f0, $f1
	lw	$a0, 4($sp)
	swc1	$f0, 16($a0)
	jr	$ra
bne_else.8896:
	jr	$ra
add_light.2790:
	lw	$a0, 8($s7)
	lw	$a1, 4($s7)
	swc1	$f2, 0($sp)
	swc1	$f1, 8($sp)
	swc1	$f0, 16($sp)
	sw	$a0, 24($sp)
	sw	$a1, 28($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fispos
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8905
	j	beq_cont.8906
beq_else.8905:
	lwc1	$f0, 16($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	vecaccum.2501
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8906:
	lwc1	$f0, 8($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fispos
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, bne_else.8907
	jr	$ra
bne_else.8907:
	lwc1	$f0, 8($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fsqr
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fsqr
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 0($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 28($sp)
	lwc1	$f1, 0($a0)
	add.s	$f1, $f1, $f0
	swc1	$f1, 0($a0)
	lwc1	$f1, 8($a0)
	add.s	$f1, $f1, $f0
	swc1	$f1, 8($a0)
	lwc1	$f1, 16($a0)
	add.s	$f0, $f1, $f0
	swc1	$f0, 16($a0)
	jr	$ra
trace_reflections.2794:
	lw	$a2, 32($s7)
	lw	$a3, 28($s7)
	lw	$t0, 24($s7)
	lw	$t1, 20($s7)
	lw	$t2, 16($s7)
	lw	$t3, 12($s7)
	lw	$t4, 8($s7)
	lw	$t5, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.8910
	jr	$ra
bne_else.8910:
	sll	$t6, $a0, 2
	add	$s1, $a3, $a3
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
	jal	r_dvec.2585
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$s7, 56($sp)
	sw	$a0, 60($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8912
	lalo	$ra, tmp.8912
	jr	$s6
tmp.8912:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8913
	j	beq_cont.8914
beq_else.8913:
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
	jal	r_surface_id.2583
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 64($sp)
	bne	$a1, $a0, beq_else.8915
	addi	$a0, $zero, 0
	lw	$a1, 40($sp)
	lw	$a1, 0($a1)
	lw	$s7, 36($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8917
	lalo	$ra, tmp.8917
	jr	$s6
tmp.8917:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	bne	$a0, $zero, beq_else.8918
	lw	$a0, 60($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	d_vec.2579
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	add	$a1, $a0, $zero
	lw	$a0, 32($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	veciprod.2493
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 44($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	r_bright.2587
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
	jal	d_vec.2579
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	add	$a1, $a0, $zero
	lw	$a0, 20($sp)
	sw	$ra, 100($sp)
	addi	$sp, $sp, 104
	jal	veciprod.2493
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
	lahi	$ra, tmp.8921
	lalo	$ra, tmp.8921
	jr	$s6
tmp.8921:
	addi	$sp, $sp, -104
	lw	$ra, 100($sp)
	j	beq_cont.8919
beq_else.8918:
beq_cont.8919:
	j	beq_cont.8916
beq_else.8915:
beq_cont.8916:
beq_cont.8914:
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	lwc1	$f0, 24($sp)
	lwc1	$f1, 8($sp)
	lw	$a1, 20($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_ray.2799:
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
	slti	$s0, $a0, 5
	beq	$s0, $zero, bne_else.8922
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
	jal	p_surface_ids.2564
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lw	$a1, 112($sp)
	lw	$s7, 116($sp)
	sw	$a0, 120($sp)
	add	$a0, $zero, $a1
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8925
	lalo	$ra, tmp.8925
	jr	$s6
tmp.8925:
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	bne	$a0, $zero, bne_else.8926
	addi	$a0, $zero, -1
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	lw	$a3, 120($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	bne	$a1, $zero, bne_else.8927
	jr	$ra
bne_else.8927:
	lw	$a0, 112($sp)
	lw	$a1, 104($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	veciprod.2493
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_fneg
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	swc1	$f0, 128($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_fispos
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
	bne	$a0, $zero, bne_else.8930
	jr	$ra
bne_else.8930:
	lwc1	$f0, 128($sp)
	sw	$ra, 140($sp)
	addi	$sp, $sp, 144
	jal	min_caml_fsqr
	addi	$sp, $sp, -144
	lw	$ra, 140($sp)
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
	lwc1	$f1, 8($a0)
	add.s	$f1, $f1, $f0
	swc1	$f1, 8($a0)
	lwc1	$f1, 16($a0)
	add.s	$f0, $f1, $f0
	swc1	$f0, 16($a0)
	jr	$ra
bne_else.8926:
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
	jal	o_reflectiontype.2522
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lw	$a1, 140($sp)
	sw	$a0, 144($sp)
	add	$a0, $zero, $a1
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	o_diffuse.2542
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
	lahi	$ra, tmp.8934
	lalo	$ra, tmp.8934
	jr	$s6
tmp.8934:
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a0, 68($sp)
	lw	$a1, 64($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	veccpy.2482
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a0, 140($sp)
	lw	$a1, 64($sp)
	lw	$s7, 60($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8935
	lalo	$ra, tmp.8935
	jr	$s6
tmp.8935:
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
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	lw	$a0, 52($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	p_intersection_points.2562
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	lw	$a2, 64($sp)
	add	$a1, $zero, $a2
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	veccpy.2482
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a0, 52($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	p_calc_diffuse.2566
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lw	$a1, 140($sp)
	sw	$a0, 160($sp)
	add	$a0, $zero, $a1
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	o_diffuse.2542
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	lui	$s1, 16128
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	min_caml_fless
	addi	$sp, $sp, -168
	lw	$ra, 164($sp)
	bne	$a0, $zero, beq_else.8936
	addi	$a0, $zero, 1
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	lw	$a3, 160($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	lw	$a0, 52($sp)
	sw	$ra, 164($sp)
	addi	$sp, $sp, 168
	jal	p_energy.2568
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
	jal	veccpy.2482
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
	jal	vecscale.2511
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lw	$a0, 52($sp)
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	p_nvectors.2577
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	lw	$a2, 44($sp)
	add	$a1, $zero, $a2
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	veccpy.2482
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	j	beq_cont.8937
beq_else.8936:
	addi	$a0, $zero, 0
	lw	$a1, 108($sp)
	sll	$a2, $a1, 2
	lw	$a3, 160($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
beq_cont.8937:
	lui	$s1, -16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a0, 112($sp)
	lw	$a1, 44($sp)
	swc1	$f0, 168($sp)
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	veciprod.2493
	addi	$sp, $sp, -184
	lw	$ra, 180($sp)
	lwc1	$f1, 168($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 112($sp)
	lw	$a1, 44($sp)
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	vecaccum.2501
	addi	$sp, $sp, -184
	lw	$ra, 180($sp)
	lw	$a0, 140($sp)
	sw	$ra, 180($sp)
	addi	$sp, $sp, 184
	jal	o_hilight.2544
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
	lahi	$ra, tmp.8938
	lalo	$ra, tmp.8938
	jr	$s6
tmp.8938:
	addi	$sp, $sp, -192
	lw	$ra, 188($sp)
	bne	$a0, $zero, beq_else.8939
	lw	$a0, 44($sp)
	lw	$a1, 104($sp)
	sw	$ra, 188($sp)
	addi	$sp, $sp, 192
	jal	veciprod.2493
	addi	$sp, $sp, -192
	lw	$ra, 188($sp)
	sw	$ra, 188($sp)
	addi	$sp, $sp, 192
	jal	min_caml_fneg
	addi	$sp, $sp, -192
	lw	$ra, 188($sp)
	lwc1	$f1, 152($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 112($sp)
	lw	$a1, 104($sp)
	swc1	$f0, 184($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	jal	veciprod.2493
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	jal	min_caml_fneg
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 184($sp)
	lwc1	$f2, 176($sp)
	lw	$s7, 32($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8941
	lalo	$ra, tmp.8941
	jr	$s6
tmp.8941:
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	j	beq_cont.8940
beq_else.8939:
beq_cont.8940:
	lw	$a0, 64($sp)
	lw	$s7, 28($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8942
	lalo	$ra, tmp.8942
	jr	$s6
tmp.8942:
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
	lahi	$ra, tmp.8943
	lalo	$ra, tmp.8943
	jr	$s6
tmp.8943:
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	lui	$s1, 15820
	ori	$s1, $s1, 52429
	mtc1	$s1, $f0
	lwc1	$f1, 96($sp)
	sw	$ra, 196($sp)
	addi	$sp, $sp, 200
	jal	min_caml_fless
	addi	$sp, $sp, -200
	lw	$ra, 196($sp)
	bne	$a0, $zero, bne_else.8944
	jr	$ra
bne_else.8944:
	lw	$a0, 108($sp)
	slti	$s0, $a0, 4
	beq	$s0, $zero, bne_else.8946
	addi	$a1, $a0, 1
	addi	$a2, $zero, -1
	sll	$a1, $a1, 2
	lw	$a3, 120($sp)
	add	$s1, $a3, $a2
	sw	$a2, 0($s1)
	j	bne_cont.8947
bne_else.8946:
bne_cont.8947:
	lw	$a1, 144($sp)
	addi	$s1, $zero, 2
	bne	$a1, $s1, bne_else.8948
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	lw	$a1, 140($sp)
	swc1	$f0, 192($sp)
	add	$a0, $zero, $a1
	sw	$ra, 204($sp)
	addi	$sp, $sp, 208
	jal	o_diffuse.2542
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
bne_else.8948:
	jr	$ra
bne_else.8922:
	jr	$ra
trace_diffuse_ray.2805:
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
	lahi	$ra, tmp.8951
	lalo	$ra, tmp.8951
	jr	$s6
tmp.8951:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8952
	jr	$ra
bne_else.8952:
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
	jal	d_vec.2579
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	add	$a1, $a0, $zero
	lw	$a0, 56($sp)
	lw	$s7, 40($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8954
	lalo	$ra, tmp.8954
	jr	$s6
tmp.8954:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a0, 56($sp)
	lw	$a1, 32($sp)
	lw	$s7, 36($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8955
	lalo	$ra, tmp.8955
	jr	$s6
tmp.8955:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	addi	$a0, $zero, 0
	lw	$a1, 28($sp)
	lw	$a1, 0($a1)
	lw	$s7, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8956
	lalo	$ra, tmp.8956
	jr	$s6
tmp.8956:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	bne	$a0, $zero, bne_else.8957
	lw	$a0, 20($sp)
	lw	$a1, 16($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	veciprod.2493
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fneg
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	swc1	$f0, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fispos
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	bne	$a0, $zero, beq_else.8959
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	j	beq_cont.8960
beq_else.8959:
	lwc1	$f0, 64($sp)
beq_cont.8960:
	lwc1	$f1, 8($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 56($sp)
	swc1	$f0, 72($sp)
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	o_diffuse.2542
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
	lwc1	$f1, 72($sp)
	mul.s	$f0, $f1, $f0
	lw	$a0, 4($sp)
	lw	$a1, 0($sp)
	j	vecaccum.2501
bne_else.8957:
	jr	$ra
iter_trace_diffuse_rays.2808:
	lw	$t0, 4($s7)
	slti	$s0, $a3, 0
	beq	$s0, $zero, bne_else.8962
	jr	$ra
bne_else.8962:
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
	jal	d_vec.2579
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	veciprod.2493
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	swc1	$f0, 24($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	min_caml_fisneg
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	bne	$a0, $zero, beq_else.8964
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
	lahi	$ra, tmp.8966
	lalo	$ra, tmp.8966
	jr	$s6
tmp.8966:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	j	beq_cont.8965
beq_else.8964:
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
	lahi	$ra, tmp.8967
	lalo	$ra, tmp.8967
	jr	$s6
tmp.8967:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.8965:
	lw	$a0, 16($sp)
	addi	$a3, $a0, -2
	lw	$a0, 12($sp)
	lw	$a1, 20($sp)
	lw	$a2, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_diffuse_rays.2813:
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
	lahi	$ra, tmp.8968
	lalo	$ra, tmp.8968
	jr	$s6
tmp.8968:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$a3, $zero, 118
	lw	$a0, 8($sp)
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 12($sp)
	lw	$s6, 0($s7)
	jr	$s6
trace_diffuse_ray_80percent.2817:
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	sw	$a2, 0($sp)
	sw	$a1, 4($sp)
	sw	$a3, 8($sp)
	sw	$t0, 12($sp)
	sw	$a0, 16($sp)
	bne	$a0, $zero, beq_else.8969
	j	beq_cont.8970
beq_else.8969:
	lw	$t1, 0($t0)
	add	$a0, $zero, $t1
	add	$s7, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8971
	lalo	$ra, tmp.8971
	jr	$s6
tmp.8971:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8970:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, beq_else.8972
	j	beq_cont.8973
beq_else.8972:
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
	lahi	$ra, tmp.8974
	lalo	$ra, tmp.8974
	jr	$s6
tmp.8974:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8973:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 2
	bne	$a0, $s1, beq_else.8975
	j	beq_cont.8976
beq_else.8975:
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
	lahi	$ra, tmp.8977
	lalo	$ra, tmp.8977
	jr	$s6
tmp.8977:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8976:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 3
	bne	$a0, $s1, beq_else.8978
	j	beq_cont.8979
beq_else.8978:
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
	lahi	$ra, tmp.8980
	lalo	$ra, tmp.8980
	jr	$s6
tmp.8980:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8979:
	lw	$a0, 16($sp)
	addi	$s1, $zero, 4
	bne	$a0, $s1, bne_else.8981
	jr	$ra
bne_else.8981:
	lw	$a0, 12($sp)
	lw	$a0, 16($a0)
	lw	$a1, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
calc_diffuse_using_1point.2821:
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
	jal	p_received_ray_20percent.2570
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 16($sp)
	sw	$a0, 20($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.2577
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 16($sp)
	sw	$a0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_intersection_points.2562
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 16($sp)
	sw	$a0, 28($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_energy.2568
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
	jal	veccpy.2482
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 16($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_group_id.2572
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
	lahi	$ra, tmp.8983
	lalo	$ra, tmp.8983
	jr	$s6
tmp.8983:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 12($sp)
	sll	$a0, $a0, 2
	lw	$a1, 32($sp)
	add	$s1, $a1, $a1
	lw	$a1, 0($s1)
	lw	$a0, 0($sp)
	lw	$a2, 8($sp)
	j	vecaccumv.2514
calc_diffuse_using_5points.2824:
	lw	$t1, 8($s7)
	lw	$t2, 4($s7)
	sll	$t3, $a0, 2
	add	$s1, $a1, $a1
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
	jal	p_received_ray_20percent.2570
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
	jal	p_received_ray_20percent.2570
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
	jal	p_received_ray_20percent.2570
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
	jal	p_received_ray_20percent.2570
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
	jal	p_received_ray_20percent.2570
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
	jal	veccpy.2482
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
	jal	vecadd.2505
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
	jal	vecadd.2505
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
	jal	vecadd.2505
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
	jal	vecadd.2505
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 20($sp)
	sll	$a0, $a0, 2
	lw	$a1, 16($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_energy.2568
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a1, 8($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a1
	lw	$a1, 0($s1)
	lw	$a0, 0($sp)
	lw	$a2, 4($sp)
	j	vecaccumv.2514
do_without_neighbors.2830:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 5
	beq	$s0, $zero, bne_else.8984
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a0, 8($sp)
	sw	$a1, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	p_surface_ids.2564
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.8985
	jr	$ra
bne_else.8985:
	lw	$a0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	p_calc_diffuse.2566
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a1, 12($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	bne	$a0, $zero, beq_else.8987
	j	beq_cont.8988
beq_else.8987:
	lw	$a0, 8($sp)
	lw	$s7, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	lw	$s6, 0($s7)
	lahi	$ra, tmp.8989
	lalo	$ra, tmp.8989
	jr	$s6
tmp.8989:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
beq_cont.8988:
	lw	$a0, 12($sp)
	addi	$a1, $a0, 1
	lw	$a0, 8($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.8984:
	jr	$ra
neighbors_exist.2833:
	lw	$a2, 4($s7)
	lw	$a3, 4($a2)
	addi	$t0, $a1, 1
	slt	$s0, $t0, $a3
	beq	$s0, $zero, bne_else.8991
	slti	$s0, $a1, 1
	beq	$s0, $zero, bne_else.8992
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8992:
	lw	$a1, 0($a2)
	addi	$a2, $a0, 1
	slt	$s0, $a2, $a1
	beq	$s0, $zero, bne_else.8993
	slti	$s0, $a0, 1
	beq	$s0, $zero, bne_else.8994
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8994:
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8993:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8991:
	addi	$a0, $zero, 0
	jr	$ra
get_surface_id.2837:
	sw	$a1, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	p_surface_ids.2564
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a1, 0($sp)
	sll	$a1, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	jr	$ra
neighbors_are_available.2840:
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
	jal	get_surface_id.2837
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
	jal	get_surface_id.2837
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.8995
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
	jal	get_surface_id.2837
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.8996
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
	jal	get_surface_id.2837
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.8997
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
	jal	get_surface_id.2837
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	bne	$a0, $a1, bne_else.8998
	addi	$a0, $zero, 1
	jr	$ra
bne_else.8998:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8997:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8996:
	addi	$a0, $zero, 0
	jr	$ra
bne_else.8995:
	addi	$a0, $zero, 0
	jr	$ra
try_exploit_neighbors.2846:
	lw	$t2, 8($s7)
	lw	$t3, 4($s7)
	sll	$t4, $a0, 2
	add	$s1, $a3, $t4
	lw	$t4, 0($s1)
	slti	$s0, $t1, 5
	beq	$s0, $zero, bne_else.8999
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
	jal	get_surface_id.2837
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9000
	jr	$ra
bne_else.9000:
	lw	$a0, 36($sp)
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$a3, 24($sp)
	lw	$t0, 20($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	neighbors_are_available.2840
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	bne	$a0, $zero, bne_else.9002
	lw	$a0, 36($sp)
	sll	$a0, $a0, 2
	lw	$a1, 28($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	lw	$a1, 20($sp)
	lw	$s7, 16($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9002:
	lw	$a0, 12($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	p_calc_diffuse.2566
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$t0, 20($sp)
	sll	$a1, $t0, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	bne	$a0, $zero, beq_else.9003
	j	beq_cont.9004
beq_else.9003:
	lw	$a0, 36($sp)
	lw	$a1, 32($sp)
	lw	$a2, 28($sp)
	lw	$a3, 24($sp)
	lw	$s7, 8($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9005
	lalo	$ra, tmp.9005
	jr	$s6
tmp.9005:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
beq_cont.9004:
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
bne_else.8999:
	jr	$ra
write_ppm_header.2853:
	lw	$a0, 4($s7)
	addi	$a1, $zero, 80
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 51
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 10
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lw	$a1, 0($a0)
	add	$a0, $zero, $a1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lw	$a0, 4($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 255
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 10
	j	min_caml_print_char
write_rgb_element.2855:
	ftoi	$a0, $f0
	slti	$s0, $a0, 256
	beq	$s0, $zero, bne_else.9007
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9009
	addi	$a0, $zero, 0
	j	bne_cont.9010
bne_else.9009:
bne_cont.9010:
	j	bne_cont.9008
bne_else.9007:
	addi	$a0, $zero, 255
bne_cont.9008:
	j	min_caml_print_int
write_rgb.2857:
	lw	$a0, 4($s7)
	lwc1	$f0, 0($a0)
	sw	$a0, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.2855
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f0, 8($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.2855
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 32
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_char
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	lwc1	$f0, 16($a0)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	write_rgb_element.2855
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 10
	j	min_caml_print_char
pretrace_diffuse_rays.2859:
	lw	$a2, 12($s7)
	lw	$a3, 8($s7)
	lw	$t0, 4($s7)
	slti	$s0, $a1, 5
	beq	$s0, $zero, bne_else.9011
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a3, 8($sp)
	sw	$t0, 12($sp)
	sw	$a1, 16($sp)
	sw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	get_surface_id.2837
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9012
	jr	$ra
bne_else.9012:
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_calc_diffuse.2566
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 16($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	bne	$a0, $zero, beq_else.9014
	j	beq_cont.9015
beq_else.9014:
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_group_id.2572
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 12($sp)
	sw	$a0, 24($sp)
	add	$a0, $zero, $a1
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	vecbzero.2480
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a0, 20($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	jal	p_nvectors.2577
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	lw	$a1, 20($sp)
	sw	$a0, 28($sp)
	add	$a0, $zero, $a1
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_intersection_points.2562
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
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	lw	$s7, 4($sp)
	add	$a2, $zero, $a0
	add	$a0, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9016
	lalo	$ra, tmp.9016
	jr	$s6
tmp.9016:
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 20($sp)
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	p_received_ray_20percent.2570
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a1, 16($sp)
	sll	$a2, $a1, 2
	add	$s1, $a0, $a0
	lw	$a0, 0($s1)
	lw	$a2, 12($sp)
	add	$a1, $zero, $a2
	sw	$ra, 36($sp)
	addi	$sp, $sp, 40
	jal	veccpy.2482
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
beq_cont.9015:
	lw	$a0, 16($sp)
	addi	$a1, $a0, 1
	lw	$a0, 20($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9011:
	jr	$ra
pretrace_pixels.2862:
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
	beq	$s0, $zero, bne_else.9018
	jr	$ra
bne_else.9018:
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
	lwc1	$f1, 8($a0)
	mul.s	$f1, $f0, $f1
	lwc1	$f3, 48($sp)
	add.s	$f1, $f1, $f3
	swc1	$f1, 8($a1)
	lwc1	$f1, 16($a0)
	mul.s	$f0, $f0, $f1
	lwc1	$f1, 40($sp)
	add.s	$f0, $f0, $f1
	swc1	$f0, 16($a1)
	addi	$a0, $zero, 0
	add	$s6, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, $s6
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	vecunit_sgn.2490
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 32($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	vecbzero.2480
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 28($sp)
	lw	$a1, 24($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	veccpy.2482
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
	lahi	$ra, tmp.9023
	lalo	$ra, tmp.9023
	jr	$s6
tmp.9023:
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
	jal	p_rgb.2560
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a1, 32($sp)
	sw	$ra, 92($sp)
	addi	$sp, $sp, 96
	jal	veccpy.2482
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
	jal	p_set_group_id.2574
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
	lahi	$ra, tmp.9024
	lalo	$ra, tmp.9024
	jr	$s6
tmp.9024:
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
	jal	add_mod5.2469
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
pretrace_line.2869:
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
	lwc1	$f2, 8($a0)
	mul.s	$f2, $f0, $f2
	lwc1	$f3, 8($a1)
	add.s	$f2, $f2, $f3
	lwc1	$f3, 16($a0)
	mul.s	$f0, $f0, $f3
	lwc1	$f3, 16($a1)
	add.s	$f0, $f0, $f3
	lw	$a0, 12($sp)
	lw	$a0, 0($a0)
	addi	$a1, $a0, -1
	lw	$a0, 4($sp)
	lw	$a2, 0($sp)
	lw	$s7, 8($sp)
	add.s	$f31, $fzero, $f2
	add.s	$f2, $fzero, $f0
	add.s	$f0, $fzero, $f1
	add.s	$f1, $fzero, $f31
	lw	$s6, 0($s7)
	jr	$s6
scan_pixel.2873:
	lw	$t1, 24($s7)
	lw	$t2, 20($s7)
	lw	$t3, 16($s7)
	lw	$t4, 12($s7)
	lw	$t5, 8($s7)
	lw	$t6, 4($s7)
	lw	$t5, 0($t5)
	slt	$s0, $a0, $t5
	beq	$s0, $zero, bne_else.9025
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
	jal	p_rgb.2560
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	add	$a1, $a0, $zero
	lw	$a0, 40($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veccpy.2482
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 32($sp)
	lw	$a1, 28($sp)
	lw	$a2, 24($sp)
	lw	$s7, 36($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9026
	lalo	$ra, tmp.9026
	jr	$s6
tmp.9026:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	bne	$a0, $zero, beq_else.9027
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
	lahi	$ra, tmp.9029
	lalo	$ra, tmp.9029
	jr	$s6
tmp.9029:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	j	beq_cont.9028
beq_else.9027:
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
	lahi	$ra, tmp.9030
	lalo	$ra, tmp.9030
	jr	$s6
tmp.9030:
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
beq_cont.9028:
	lw	$s7, 4($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9031
	lalo	$ra, tmp.9031
	jr	$s6
tmp.9031:
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
bne_else.9025:
	jr	$ra
scan_line.2879:
	lw	$t1, 12($s7)
	lw	$t2, 8($s7)
	lw	$t3, 4($s7)
	lw	$t4, 4($t3)
	slt	$s0, $a0, $t4
	beq	$s0, $zero, bne_else.9033
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
	beq	$s0, $zero, bne_else.9034
	addi	$t3, $a0, 1
	add	$a2, $zero, $t0
	add	$a1, $zero, $t3
	add	$a0, $zero, $a3
	add	$s7, $zero, $t2
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9036
	lalo	$ra, tmp.9036
	jr	$s6
tmp.9036:
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	j	bne_cont.9035
bne_else.9034:
bne_cont.9035:
	addi	$a0, $zero, 0
	lw	$a1, 20($sp)
	lw	$a2, 16($sp)
	lw	$a3, 12($sp)
	lw	$t0, 8($sp)
	lw	$s7, 24($sp)
	sw	$ra, 28($sp)
	addi	$sp, $sp, 32
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9037
	lalo	$ra, tmp.9037
	jr	$s6
tmp.9037:
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
	jal	add_mod5.2469
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
bne_else.9033:
	jr	$ra
create_float5x3array.2885:
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
create_pixel.2887:
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
	jal	create_float5x3array.2885
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
	jal	create_float5x3array.2885
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$a0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	create_float5x3array.2885
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
	jal	create_float5x3array.2885
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
init_line_elements.2889:
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.9039
	jr	$ra
bne_else.9039:
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	create_pixel.2887
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 4($sp)
	sll	$a2, $a1, 2
	lw	$a3, 0($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	addi	$a1, $a1, -1
	add	$a0, $zero, $a3
	j	init_line_elements.2889
create_pixelline.2892:
	lw	$a0, 4($s7)
	lw	$a1, 0($a0)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	create_pixel.2887
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
	j	init_line_elements.2889
tan.2894:
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
adjust_position.2896:
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
	jal	tan.2894
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lwc1	$f1, 8($sp)
	mul.s	$f0, $f0, $f1
	jr	$ra
calc_dirvec.2899:
	lw	$a3, 4($s7)
	slti	$s0, $a0, 5
	beq	$s0, $zero, bne_else.9040
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
	jal	adjust_position.2896
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lw	$a0, 32($sp)
	addi	$a0, $a0, 1
	lwc1	$f1, 24($sp)
	swc1	$f0, 40($sp)
	sw	$a0, 48($sp)
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	adjust_position.2896
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
bne_else.9040:
	sw	$a2, 8($sp)
	sw	$a3, 52($sp)
	sw	$a1, 12($sp)
	swc1	$f0, 56($sp)
	swc1	$f1, 64($sp)
	sw	$ra, 76($sp)
	addi	$sp, $sp, 80
	jal	min_caml_fsqr
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	swc1	$f0, 72($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 84($sp)
	addi	$sp, $sp, 88
	jal	min_caml_fsqr
	addi	$sp, $sp, -88
	lw	$ra, 84($sp)
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
	jal	d_vec.2579
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f0, 104($sp)
	lwc1	$f1, 96($sp)
	lwc1	$f2, 88($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	vecset.2472
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
	jal	d_vec.2579
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f0, 96($sp)
	sw	$a0, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	min_caml_fneg
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	add.s	$f2, $fzero, $f0
	lwc1	$f0, 104($sp)
	lwc1	$f1, 88($sp)
	lw	$a0, 112($sp)
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	vecset.2472
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, 80
	sll	$a1, $a1, 2
	lw	$a2, 80($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	add	$a0, $zero, $a1
	sw	$ra, 116($sp)
	addi	$sp, $sp, 120
	jal	d_vec.2579
	addi	$sp, $sp, -120
	lw	$ra, 116($sp)
	lwc1	$f0, 104($sp)
	sw	$a0, 116($sp)
	sw	$ra, 124($sp)
	addi	$sp, $sp, 128
	jal	min_caml_fneg
	addi	$sp, $sp, -128
	lw	$ra, 124($sp)
	lwc1	$f1, 96($sp)
	swc1	$f0, 120($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fneg
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	add.s	$f2, $fzero, $f0
	lwc1	$f0, 88($sp)
	lwc1	$f1, 120($sp)
	lw	$a0, 116($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	vecset.2472
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
	jal	d_vec.2579
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	lwc1	$f0, 104($sp)
	sw	$a0, 128($sp)
	sw	$ra, 132($sp)
	addi	$sp, $sp, 136
	jal	min_caml_fneg
	addi	$sp, $sp, -136
	lw	$ra, 132($sp)
	lwc1	$f1, 96($sp)
	swc1	$f0, 136($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	jal	min_caml_fneg
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	lwc1	$f1, 88($sp)
	swc1	$f0, 144($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	jal	min_caml_fneg
	addi	$sp, $sp, -160
	lw	$ra, 156($sp)
	add.s	$f2, $fzero, $f0
	lwc1	$f0, 136($sp)
	lwc1	$f1, 144($sp)
	lw	$a0, 128($sp)
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	jal	vecset.2472
	addi	$sp, $sp, -160
	lw	$ra, 156($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, 41
	sll	$a1, $a1, 2
	lw	$a2, 80($sp)
	add	$s1, $a2, $a1
	lw	$a1, 0($s1)
	add	$a0, $zero, $a1
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	jal	d_vec.2579
	addi	$sp, $sp, -160
	lw	$ra, 156($sp)
	lwc1	$f0, 104($sp)
	sw	$a0, 152($sp)
	sw	$ra, 156($sp)
	addi	$sp, $sp, 160
	jal	min_caml_fneg
	addi	$sp, $sp, -160
	lw	$ra, 156($sp)
	lwc1	$f1, 88($sp)
	swc1	$f0, 160($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	min_caml_fneg
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	add.s	$f1, $fzero, $f0
	lwc1	$f0, 160($sp)
	lwc1	$f2, 96($sp)
	lw	$a0, 152($sp)
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	vecset.2472
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lw	$a0, 8($sp)
	addi	$a0, $a0, 81
	sll	$a0, $a0, 2
	lw	$a1, 80($sp)
	add	$s1, $a1, $a0
	lw	$a0, 0($s1)
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	d_vec.2579
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lwc1	$f0, 88($sp)
	sw	$a0, 168($sp)
	sw	$ra, 172($sp)
	addi	$sp, $sp, 176
	jal	min_caml_fneg
	addi	$sp, $sp, -176
	lw	$ra, 172($sp)
	lwc1	$f1, 104($sp)
	lwc1	$f2, 96($sp)
	lw	$a0, 168($sp)
	j	vecset.2472
calc_dirvecs.2907:
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9046
	jr	$ra
bne_else.9046:
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
	lahi	$ra, tmp.9048
	lalo	$ra, tmp.9048
	jr	$s6
tmp.9048:
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
	lahi	$ra, tmp.9049
	lalo	$ra, tmp.9049
	jr	$s6
tmp.9049:
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
	jal	add_mod5.2469
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	add	$a1, $a0, $zero
	lwc1	$f0, 8($sp)
	lw	$a0, 28($sp)
	lw	$a2, 16($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
calc_dirvec_rows.2912:
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9050
	jr	$ra
bne_else.9050:
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
	lahi	$ra, tmp.9052
	lalo	$ra, tmp.9052
	jr	$s6
tmp.9052:
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
	jal	add_mod5.2469
	addi	$sp, $sp, -32
	lw	$ra, 28($sp)
	add	$a1, $a0, $zero
	lw	$a0, 8($sp)
	addi	$a2, $a0, 4
	lw	$a0, 20($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
create_dirvec.2916:
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
create_dirvec_elements.2918:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.9053
	jr	$ra
bne_else.9053:
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	add	$s7, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9055
	lalo	$ra, tmp.9055
	jr	$s6
tmp.9055:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 8($sp)
	sll	$a2, $a1, 2
	lw	$a3, 4($sp)
	add	$s1, $a3, $a0
	sw	$a0, 0($s1)
	addi	$a1, $a1, -1
	lw	$s7, 0($sp)
	add	$a0, $zero, $a3
	lw	$s6, 0($s7)
	jr	$s6
create_dirvecs.2921:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9056
	jr	$ra
bne_else.9056:
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
	lahi	$ra, tmp.9058
	lalo	$ra, tmp.9058
	jr	$s6
tmp.9058:
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
	add	$s1, $a3, $a0
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
	lahi	$ra, tmp.9059
	lalo	$ra, tmp.9059
	jr	$s6
tmp.9059:
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	addi	$a0, $a0, -1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
init_dirvec_constants.2923:
	lw	$a2, 4($s7)
	slti	$s0, $a1, 0
	beq	$s0, $zero, bne_else.9060
	jr	$ra
bne_else.9060:
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
	lahi	$ra, tmp.9062
	lalo	$ra, tmp.9062
	jr	$s6
tmp.9062:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 8($sp)
	addi	$a1, $a0, -1
	lw	$a0, 0($sp)
	lw	$s7, 4($sp)
	lw	$s6, 0($s7)
	jr	$s6
init_vecset_constants.2926:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9063
	jr	$ra
bne_else.9063:
	sll	$a3, $a0, 2
	add	$s1, $a2, $a2
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
	lahi	$ra, tmp.9065
	lalo	$ra, tmp.9065
	jr	$s6
tmp.9065:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
init_dirvecs.2928:
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
	lahi	$ra, tmp.9066
	lalo	$ra, tmp.9066
	jr	$s6
tmp.9066:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a0, $zero, 9
	addi	$a1, $zero, 0
	addi	$a2, $zero, 0
	lw	$s7, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9067
	lalo	$ra, tmp.9067
	jr	$s6
tmp.9067:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a0, $zero, 4
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
add_reflection.2930:
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
	lahi	$ra, tmp.9070
	lalo	$ra, tmp.9070
	jr	$s6
tmp.9070:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	sw	$a0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	d_vec.2579
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lwc1	$f0, 48($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 32($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	vecset.2472
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$a0, 56($sp)
	lw	$s7, 24($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9071
	lalo	$ra, tmp.9071
	jr	$s6
tmp.9071:
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
	add	$s1, $a2, $a0
	sw	$a0, 0($s1)
	jr	$ra
setup_rect_reflection.2937:
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
	jal	o_diffuse.2542
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 16($sp)
	lwc1	$f1, 0($a0)
	swc1	$f0, 32($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	min_caml_fneg
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lw	$a0, 16($sp)
	lwc1	$f1, 8($a0)
	swc1	$f0, 40($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 52($sp)
	addi	$sp, $sp, 56
	jal	min_caml_fneg
	addi	$sp, $sp, -56
	lw	$ra, 52($sp)
	lw	$a0, 16($sp)
	lwc1	$f1, 16($a0)
	swc1	$f0, 48($sp)
	add.s	$f0, $fzero, $f1
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	jal	min_caml_fneg
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	add.s	$f3, $fzero, $f0
	lw	$a0, 12($sp)
	addi	$a1, $a0, 1
	lw	$a2, 16($sp)
	lwc1	$f1, 0($a2)
	lwc1	$f0, 32($sp)
	lwc1	$f2, 48($sp)
	lw	$a3, 4($sp)
	lw	$s7, 8($sp)
	swc1	$f3, 56($sp)
	add	$a0, $zero, $a3
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9074
	lalo	$ra, tmp.9074
	jr	$s6
tmp.9074:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 4($sp)
	addi	$a1, $a0, 1
	lw	$a2, 12($sp)
	addi	$a3, $a2, 2
	lw	$t0, 16($sp)
	lwc1	$f2, 8($t0)
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f3, 56($sp)
	lw	$s7, 8($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a3
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9075
	lalo	$ra, tmp.9075
	jr	$s6
tmp.9075:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 4($sp)
	addi	$a1, $a0, 2
	lw	$a2, 12($sp)
	addi	$a2, $a2, 3
	lw	$a3, 16($sp)
	lwc1	$f3, 16($a3)
	lwc1	$f0, 32($sp)
	lwc1	$f1, 40($sp)
	lwc1	$f2, 48($sp)
	lw	$s7, 8($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9076
	lalo	$ra, tmp.9076
	jr	$s6
tmp.9076:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, 3
	lw	$a1, 0($sp)
	sw	$a0, 0($a1)
	jr	$ra
setup_surface_reflection.2940:
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
	jal	o_diffuse.2542
	addi	$sp, $sp, -40
	lw	$ra, 36($sp)
	lwc1	$f1, 24($sp)
	sub.s	$f0, $f1, $f0
	lw	$a0, 20($sp)
	swc1	$f0, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	o_param_abc.2534
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	add	$a1, $a0, $zero
	lw	$a0, 16($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	veciprod.2493
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
	jal	o_param_a.2528
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
	jal	o_param_b.2530
	addi	$sp, $sp, -80
	lw	$ra, 76($sp)
	lwc1	$f1, 64($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 16($sp)
	lwc1	$f2, 8($a0)
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
	jal	o_param_c.2532
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lwc1	$f1, 80($sp)
	mul.s	$f0, $f1, $f0
	lwc1	$f1, 40($sp)
	mul.s	$f0, $f0, $f1
	lw	$a0, 16($sp)
	lwc1	$f1, 16($a0)
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
	lahi	$ra, tmp.9078
	lalo	$ra, tmp.9078
	jr	$s6
tmp.9078:
	addi	$sp, $sp, -96
	lw	$ra, 92($sp)
	lw	$a0, 8($sp)
	addi	$a0, $a0, 1
	lw	$a1, 0($sp)
	sw	$a0, 0($a1)
	jr	$ra
setup_reflections.2943:
	lw	$a1, 12($s7)
	lw	$a2, 8($s7)
	lw	$a3, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.9080
	jr	$ra
bne_else.9080:
	sll	$t0, $a0, 2
	add	$s1, $a3, $a3
	lw	$a3, 0($s1)
	sw	$a1, 0($sp)
	sw	$a0, 4($sp)
	sw	$a2, 8($sp)
	sw	$a3, 12($sp)
	add	$a0, $zero, $a3
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_reflectiontype.2522
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.9082
	lw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_diffuse.2542
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_fless
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	bne	$a0, $zero, bne_else.9083
	jr	$ra
bne_else.9083:
	lw	$a0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	o_form.2520
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	addi	$s1, $zero, 1
	bne	$a0, $s1, bne_else.9085
	lw	$a0, 4($sp)
	lw	$a1, 12($sp)
	lw	$s7, 8($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9085:
	addi	$s1, $zero, 2
	bne	$a0, $s1, bne_else.9086
	lw	$a0, 4($sp)
	lw	$a1, 12($sp)
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
bne_else.9086:
	jr	$ra
bne_else.9082:
	jr	$ra
rt.2945:
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
	slr	$t9, $a0, 1
	sw	$t9, 0($k0)
	slr	$a1, $a1, 1
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
	lahi	$ra, tmp.9089
	lalo	$ra, tmp.9089
	jr	$s6
tmp.9089:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$s7, 40($sp)
	sw	$a0, 56($sp)
	sw	$ra, 60($sp)
	addi	$sp, $sp, 64
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9090
	lalo	$ra, tmp.9090
	jr	$s6
tmp.9090:
	addi	$sp, $sp, -64
	lw	$ra, 60($sp)
	lw	$s7, 40($sp)
	sw	$a0, 60($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9091
	lalo	$ra, tmp.9091
	jr	$s6
tmp.9091:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$s7, 36($sp)
	sw	$a0, 64($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9092
	lalo	$ra, tmp.9092
	jr	$s6
tmp.9092:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$s7, 32($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9093
	lalo	$ra, tmp.9093
	jr	$s6
tmp.9093:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$s7, 28($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9094
	lalo	$ra, tmp.9094
	jr	$s6
tmp.9094:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 24($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	d_vec.2579
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a1, 20($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	jal	veccpy.2482
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 24($sp)
	lw	$s7, 16($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9095
	lalo	$ra, tmp.9095
	jr	$s6
tmp.9095:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	lw	$a0, 12($sp)
	lw	$a0, 0($a0)
	addi	$a0, $a0, -1
	lw	$s7, 8($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9096
	lalo	$ra, tmp.9096
	jr	$s6
tmp.9096:
	addi	$sp, $sp, -72
	lw	$ra, 68($sp)
	addi	$a1, $zero, 0
	addi	$a2, $zero, 0
	lw	$a0, 60($sp)
	lw	$s7, 4($sp)
	sw	$ra, 68($sp)
	addi	$sp, $sp, 72
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9097
	lalo	$ra, tmp.9097
	jr	$s6
tmp.9097:
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
	addi	$sp, $sp, 4096
	addi	$gp, $gp, 8192
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
	lahi	$a2, read_screen_settings.2591
	lalo	$a2, read_screen_settings.2591
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
	lahi	$t3, read_light.2593
	lalo	$t3, read_light.2593
	sw	$t3, 0($t2)
	lw	$t3, 16($sp)
	sw	$t3, 8($t2)
	lw	$t4, 20($sp)
	sw	$t4, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t6, read_nth_object.2598
	lalo	$t6, read_nth_object.2598
	sw	$t6, 0($t5)
	lw	$t6, 4($sp)
	sw	$t6, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t8, read_object.2600
	lalo	$t8, read_object.2600
	sw	$t8, 0($t7)
	sw	$t5, 8($t7)
	lw	$t5, 0($sp)
	sw	$t5, 4($t7)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, read_all_object.2602
	lalo	$t9, read_all_object.2602
	sw	$t9, 0($t8)
	sw	$t7, 4($t8)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, read_and_network.2608
	lalo	$t9, read_and_network.2608
	sw	$t9, 0($t7)
	lw	$t9, 28($sp)
	sw	$t9, 4($t7)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$k1, read_parameter.2610
	lalo	$k1, read_parameter.2610
	sw	$k1, 0($k0)
	sw	$a1, 20($k0)
	sw	$t2, 16($k0)
	sw	$t7, 12($k0)
	sw	$t8, 8($k0)
	lw	$a1, 36($sp)
	sw	$a1, 4($k0)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t7, solver_rect_surface.2612
	lalo	$t7, solver_rect_surface.2612
	sw	$t7, 0($t2)
	lw	$t7, 40($sp)
	sw	$t7, 4($t2)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_rect.2621
	lalo	$k1, solver_rect.2621
	sw	$k1, 0($t8)
	sw	$t2, 4($t8)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_surface.2627
	lalo	$k1, solver_surface.2627
	sw	$k1, 0($t2)
	sw	$t7, 4($t2)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v0, solver_second.2646
	lalo	$v0, solver_second.2646
	sw	$v0, 0($k1)
	sw	$t7, 4($k1)
	add	$v0, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$v1, solver.2652
	lalo	$v1, solver.2652
	sw	$v1, 0($v0)
	sw	$t2, 16($v0)
	sw	$k1, 12($v0)
	sw	$t8, 8($v0)
	sw	$t6, 4($v0)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, solver_rect_fast.2656
	lalo	$t8, solver_rect_fast.2656
	sw	$t8, 0($t2)
	sw	$t7, 4($t2)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_surface_fast.2663
	lalo	$k1, solver_surface_fast.2663
	sw	$k1, 0($t8)
	sw	$t7, 4($t8)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v1, solver_second_fast.2669
	lalo	$v1, solver_second_fast.2669
	sw	$v1, 0($k1)
	sw	$t7, 4($k1)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$at, solver_fast.2675
	lalo	$at, solver_fast.2675
	sw	$at, 0($v1)
	sw	$t8, 16($v1)
	sw	$k1, 12($v1)
	sw	$t2, 8($v1)
	sw	$t6, 4($v1)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, solver_surface_fast2.2679
	lalo	$k1, solver_surface_fast2.2679
	sw	$k1, 0($t8)
	sw	$t7, 4($t8)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$at, solver_second_fast2.2686
	lalo	$at, solver_second_fast2.2686
	sw	$at, 0($k1)
	sw	$t7, 4($k1)
	add	$at, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$s2, solver_fast2.2693
	lalo	$s2, solver_fast2.2693
	sw	$s2, 0($at)
	sw	$t8, 16($at)
	sw	$k1, 12($at)
	sw	$t2, 8($at)
	sw	$t6, 4($at)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, iter_setup_dirvec_constants.2705
	lalo	$t8, iter_setup_dirvec_constants.2705
	sw	$t8, 0($t2)
	sw	$t6, 4($t2)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k1, setup_dirvec_constants.2708
	lalo	$k1, setup_dirvec_constants.2708
	sw	$k1, 0($t8)
	sw	$t5, 8($t8)
	sw	$t2, 4($t8)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, setup_startp_constants.2710
	lalo	$k1, setup_startp_constants.2710
	sw	$k1, 0($t2)
	sw	$t6, 4($t2)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$s2, setup_startp.2713
	lalo	$s2, setup_startp.2713
	sw	$s2, 0($k1)
	lw	$s2, 92($sp)
	sw	$s2, 12($k1)
	sw	$t2, 8($k1)
	sw	$t5, 4($k1)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$s3, check_all_inside.2735
	lalo	$s3, check_all_inside.2735
	sw	$s3, 0($t2)
	sw	$t6, 4($t2)
	add	$s3, $gp, $zero
	addi	$gp, $gp, 32
	lahi	$s4, shadow_check_and_group.2741
	lalo	$s4, shadow_check_and_group.2741
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
	lahi	$s7, shadow_check_one_or_group.2744
	lalo	$s7, shadow_check_one_or_group.2744
	sw	$s7, 0($s6)
	sw	$s3, 8($s6)
	sw	$t9, 4($s6)
	add	$s3, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$s7, shadow_check_one_or_matrix.2747
	lalo	$s7, shadow_check_one_or_matrix.2747
	sw	$s7, 0($s3)
	sw	$v1, 20($s3)
	sw	$t7, 16($s3)
	sw	$s6, 12($s3)
	sw	$s4, 8($s3)
	sw	$s5, 4($s3)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$s6, solve_each_element.2750
	lalo	$s6, solve_each_element.2750
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
	lahi	$t5, solve_one_or_network.2754
	lalo	$t5, solve_one_or_network.2754
	sw	$t5, 0($t8)
	sw	$v1, 8($t8)
	sw	$t9, 4($t8)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$v1, trace_or_matrix.2758
	lalo	$v1, trace_or_matrix.2758
	sw	$v1, 0($t5)
	sw	$s6, 20($t5)
	sw	$s7, 16($t5)
	sw	$t7, 12($t5)
	sw	$v0, 8($t5)
	sw	$t8, 4($t5)
	add	$t8, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v0, judge_intersection.2762
	lalo	$v0, judge_intersection.2762
	sw	$v0, 0($t8)
	sw	$t5, 12($t8)
	sw	$s6, 8($t8)
	sw	$a1, 4($t8)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$v0, solve_each_element_fast.2764
	lalo	$v0, solve_each_element_fast.2764
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
	lahi	$v0, solve_one_or_network_fast.2768
	lalo	$v0, solve_one_or_network_fast.2768
	sw	$v0, 0($t2)
	sw	$t5, 8($t2)
	sw	$t9, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$t9, trace_or_matrix_fast.2772
	lalo	$t9, trace_or_matrix_fast.2772
	sw	$t9, 0($t5)
	sw	$s6, 16($t5)
	sw	$at, 12($t5)
	sw	$t7, 8($t5)
	sw	$t2, 4($t5)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, judge_intersection_fast.2776
	lalo	$t7, judge_intersection_fast.2776
	sw	$t7, 0($t2)
	sw	$t5, 12($t2)
	sw	$s6, 8($t2)
	sw	$a1, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, get_nvector_rect.2778
	lalo	$t7, get_nvector_rect.2778
	sw	$t7, 0($t5)
	lw	$t7, 60($sp)
	sw	$t7, 8($t5)
	sw	$s4, 4($t5)
	add	$t9, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v0, get_nvector_plane.2780
	lalo	$v0, get_nvector_plane.2780
	sw	$v0, 0($t9)
	sw	$t7, 4($t9)
	add	$v0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v1, get_nvector_second.2782
	lalo	$v1, get_nvector_second.2782
	sw	$v1, 0($v0)
	sw	$t7, 8($v0)
	sw	$s5, 4($v0)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$at, get_nvector.2784
	lalo	$at, get_nvector.2784
	sw	$at, 0($v1)
	sw	$v0, 12($v1)
	sw	$t5, 8($v1)
	sw	$t9, 4($v1)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, utexture.2787
	lalo	$t9, utexture.2787
	sw	$t9, 0($t5)
	lw	$t9, 64($sp)
	sw	$t9, 4($t5)
	add	$v0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$at, add_light.2790
	lalo	$at, add_light.2790
	sw	$at, 0($v0)
	sw	$t9, 8($v0)
	lw	$at, 72($sp)
	sw	$at, 4($v0)
	add	$s2, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$t0, trace_reflections.2794
	lalo	$t0, trace_reflections.2794
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
	lahi	$a3, trace_ray.2799
	lalo	$a3, trace_ray.2799
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
	lahi	$t4, trace_diffuse_ray.2805
	lalo	$t4, trace_diffuse_ray.2805
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
	lahi	$t4, iter_trace_diffuse_rays.2808
	lalo	$t4, iter_trace_diffuse_rays.2808
	sw	$t4, 0($t2)
	sw	$a3, 4($t2)
	add	$a3, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t4, trace_diffuse_rays.2813
	lalo	$t4, trace_diffuse_rays.2813
	sw	$t4, 0($a3)
	sw	$k1, 8($a3)
	sw	$t2, 4($a3)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t4, trace_diffuse_ray_80percent.2817
	lalo	$t4, trace_diffuse_ray_80percent.2817
	sw	$t4, 0($t2)
	sw	$a3, 8($t2)
	lw	$t4, 116($sp)
	sw	$t4, 4($t2)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, calc_diffuse_using_1point.2821
	lalo	$t7, calc_diffuse_using_1point.2821
	sw	$t7, 0($t5)
	sw	$t2, 12($t5)
	sw	$at, 8($t5)
	sw	$a1, 4($t5)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t7, calc_diffuse_using_5points.2824
	lalo	$t7, calc_diffuse_using_5points.2824
	sw	$t7, 0($t2)
	sw	$at, 8($t2)
	sw	$a1, 4($t2)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, do_without_neighbors.2830
	lalo	$t8, do_without_neighbors.2830
	sw	$t8, 0($t7)
	sw	$t5, 4($t7)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t8, neighbors_exist.2833
	lalo	$t8, neighbors_exist.2833
	sw	$t8, 0($t5)
	lw	$t8, 76($sp)
	sw	$t8, 4($t5)
	add	$t9, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, try_exploit_neighbors.2846
	lalo	$k0, try_exploit_neighbors.2846
	sw	$k0, 0($t9)
	sw	$t7, 8($t9)
	sw	$t2, 4($t9)
	add	$t2, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k0, write_ppm_header.2853
	lalo	$k0, write_ppm_header.2853
	sw	$k0, 0($t2)
	sw	$t8, 4($t2)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, write_rgb.2857
	lalo	$k1, write_rgb.2857
	sw	$k1, 0($k0)
	sw	$at, 4($k0)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v0, pretrace_diffuse_rays.2859
	lalo	$v0, pretrace_diffuse_rays.2859
	sw	$v0, 0($k1)
	sw	$a3, 12($k1)
	sw	$t4, 8($k1)
	sw	$a1, 4($k1)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 40
	lahi	$a3, pretrace_pixels.2862
	lalo	$a3, pretrace_pixels.2862
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
	lahi	$t1, pretrace_line.2869
	lalo	$t1, pretrace_line.2869
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
	lahi	$t1, scan_pixel.2873
	lalo	$t1, scan_pixel.2873
	sw	$t1, 0($a1)
	sw	$k0, 24($a1)
	sw	$t9, 20($a1)
	sw	$at, 16($a1)
	sw	$t5, 12($a1)
	sw	$t8, 8($a1)
	sw	$t7, 4($a1)
	add	$t1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t5, scan_line.2879
	lalo	$t5, scan_line.2879
	sw	$t5, 0($t1)
	sw	$a1, 12($t1)
	sw	$t0, 8($t1)
	sw	$t8, 4($t1)
	add	$a1, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t5, create_pixelline.2892
	lalo	$t5, create_pixelline.2892
	sw	$t5, 0($a1)
	sw	$t8, 4($a1)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t7, calc_dirvec.2899
	lalo	$t7, calc_dirvec.2899
	sw	$t7, 0($t5)
	sw	$t4, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, calc_dirvecs.2907
	lalo	$t9, calc_dirvecs.2907
	sw	$t9, 0($t7)
	sw	$t5, 4($t7)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, calc_dirvec_rows.2912
	lalo	$t9, calc_dirvec_rows.2912
	sw	$t9, 0($t5)
	sw	$t7, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$t9, create_dirvec.2916
	lalo	$t9, create_dirvec.2916
	sw	$t9, 0($t7)
	lw	$t9, 0($sp)
	sw	$t9, 4($t7)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$k1, create_dirvec_elements.2918
	lalo	$k1, create_dirvec_elements.2918
	sw	$k1, 0($k0)
	sw	$t7, 4($k0)
	add	$k1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$v0, create_dirvecs.2921
	lalo	$v0, create_dirvecs.2921
	sw	$v0, 0($k1)
	sw	$t4, 12($k1)
	sw	$k0, 8($k1)
	sw	$t7, 4($k1)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$v0, init_dirvec_constants.2923
	lalo	$v0, init_dirvec_constants.2923
	sw	$v0, 0($k0)
	lw	$v0, 144($sp)
	sw	$v0, 4($k0)
	add	$v1, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$at, init_vecset_constants.2926
	lalo	$at, init_vecset_constants.2926
	sw	$at, 0($v1)
	sw	$k0, 8($v1)
	sw	$t4, 4($v1)
	add	$t4, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, init_dirvecs.2928
	lalo	$k0, init_dirvecs.2928
	sw	$k0, 0($t4)
	sw	$v1, 12($t4)
	sw	$k1, 8($t4)
	sw	$t5, 4($t4)
	add	$t5, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, add_reflection.2930
	lalo	$k0, add_reflection.2930
	sw	$k0, 0($t5)
	sw	$v0, 12($t5)
	lw	$k0, 136($sp)
	sw	$k0, 8($t5)
	sw	$t7, 4($t5)
	add	$t7, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k0, setup_rect_reflection.2937
	lalo	$k0, setup_rect_reflection.2937
	sw	$k0, 0($t7)
	sw	$a0, 12($t7)
	sw	$t3, 8($t7)
	sw	$t5, 4($t7)
	add	$k0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$k1, setup_surface_reflection.2940
	lalo	$k1, setup_surface_reflection.2940
	sw	$k1, 0($k0)
	sw	$a0, 12($k0)
	sw	$t3, 8($k0)
	sw	$t5, 4($k0)
	add	$a0, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$t5, setup_reflections.2943
	lalo	$t5, setup_reflections.2943
	sw	$t5, 0($a0)
	sw	$k0, 12($a0)
	sw	$t7, 8($a0)
	sw	$t6, 4($a0)
	add	$s7, $gp, $zero
	addi	$gp, $gp, 64
	lahi	$t5, rt.2945
	lalo	$t5, rt.2945
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
	addi	$a0, $zero, 512
	addi	$a1, $zero, 512
	sw	$ra, 148($sp)
	addi	$sp, $sp, 152
	lw	$s6, 0($s7)
	lahi	$ra, tmp.9098
	lalo	$ra, tmp.9098
	jr	$s6
tmp.9098:
	addi	$sp, $sp, -152
	lw	$ra, 148($sp)
	addi	_R_0, $zero, 0
