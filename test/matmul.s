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
min_caml_sin:
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
min_caml_cos:
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
	ori	$s1, $s1, 43679
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
	ori	$s1, $s1, 59333
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
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f1
	c.lt.s	$s0, $f0, $f1
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
loop3.278:
	lw	$a1, 20($s7)
	lw	$a2, 16($s7)
	lw	$a3, 12($s7)
	lw	$t0, 8($s7)
	lw	$t1, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.391
	jr	$ra
bne_else.391:
	sll	$t2, $a2, 2
	add	$s1, $a3, $t2
	lw	$t2, 0($s1)
	sll	$t3, $a2, 2
	add	$s1, $a3, $t3
	lw	$a3, 0($s1)
	sll	$t3, $a1, 2
	add	$s1, $a3, $t3
	lwc1	$f0, 0($s1)
	sll	$a2, $a2, 2
	add	$s1, $t1, $a2
	lw	$a2, 0($s1)
	sll	$a3, $a0, 2
	add	$s1, $a2, $a3
	lwc1	$f1, 0($s1)
	sll	$a2, $a0, 2
	add	$s1, $t0, $a2
	lw	$a2, 0($s1)
	sll	$a3, $a1, 2
	add	$s1, $a2, $a3
	lwc1	$f2, 0($s1)
	mul.s	$f1, $f1, $f2
	add.s	$f0, $f0, $f1
	sll	$a1, $a1, 2
	add	$s1, $t2, $a1
	swc1	$f0, 0($s1)
	addi	$a0, $a0, -1
	lw	$s6, 0($s7)
	jr	$s6
loop2.270:
	lw	$a1, 20($s7)
	lw	$a2, 16($s7)
	lw	$a3, 12($s7)
	lw	$t0, 8($s7)
	lw	$t1, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.393
	jr	$ra
bne_else.393:
	add	$t2, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$t3, loop3.278
	lalo	$t3, loop3.278
	sw	$t3, 0($t2)
	sw	$a0, 20($t2)
	sw	$a2, 16($t2)
	sw	$a3, 12($t2)
	sw	$t0, 8($t2)
	sw	$t1, 4($t2)
	addi	$a1, $a1, -1
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	add	$a0, $zero, $a1
	add	$s7, $zero, $t2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.395
	lalo	$ra, tmp.395
	jr	$s6
tmp.395:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
loop1.265:
	lw	$a1, 20($s7)
	lw	$a2, 16($s7)
	lw	$a3, 12($s7)
	lw	$t0, 8($s7)
	lw	$t1, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.396
	jr	$ra
bne_else.396:
	add	$t2, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$t3, loop2.270
	lalo	$t3, loop2.270
	sw	$t3, 0($t2)
	sw	$a2, 20($t2)
	sw	$a0, 16($t2)
	sw	$a3, 12($t2)
	sw	$t0, 8($t2)
	sw	$t1, 4($t2)
	addi	$a1, $a1, -1
	sw	$s7, 0($sp)
	sw	$a0, 4($sp)
	add	$a0, $zero, $a1
	add	$s7, $zero, $t2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.398
	lalo	$ra, tmp.398
	jr	$s6
tmp.398:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 4($sp)
	addi	$a0, $a0, -1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
mul.138:
	add	$s7, $gp, $zero
	addi	$gp, $gp, 24
	lahi	$t2, loop1.265
	lalo	$t2, loop1.265
	sw	$t2, 0($s7)
	sw	$a2, 20($s7)
	sw	$a1, 16($s7)
	sw	$t1, 12($s7)
	sw	$t0, 8($s7)
	sw	$a3, 4($s7)
	addi	$a0, $a0, -1
	lw	$s6, 0($s7)
	jr	$s6
init.252:
	lw	$a1, 8($s7)
	lw	$a2, 4($s7)
	slti	$s0, $a0, 0
	beq	$s0, $zero, bne_else.399
	jr	$ra
bne_else.399:
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$s7, 0($sp)
	sw	$a2, 4($sp)
	sw	$a0, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_float_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a1, 8($sp)
	sll	$a2, $a1, 2
	lw	$a3, 4($sp)
	add	$s1, $a3, $a2
	sw	$a0, 0($s1)
	addi	$a0, $a1, -1
	lw	$s7, 0($sp)
	lw	$s6, 0($s7)
	jr	$s6
