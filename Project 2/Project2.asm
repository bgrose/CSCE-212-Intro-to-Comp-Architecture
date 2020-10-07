##########################
# Bradley Grose
# Project 1
# CSCE 212 with Dr. Wang
##########################

.data
	statement: .asciiz "The South Carolina Gamecocks football program represents the University of South Carolina in the sport of American football. The Gamecocks compete in the Football Bowl Subdivision of the National Collegiate Athletic Association (NCAA) and the Eastern Division of the Southeastern Conference. Will Muschamp currently serves as the team's head coach. They play their home games at Williams-Brice Stadium. Currently, it is the 20th largest stadium in college football."
	prompt1: .asciiz "Please input first word: "
	prompt2: .asciiz "Please input second word: "
	colonspace: .asciiz ": " #For Output of String and Result
	firstWord: .space 10	 #Storage for Word 1
	secondWord: .space 10    #Storage for Word 2
	newline: .asciiz "\n"	 #Creates a new line of seperation
	
.text
main:
	#Prompt and Collect words
	# 16 Char limit is in A1 (17)
	li $v0,4			
	la $a0,prompt1		#Print Prompt 1
	syscall	
	
	li $v0,8
	la $a0, firstWord
	li $a1, 17		
	syscall			# reads string to firstWord
	
			
	li $v0,4			
	la $a0,prompt2		#Print Prompt 2
	syscall	
	
	li $v0,8
	la $a0, secondWord
	li $a1, 17						
	syscall			# reads string to secondWord	
	
	#Set Counter and Load Statement
	la $t0, statement	#Statement
	li $t3, 0		#Counter
start1:	#Used to call firstword into $t1
	la $t1,firstWord
searchFirstWord:
	lb $t4, ($t0) #Statement 
	lb $t5, ($t1) #Word One
	
	beq $t5, '\n', increase1 #tells to move forward
	beqz $t5, increase1 #tells to move forward
	beqz $t4, end1 	#End of statement
	
	move $a0,$t4         #Makes Statemnt UpperCase  
   	jal toUpper
   	move $t4,$v0         #Restores
   	         
   	move $a0,$t5        #Makes Search UpperCase
   	jal toUpper
   	move $t5,$v0         #Restores
   	
   	bne $t4, $t5, nextChar1	#Goes to Next Char if not equal
   	addi $t0, $t0, 1		#Increase Position in statement
   	addi $t1, $t1, 1		#Inceases Position in firstWord
   	j searchFirstWord	#jumps back to start
   	
nextChar1:
	la $t6, firstWord	#loads word into t6
	bne $t6, $t1, start1	#if original not equal to current
	la $t1, firstWord	#sets original to correct
	addi $t0, $t0, 1		#Moves forward in statement
	j searchFirstWord	#Jumps to loop 

increase1: 
	addi $t3, $t3, 1		#match found
	la $t1, firstWord	#reset the word looking
	j searchFirstWord	#continue searching
end1: 	
	la $t0, firstWord	#end of loop, set first word to 
count1Loop:
	lb $a0,($t0)             #Loads the first ketter byte into a0
	beq $a0,'\n',print1	# If its no longer text, go to print
	jal toUpper		# char to upper
	move $a0, $v0		
	li $v0,11
   	syscall			#Prints out letter for word	
   	addi $t0,$t0,1		#Moves forward 1 char
   	j count1Loop		#loops til printed
print1:
	la $a0, colonspace	#Prints the ": "
	li $v0, 4
	syscall
	move $a0, $t3		#Prints the count Found
   	li $v0,1
  	syscall               # print new line
  	la $a0, newline
   	li $v0,4
   	syscall
	
#Start of Second Word
	li $t3, 0		#Reset Counter
	la $t0, statement	#Reloads statement

start2:
	la $t2,secondWord	#loads in second word
searchSecondWord:
	lb $t4, ($t0) #Statement 
	lb $t5, ($t2) #Word Two
	
	beq $t5, '\n', increase2	#increase count
	beqz $t5, increase2	#if a value increase
	beqz $t4, end2		#if statement is done
	
	move $a0,$t4         #Makes Statemnt UpperCase  
   	jal toUpper		
   	move $t4,$v0 
   	         
   	move $a0,$t5        #Makes Search UpperCase
   	jal toUpper
   	move $t5,$v0
   	
   	bne $t4, $t5, nextChar2	#Goes to Next Char if not equal
   	addi $t0, $t0, 1		#Increase Counter
   	addi $t2, $t2, 1		#Increase index
   	j searchSecondWord

nextChar2:
	la $t6, secondWord	#loads word into t6
	bne $t6, $t2, start2	#if original not equal to current
	la $t2, secondWord	#sets original to correct
	addi $t0, $t0, 1		#Moves forward in statement
	j searchSecondWord	#Jumps to loop 

increase2: 
	addi $t3, $t3, 1		#match found
	la $t2, secondWord	#reset the word looking
	j searchSecondWord	#continue searching
end2: 
	la $t0, secondWord	#end of loop, set first word to
count2Loop:
	lb $a0,($t0)		#Loads the first ketter byte into a0
	beq $a0,'\n',print2	# If its no longer text, go to print
	jal toUpper		# char to upper
	move $a0, $v0
	li $v0,11
   	syscall			#Prints out letter for word	
   	addi $t0,$t0,1		#Moves forward 1 char
   	j count2Loop		#loops til printed
   
print2:
	la $a0, colonspace	# prints ": "
	li $v0, 4
	syscall
	move $a0,$t3		# prints the count
   	li $v0,1
  	syscall               # print new line
  	li $v0, 10		#tells code to exit
  	syscall
   	
toUpper: 
   move $v0,$a0
   blt $a0,'a',return
   bgt $a0,'z',return
   addi $v0,$a0,-32	#Makes it Upper Case
return:   
	jr $ra
