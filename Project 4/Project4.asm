####################################################
# Name: Bradley Grose
# Created: 11/11/2020
# Purpose: Collect 4 Integer Value s and Calculate out the value of f and g and print
# f: f=(0.1×A^4)-(0.2×B^3)+(0.3×C^2)-(0.4×D)
# g: g= (0.1×AB^2)+(0.2×C^2D^3)
# Test with {15, 9, 21, 3} should return {5050.392, 2502.6116}
# Errors Running Code: None that I know of
# Input: 4 Integer Values through Syscall
####################################################

.data
#Strings for Output
prompt: .asciiz "Enter 4 integers for A, B, C, D respectively:\n"
f: .asciiz "\nf= "
g: .asciiz "\ng= "
coefic: .float 0.1 0.2 0.3 0.4
zer: .float 0

.text
########################
#Prompt User for Input
########################

li $v0, 4	#Sets v0 to 4 for String
la $a0, prompt	#loads in the prompt
syscall		#prints out string

########################
# Collect A B C D into t1, t2, t3, t4 respectivly
########################
li $v0,5		# v0 = 5
syscall		# read integer
move $t1,$v0	# assign to t1

li $v0,5		# v0 = 5
syscall		# read integer
move $t2,$v0	# assign to t2

li $v0,5		# v0 = 5
syscall		# read integer
move $t3,$v0	# assign to t3

li $v0,5		# v0 = 5
syscall		# read integer
move $t4,$v0	# assign to t4

########################
# Solve for f=(0.1×A^4)-(0.2×B^3)+(0.3×C^2)-(0.4×D)
########################

####
# (0.1×A^4) using power fucntion and multiplier float procedures
####

move $s0, $t1	#Moves A to s0
li $s1, 4	#Loads in the exp.
jal power	#Calls Powers
move $s1, $s2	#Result to $s1
la $a0, coefic  #Loads in the coefic first value
l.s $f0, 0($a0) # Loads 0.1 into $f0
jal multipFloat	#Multip
mov.s $f4, $f2	#Moves result to $f4

####
# (0.2×B^3) using power fucntion and multiplier float procedures
####
move $s0, $t2	#Moves B to s0
li $s1, 3	#Loads in the exp.
jal power	#Calls Powers
move $s1, $s2	#Result to $s1
la $a0, coefic  #Loads in the coefic second value
l.s $f0, 4($a0) # Loads 0.2 into $f0
jal multipFloat	#Multip
mov.s $f5, $f2	#Moves result to $f5

####
# (0.3×C^2)using power fucntion and multiplier float procedures
####
move $s0, $t3	#Moves C to s0
li $s1, 2	#Loads in the exp.
jal power	#Calls Powers
move $s1, $s2	#Result to $s1
la $a0, coefic  #Loads in the coefic second value
l.s $f0, 8($a0) # Loads 0.3 into $f0
jal multipFloat	#Multip
mov.s $f6, $f2	#Moves result to $f6

####
# (0.4×D)using power fucntion and multiplier float procedures
####
move $s0, $t4	#Moves C to s0
li $s1, 1	#Loads in the exp.
jal power	#Calls Powers
move $s1, $s2	#Result to $s1
la $a0, coefic  #Loads in the coefic second value
l.s $f0, 12($a0) # Loads 0.3 into $f0
jal multipFloat	#Multip
mov.s $f7, $f2	#Moves result to $f6

####
# Put it all Together using add.s and sub.s
####
sub.s $f3,$f4,$f5	# f=(0.1*A^4)-(0.2*B^3)
add.s $f3,$f3,$f6	# f=(0.1*A^4)-(0.2*B^3)+(0.3*C^2)
sub.s $f3,$f3,$f7	# f=(0.1*A^4)-(0.2*B^3)+(0.3*C^2)-(0.4*D)

########################
# Print Out F using sys call
# f is stored in f3
########################

li $v0, 4	# Sets v0 to 4 for String
la $a0, f	# loads in the f output
syscall		# prints out string
li $v0,2		# Sets $v0 = 2 for floating point
mov.s $f12,$f3	# Moves f to $f12 to print
syscall		# prints value

########################
# Solve for G g= (0.1×AB^2)+(0.2×C^2D^3)
########################

####
# (0.1×AB^2) using power fucntion and both multiplier procedures
####

