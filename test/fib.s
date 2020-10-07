	.text
	.globl _min_caml_start
	.align 2
fib.10:
	slti	$s0, $t0, 2
	beq $zero, $s0, ble_else.24
	jr	$ra
ble_else.24:
	subi	$t1, $t0, 1
	sw	$t0, 0($sp)
	mr	$t0, $t1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fib.10
	subi	$sp, $sp, 8
	lw	$ra, 4($sp)
	lw	$t1, 0($sp)
	subi	$t1, $t1, 2
	sw	$t0, 4($sp)
	mr	$t0, $t1
	sw	$ra, 12($sp)
	addi	$sp, $sp, 16
	jal	fib.10
	subi	$sp, $sp, 16
	lw	$ra, 12($sp)
	lw	$t1, 4($sp)
	add	$t0, $t1, $t0
	jr	$ra
#	main program starts
	addi	$t0, $zero, 30
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	fib.10
	subi	$sp, $sp, 8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	subi	$sp, $sp, 8
	lw	$ra, 4($sp)
#	main program ends
