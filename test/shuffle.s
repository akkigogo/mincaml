	.text
	.globl _min_caml_start
	.align 2
foo.18:
	sw	$t5, 0($sp)
	sw	$t4, 4($sp)
	sw	$t3, 8($sp)
	sw	$t2, 12($sp)
	sw	$t1, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	subi	$sp, $sp, 24
	lw	$ra, 20($sp)
	lw	$t0, 16($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	subi	$sp, $sp, 24
	lw	$ra, 20($sp)
	lw	$t0, 12($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	subi	$sp, $sp, 24
	lw	$ra, 20($sp)
	lw	$t0, 8($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	subi	$sp, $sp, 24
	lw	$ra, 20($sp)
	lw	$t0, 4($sp)
	sw	$ra, 20($sp)
	addi	$sp, $sp, 24
	jal	min_caml_print_int
	subi	$sp, $sp, 24
	lw	$ra, 20($sp)
	lw	$t0, 0($sp)
	b	min_caml_print_int
bar.25:
	mr	r29, $t5
	mr	$t5, $t2
	mr	$t2, $t3
	mr	$t3, $t4
	mr	$t4, r29
	mr	r29, $t1
	mr	$t1, $t0
	mr	$t0, r29
	b	foo.18
#	main program starts
	addi	$t0, $zero, 1
	addi	$t1, $zero, 2
	addi	$t2, $zero, 3
	addi	$t3, $zero, 4
	addi	$t4, $zero, 5
	addi	$t5, $zero, 6
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	bar.25
	subi	$sp, $sp, 8
	lw	$ra, 4($sp)
#	main program ends
