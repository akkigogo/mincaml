	.text
	.globl _min_caml_start
	.align 2
#	main program starts
	addi	$t0, $zero, 6
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_prin_int
	subi	$sp, $sp, 8
	lw	$ra, 4($sp)
#	main program ends