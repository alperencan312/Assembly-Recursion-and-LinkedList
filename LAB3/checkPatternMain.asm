.text

main:

	li $a0, 0x5 # 101
	li $a1, 0xFFFFFFFF # 1111...1111
	li $a2, 3
	
	jal checkPattern
	
	move $t0, $v0
	
	la $a0, msg
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
checkPattern:
	
	move $v0, $a0
	jr $ra


.data

	msg: .asciiz "The number of windows matching the given pattern: "