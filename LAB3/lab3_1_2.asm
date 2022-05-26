.text

la $a0, ask
li $v0, 4
syscall

la $a0, input
li $a1, 7	#  limits the string to have at most 6 characters
li $v0, 8
syscall

la $a0, input

jal recursiveSummation

add $t0, $v0, $zero

la $a0, result
li $v0, 4
syscall

add $a0, $t0, $zero
li $v0, 1
syscall

li $v0, 10
syscall

recursiveSummation:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	lb $t0, 0($a0)
	bne $t0, 10, else # 10 is for the new line ( "\n" )
	add $v0, $zero, $zero # return 0
	addi $sp, $sp, 8
	jr $ra
	else:
	addi $a0, $a0, 1
	jal recursiveSummation
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	lb $t0, 0($a0)
	addi $t0, $t0, -48 # to convert to integer
	add $v0, $v0, $t0
	jr $ra

.data

ask:	.asciiz "Input: "
result:	.asciiz "Result: "

input:	.asciiz ""