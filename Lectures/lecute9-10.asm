#Written By Bradley Grose

.data
	array1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	string1: .asciiz "Read 1st number: "
	string2: .asciiz "Read second number: "
	string3: .asciiz "Sum = "
.text

	la $t3, array1	
	li $s0, 0 # i = 0
	li $s1, 0 # sum = 0
	
Loop1: bgt $s0, 9, out
	sll $t4, $s0, 2 #i*4
	add $t4, $t4, $t3 #&array[i]
	
	lw $t5, ($t4)     #array1[i]
	add $s1, $s1, $t5 	#sum = sum + array1[i]
	addi $s0, $s0, 1		#i++
	
	j Loop1
	
out: 	li $v0, 4	#print string3
	la $a0, string3
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall

	li $v0, 4	#print string1
	la $a0, string1
	syscall
	
	li $v0, 5	#read 1st num
	syscall
	
	move $t0, $v0 #first input
	
	li $v0, 4	#print string2
	la $a0, string2
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0 #second input
	
	add $t2, $t0, $t1
	
	li $v0, 4	#print string3
	la $a0, string3
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	