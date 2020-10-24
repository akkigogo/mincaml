	.data
	.literal8
	.align 3
l.327:	 # 0.000000
	.long	0
	.long	0
	.align 3
l.326:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.325:	 # 1.500000
	.long	0
	.long	1073217536
	.align 3
l.324:	 # 400.000000
	.long	0
	.long	1081671680
	.align 3
l.323:	 # 4.000000
	.long	0
	.long	1074790400
	.text
	.globl _min_caml_start
	.align 2
	j	_min_caml_start
dbl.263:
	fadd	f0, f0, f0
	jr	$ra
iloop.279:
addi	$s1, $s1, 0
bne	$a0, $s1, bne_else.342
	addi	$a0, $zero, 1
	b	min_caml_print_int
bne_else.342:
	fsub	f2, f2, f3
	fadd	f2, f2, f4
	stfd	f4, 0($sp)
	sw	$a0, 8($sp)
	stfd	f2, 16($sp)
	stfd	f5, 24($sp)
	stfd	f1, 32($sp)
	sw	$ra, 44($sp)
	addi	$sp, $sp, 48
	jal	dbl.263
	addi	$sp, $sp, -48
	lw	$ra, 44($sp)
	lfd	f1, 32($sp)
	fmul	f0, f0, f1
	lfd	f5, 24($sp)
	fadd	f1, f0, f5
	lfd	f0, 16($sp)
	fmul	f2, f0, f0
	fmul	f3, f1, f1
	fadd	f4, f2, f3
	lis	r31, ha16(l.323)
	addi	r31, r31, lo16(l.323)
	lfd	f6, 0(r31)
	fcmpu	$s0, f4, f6
	bgt	$zero, $s0, ble_else.344
	lw	$a0, 8($sp)
	addi	$a0, $a0, -1
	lfd	f4, 0($sp)
	b	iloop.279
ble_else.344:
	addi	$a0, $zero, 0
	b	min_caml_print_int
xloop.269:
	slti	$s0, $a0, 400
	beq	$zero, $s0, bne_else.345
	sw	$a0, 0($sp)
	sw	$a1, 4($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	min_caml_float_of_int
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	dbl.263
	addi	$sp, $sp, -16
	lw	$ra, 12($sp)
	lis	r31, ha16(l.324)
	addi	r31, r31, lo16(l.324)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lis	r31, ha16(l.325)
	addi	r31, r31, lo16(l.325)
	lfd	f1, 0(r31)
	fsub	f0, f0, f1
	lw	$a0, 4($sp)
	stfd	f0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_float_of_int
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	dbl.263
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lis	r31, ha16(l.324)
	addi	r31, r31, lo16(l.324)
	lfd	f1, 0(r31)
	fdiv	f0, f0, f1
	lis	r31, ha16(l.326)
	addi	r31, r31, lo16(l.326)
	lfd	f1, 0(r31)
	fsub	f5, f0, f1
	addi	$a0, $zero, 1000
	lis	r31, ha16(l.327)
	addi	r31, r31, lo16(l.327)
	lfd	f0, 0(r31)
	lis	r31, ha16(l.327)
	addi	r31, r31, lo16(l.327)
	lfd	f1, 0(r31)
	lis	r31, ha16(l.327)
	addi	r31, r31, lo16(l.327)
	lfd	f2, 0(r31)
	lis	r31, ha16(l.327)
	addi	r31, r31, lo16(l.327)
	lfd	f3, 0(r31)
	lfd	f4, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	iloop.279
	addi	$sp, $sp, -24
	lw	$ra, 20($sp)
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	lw	$a1, 4($sp)
	b	xloop.269
bne_else.345:
	jr	$ra
yloop.265:
	slti	$s0, $a0, 400
	beq	$zero, $s0, bne_else.347
	addi	$a1, $zero, 0
	sw	$a0, 0($sp)
	add	r29, $zero, $a1
	add	$a1, $zero, $a0
	add	$a0, $zero, r29
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	xloop.269
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	lw	$a0, 0($sp)
	addi	$a0, $a0, 1
	b	yloop.265
bne_else.347:
	jr	$ra
#	main program starts: 
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 0
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	yloop.265
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
#	main program ends
