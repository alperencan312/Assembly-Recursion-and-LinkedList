.text

	la $a0, string1
	la $a1, string2
	jal reverseString
	
	la $a0, string2
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

	reverseString:
		addi $sp, $sp, -8
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		
		lb $t0, 0($a0)
		beqz $t0, else
		
		addi $a0, $a0, 1
		
		jal reverseString
		
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		addi $sp, $sp, 8
		
		addi $a1, $a1, 1
		lb $t0, 0($a0)
		sb $t0, -1($a1)

		jr $ra
		
	else:
		addi $sp, $sp, 8
		jr $ra
		
.data

	string1: .asciiz "abcdef"
	string2: .asciiz "qwerty"