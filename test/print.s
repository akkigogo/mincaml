	.text
	.globl _min_caml_start
	.align 2
	j	_min_caml_start
#	main program starts: 
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 123
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, -456
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a0, $zero, 789
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
#	main program ends
