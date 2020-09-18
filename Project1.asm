.data
	string1: .asciiz "Student ID F14304441\n"
	string2: .asciiz "Enter the first 4 non-zero digit of Student ID seperated by enter\n"
	decimal1: .asciiz "\nf_ten = "
	binary1: .asciiz "\nf_two = "
	decimal2: .asciiz "\ng_ten = "
	binary2: .asciiz "\ng_two = "
	quotient1: .asciiz "\nh quotient = "
	remainder1: .asciiz "\nh remainder = "
	
.text
	#Prompt for a b c d 
	
	#print string1
	li $v0, 4	
	la $a0, string1
	syscall
	
	#print string2
	li $v0, 4	
	la $a0, string2
	syscall
	
	#load a
	li $v0, 5	#read 1st num
	syscall
	move $t0, $v0   #first input move
	
	#load b
	li $v0, 5	#read 2nd num
	syscall
	move $t1, $v0   #second input move
	
	#load c
	li $v0, 5	#read 3rd num
	syscall
	move $t2, $v0   #third input move
	
	#load d
	li $v0, 5	#read 4th num
	syscall
	move $t3, $v0   #fourth input move
	
	#load x y z w
	li $t4, 1
	li $t5, 4
	li $t6, 3
	li $t7, 4
	li $t8, 1 #Counter For Loops
	
		#Loop for X
	Loop1: beq $t8, $t4, quit1
		addi $t9, $t0, 0	#loads the adder
		li $s4, 1	#Counter for Nexted Loops
		j power1
		addi $t8, $t8, 1
		j Loop1
		
	power1: beq $s4, $t9, Loop1
		add $t0, $t0, $t9
		addi $s4, $s4, 1
		j power1
	quit1:
		li $t8, 1
	#Loop for Y
	Loop2: beq $t8, $t5, quit2
		addi $t9, $t0, 0	#loads the adder
		li $s4, 1	#Counter for Nexted Loops
		j power2
		addi $t8, $t8, 1
		j Loop2
		
	power2: beq $s4, $t9, Loop1
		add $t1, $t1, $t9
		addi $s4, $s4, 1
		j power2
	quit2:
		li $t8, 1
	#Loop for Z
	Loop3: beq $t8, $t6, quit3
		addi $t9, $t0, 0	#loads the adder
		li $s4, 1	#Counter for Nexted Loops
		j power3
		addi $t8, $t8, 1
		j Loop3
		
	power3: beq $s4, $t9, Loop1
		add $t2, $t2, $t9
		addi $s4, $s4, 1
		j power3
	quit3:
		li $t8, 1
	
	#Loop for W
	Loop4: beq $t8, $t7, quit4
		addi $t9, $t0, 0	#loads the adder
		li $s4, 1	#Counter for Nexted Loops
		j power4
		addi $t8, $t8, 1
		j Loop4
		
	power4: beq $s4, $t9, Loop4
		add $t3, $t3, $t9
		addi $s4, $s4, 1
		j power4
	quit4:
		li $t8, 1


	#Add for F in ten
	add $s0, $t0, $t1
	
	#Add for G in ten
	add $s1, $t2, $t3
	
	#Print Part 1 f
	li $v0, 4
	la $a0, decimal1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, binary1
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall
	
	#Print Part 1 g
	li $v0, 4
	la $a0, decimal2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, binary2
	syscall
	
	li $v0, 35
	move $a0, $s1
	syscall
	
	
# PART 2 BELOW
	

	# Code For Division
	
	#s2 is quot, s3 is remain
	
		#Print Part 1 g
	li $v0, 4
	la $a0, quotient1
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 4
	la $a0, remainder1
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
