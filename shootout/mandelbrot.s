	j	_min_caml_start
dbl.38:
	add.s	$f0, $f0, $f0
	jr	$ra
iloop.54:
addi	$s1, $s1, 0
bne	$a0, $s1, bne_else.112
	addi	$a0, $zero, 1
	b	min_caml_print_int
bne_else.112:
	sub.s	$f2, $f2, $f3
	add.s	$f2, $f2, $f4
	stfd	$f4, 0($sp)
	sw	$a0, 8($sp)
	stfd	$f2, 16($sp)
	stfd	$f5, 24($sp)
	stfd	$f1, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	dbl.38
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lfd	$f1, 32($sp)
	mul.s	$f0, $f0, $f1
	lfd	$f5, 24($sp)
	add.s	$f1, $f0, $f5
	lfd	$f0, 16($sp)
	mul.s	$f2, $f0, $f0
	mul.s	$f3, $f1, $f1
	add.s	$f4, $f2, $f3
	lui	$f6, 16512
	ori	$f6, $f6, 0
	fcmpu	$s0, $f4, $f6
	bgt	$zero, $s0, ble_else.114
	lw	$a0, 8($sp)
	addi	$a0, $a0, -1
	lfd	$f4, 0($sp)
	b	iloop.54
ble_else.114:
	addi	$a0, $zero, 0
	b	min_caml_print_int
xloop.44:
	slti	$s0, $a0, 400
	beq	$zero, $s0, bne_else.115
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	dbl.38
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lui	$f1, 17352
	ori	$f1, $f1, 0
	div.s	$f0, $f0, $f1
	lui	$f1, 16320
	ori	$f1, $f1, 0
	sub.s	$f0, $f0, $f1
	lw	$a0, 4($sp)
	stfd	$f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_float_of_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	dbl.38
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lui	$f1, 17352
	ori	$f1, $f1, 0
	div.s	$f0, $f0, $f1
	lui	$f1, 16256
	ori	$f1, $f1, 0
	sub.s	$f5, $f0, $f1
	addi	$a0, $zero, 1000
	lui	$f0, 0
	ori	$f0, $f0, 0
	lui	$f1, 0
	ori	$f1, $f1, 0
	lui	$f2, 0
	ori	$f2, $f2, 0
	lui	$f3, 0
	ori	$f3, $f3, 0
	lfd	$f4, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	iloop.54
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	b	xloop.44
bne_else.115:
	jr	$ra
yloop.40:
	slti	$s0, $a0, 400
	beq	$zero, $s0, bne_else.117
	addi	$a1, $zero, 0
	sw	$a0, 0($sp)
	add	r29, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, r29
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	xloop.44
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	b	yloop.40
bne_else.117:
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	yloop.40
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