make.146:
	lw	$a2, 4($s7)
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	add	$a1, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_create_array
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	add	$s7, $gp, $zero
	addi	$gp, $gp, 16
	lahi	$a1, init.252
	lalo	$a1, init.252
	sw	$a1, 0($s7)
	lw	$a1, 4($sp)
	sw	$a1, 8($s7)
	sw	$a0, 4($s7)
	lw	$a1, 0($sp)
	addi	$a1, $a1, -1
	sw	$a0, 8($sp)
	add	$a0, $zero, $a1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.401
	lalo	$ra, tmp.401
	jr	$s6
tmp.401:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lw	$a0, 8($sp)
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 16384
	addi	$gp, $gp, 32000
	addi	$a0, $zero, 0
	lui	$s1, 0
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_float_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	add	$s7, $gp, $zero
	addi	$gp, $gp, 8
	lahi	$a1, make.146
	lalo	$a1, make.146
	sw	$a1, 0($s7)
	sw	$a0, 4($s7)
	addi	$a0, $zero, 2
	addi	$a1, $zero, 3
	sw	$s7, 0($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	lw	$s6, 0($s7)
	lahi	$ra, tmp.402
	lalo	$ra, tmp.402
	jr	$s6
tmp.402:
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 3
	addi	$a2, $zero, 2
	lw	$s7, 0($sp)
	sw	$a0, 4($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.403
	lalo	$ra, tmp.403
	jr	$s6
tmp.403:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	addi	$a1, $zero, 2
	addi	$a2, $zero, 2
	lw	$s7, 0($sp)
	sw	$a0, 8($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	lw	$s6, 0($s7)
	lahi	$ra, tmp.404
	lalo	$ra, tmp.404
	jr	$s6
tmp.404:
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	add	$t1, $a0, $zero
	lw	$a3, 4($sp)
	lw	$a0, 0($a3)
	lui	$s1, 16256
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 0($a0)
	lw	$a0, 0($a3)
	lui	$s1, 16384
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 4($a0)
	lw	$a0, 0($a3)
	lui	$s1, 16448
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 8($a0)
	lw	$a0, 4($a3)
	lui	$s1, 16512
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 0($a0)
	lw	$a0, 4($a3)
	lui	$s1, 16544
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 4($a0)
	lw	$a0, 4($a3)
	lui	$s1, 16576
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 8($a0)
	lw	$t0, 8($sp)
	lw	$a0, 0($t0)
	lui	$s1, 16608
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 0($a0)
	lw	$a0, 0($t0)
	lui	$s1, 16640
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 4($a0)
	lw	$a0, 4($t0)
	lui	$s1, 16656
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 0($a0)
	lw	$a0, 4($t0)
	lui	$s1, 16672
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 4($a0)
	lw	$a0, 8($t0)
	lui	$s1, 16688
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 0($a0)
	lw	$a0, 8($t0)
	lui	$s1, 16704
	ori	$s1, $s1, 0
	mtc1	$s1, $f0
	swc1	$f0, 4($a0)
	addi	$a0, $zero, 2
	addi	$a1, $zero, 3
	addi	$a2, $zero, 2
	sw	$t1, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	mul.138
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 12($sp)
	lw	$a1, 0($a0)
	lwc1	$f0, 0($a1)
	ftoi	$a0, $f0
	outi	$a0
	addi	$a0, $zero, 10
	outc	$a0
	lw	$a0, 12($sp)
	lw	$a1, 0($a0)
	lwc1	$f0, 4($a1)
	ftoi	$a0, $f0
	outi	$a0
	addi	$a0, $zero, 10
	outc	$a0
	lw	$a0, 12($sp)
	lw	$a1, 4($a0)
	lwc1	$f0, 0($a1)
	ftoi	$a0, $f0
	outi	$a0
	addi	$a0, $zero, 10
	outc	$a0
	lw	$a0, 12($sp)
	lw	$a0, 4($a0)
	lwc1	$f0, 4($a0)
	ftoi	$a0, $f0
	outi	$a0