move $s0, $t2	#Move B to S0
li $s1, 2	#Loads in the exponent
jal power	#Creates the B^2
move $s0, $t1	#A into s0
move $s1, $s2	#Moves result intp S1
jal multipInts	#Call Integer Multiplier
move $s1, $s2	#Moves result into s1
la $a0, coefic  #Loads in the coefic second value
l.s $f0, 0($a0) # Loads 0.1 into $f0
jal multipFloat	#Multip
mov.s $f4, $f2  #Result into F4

####
#(0.2×C^2D^3) using power fucntion and both multiplier procedures
####
move $s0, $t3	#Move C to S0
li $s1, 2	#Loads in the exponent
jal power	#Creates the B^2
move $s4, $s2	#Result to s4
move $s0, $t4	# Load in D to s0
li $s1, 3	#Loads in the exponent
jal power	#Creates the B^2
move $s0, $s2	#Result to s0
move $s1, $s4	#Result to s0
jal multipInts	#Call Integer Multiplier
move $s1, $s2	#Moves result into s1
la $a0, coefic  #Loads in the coefic second value
l.s $f0, 4($a0) # Loads 0.2 into $f0
jal multipFloat	#Multip
mov.s $f5, $f2  #Result into F4

####
# Add it all Together using add.s
####

add.s $f3, $f4, $f5	# g = (0.1×AB^2) + (0.2×C^2D^3)

########################
# Print Out G using syscall
# g is sotrd in f3
########################

li $v0, 4	# Sets v0 to 4 for String
la $a0, g	# loads in the g output
syscall		# prints out string
li $v0,2		# Sets $v0 = 2 for floating point
mov.s $f12,$f3	# Moves g to $f12 to print
syscall		# prints value

j end		# Sends to the end of Program

#######################################################
# PROCEDURES
# Includes: a Procedure that raises an int to a power
#	    a Procedure that multiplies 2 integers
#           a Procedure that lets you multiple a float and a integer
#######################################################

####
# Power, takes a integer and a power and loops through and adddition
# S0 is where the integer is passed in
# S1 is where the exponent is passed in
# s2 is where the result stores
###
power:
li $t6, 1		#Loop Counter
li $s2, 0		#Output Value
move $s3, $s0		#Moves value to S3
Loop1:
slt $t0, $t6, $s1 	   #Makes T0 1 if its less then t6
beq $t0, $zero, doneFinal  #If T0 is 0, go to end
li $t5, 0		  # Reset Internal Counter
move $s2, $zero	           #Sets S2 to 0
Loop2:
slt $t0, $t5, $s0 	   #Makes T0 1 if t5 is less then t6
beq $t0, $zero, done  	  #If T0 is 0, go to done with cylce loop
add $s2, $s2, $s3	  # Adds s2 and s3 to compound
addi $t5, $t5, 1		  #Internal loop ++
j Loop2			  #Creates the loop
done:
move $s3, $s2		  #Moves sum to s3
addi $t6, $t6, 1	          #$t6++
j Loop1			  #Loop back to Loop1
doneFinal:
jr $ra			  #Returns the value 

####
# multipFloat allows a float decimal to be multiplied 
# by the value sent in in s1
# f1 will be the number that multiplies to get the value through addition
# f2 will be the output value
###

multipFloat:
li $t5, 0		#Resets Loop for Multiplication
l.s $f2, zer		#Sets output to 0.0
Loop3:
slt $t0,$t5,$s1		#Set $t4 = 1 if t5 is less then s1		
beq $t0,$zero,doneFP	#if t0 is 0, exit		
add.s $f2,$f2,$f0	# f2 += $f0	
addi $t5,$t5,1		# t5++	
j Loop3				
doneFP: 			
jr $ra			

####
# multipInts allows for 2 integers passes in in s1 to be multiplied togehter 
# to get the answe value
# takes in value in s1 for the times multipled
# takes in value in s0 for the other int to be multiplied
###

multipInts:
li $t5,0 		#Loop to 0	
li $s2,0			#Return to 0
Loop4:			
slt $t0,$t5,$s1		# if $t5 < $f1, t0 = 1
beq $t0,$zero,doneInt	# If T0 is 0, then return value
add $s2,$s2,$s0		# s2 += s0
addi $t5,$t5,1		# i++ for the loop
j Loop4			# Loop back around
doneInt: 			
jr $ra			# Returns to call

#################
# End (Skips the Methods) and terminates the product
#################

end: 		#Jumps past all the methods
