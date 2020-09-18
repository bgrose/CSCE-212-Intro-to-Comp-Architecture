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

	
   	#Finding A^1 (Wont Actually Run but Framework)
   	li $t4, 0 #loads variable $t5 = 0
   	ALoop1: 
   		bge $t4, 1, AQuit1 # for i loop
   		add $s0, $s0, $t0 #$s0 is a
   		addi $t4, $t4, 1 # i ++
   		j ALoop1
   	AQuit1:
   		li $t4, 0 #resets counter
	
	#Finding B^4
	BLoop1: 
   		bge $t4, $t1, BQuit1 # for i loop
   		add $s1, $s1, $t1 #$s1 is b
   		addi $t4, $t4, 1 # i ++
   		j BLoop1
   	BQuit1:
   		li $t4, 0 #resets counter
   		#Now We have B^2
   	BLoop2:
   		bge $t4, $s1, BQuit2 # for i loop
   		add $s2, $s2, $s1 #$s2 is b^2
   		addi $t4, $t4, 1 # i ++
   		j BLoop2
   	BQuit2:
   		li $t4, 0 #resets counter
   		#Now we have B^4
   	
   	#Finding C^3
   	CLoop1: 
   		bge $t4, $t2, CQuit1 # for i loop
   		add $s5, $s5, $t2 #$s5 is c
   		addi $t4, $t4, 1 # i ++
   		j CLoop1
   	CQuit1:
   		li $t4, 0 #resets counter
   		#Now We have C^2
   	CLoop2: 
   		bge $t4, $t2, CQuit2 # for i loop
   		add $s6, $s6, $s5 #$s5 is c^2
   		addi $t4, $t4, 1 # i ++
   		j CLoop2
   	CQuit2:
   		li $t4, 0 #resets counter
   		#Now We have C^3
   	
   	#Finding D^4
	DLoop1: 
   		bge $t4, $t3, DQuit1 # for i loop
   		add $s3, $s3, $t3 #$s3 is d^2
   		addi $t4, $t4, 1 # i ++
   		j DLoop1
   	DQuit1:
   		li $t4, 0 #resets counter
   		#Now We have D^2
   	DLoop2:
   		bge $t4, $s3, DQuit2 # for i loop
   		add $s4, $s4, $s3 #$s4 is d^4
   		addi $t4, $t4, 1 # i ++
   		j DLoop2
   	DQuit2:
   		li $t4, 0 #resets counter
   		#Now we have D^4
	
	
	#Add for F ($S0) and G ($S1)
	add $s0, $s0, $s2
	add $s1, $s4, $s6
	
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
	
	#clear values KEEP $s0, $s1 for f and g
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0
	
	add $t0, $s0, 0 #temp f
	add $t1, $s1, 0 #temp g
	
	li $s2, 0 #Quotient
	LoopQuot: bge $t1, $t0, Done
		  sub $t0, $t0, $t1
		  addi $s2, $s2, 1
		  j LoopQuot
	Done:
	
	#Print Part 1 
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
	move $a0, $t0
	syscall
	
