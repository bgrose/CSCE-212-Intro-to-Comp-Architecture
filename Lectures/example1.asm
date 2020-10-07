.data
array1: .space 12

.text
start:
	la $t0, array1 	#load content $t0 = array1
	li $t1, 5 	#Load Immediate
	sw $t1, ($t0)	#first array element
	li $t1, 13	#store value
	sw $t1, 4($t0)	#second array element
	li $t1, -7	#store value
	sw $t1, 8(&t0)	#thuird array element to -7	

	
--------------------
	
.data
list: .word 3, 0, 1, 2, 6, -2, 4, 7, 3, 7
	