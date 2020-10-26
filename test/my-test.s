	j	_min_caml_start
f.5:
	addi	$a1, $zero, 2
	addi	$a2, $zero, 3
	sw	$a0, 0($sp)
	add	$a0, $zero, $a1
	add	$a1, $zero, $a2
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	min_caml_create_array
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
	addi	$a1, $zero, 3
	lw	$a2, 0($sp)
	sll	$a2, $a2, 2
	stwx	$a1, $a0, $a2
	jr	$ra
_min_caml_start:
	addi	$sp, $sp, 4096
	addi	$a0, $zero, 1
	sw	$ra, 4($sp)
	addi	$sp, $sp, 8
	jal	f.5
	addi	$sp, $sp, -8
	lw	$ra, 4($sp)
