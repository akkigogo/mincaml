	.text
	.globl _min_caml_start
	.align 2
	j	_min_caml_start
f.29:
	add	$a0, $a0, $a1
	add	$a0, $a0, $a0
	jr	$ra
#	main program starts: 
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 3
	addi	$a1, $zero, 2
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	f.29
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_print_int
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
#	main program ends
