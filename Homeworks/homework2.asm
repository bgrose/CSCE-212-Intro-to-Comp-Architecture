#  Bradley Grose
#  Homework 2
###################

#   Question 1:
#   Convert 0Xfffffff9 (2’s complement representation) into decimal.
# 	=	0b1111 1111 1111 1111 1111 1111 1111 1111 1001
# 	=	0x0000 0000 0000 0000 0000 0000 0000 0000 0110
# 	= 	0x0000 0000 0000 0000 0000 0000 0000 0000 0111
#	=	-7

###################################

#   Question 2: In the following MIPS assembly code, translate all the instructions to their
#   corresponding machine code in hexadecimal format. This code is stored in the memory from
#   address 0x1aef0000.
Loop: lw $t0, 0($s0)
        addi $t1, $t1, -5
        srl $t1, $t1, 2
        beq $t1, $s5, Exit
        addi $s0, $s0, 4
        j Loop
Exit: …

# Address       Assembly            	Hexadecimal

# 0x1AEF 0000   lw $t0, 0($s0)	    	0x8e08 0000
# 0x1AEF 0004   addi $t1, $t1, -5	0x2129 fffb
# 0x1AEF 0008   srl $t1, $t1, 2	    	0x0009 4882
# 0x1AEF 000C   beq $t1, $s5, Exit	0x1135 0002
# 0x1AEF 0010   addi $s0, $s0, 4	0x2210 0004
# 0x1AEF 0014   j Loop		        0x0abb c000

###################################

#   Question 3: Find the MIPS instruction with the machine code 0x02108020.

# 0x0    2    1    0    8    0    2    0

# 0b0000 0010 0001 0000 1000 0000 0010 0000

# 0b000000 10000100001000000000100000

# Function is last six bits
# 0b000000 10000100001000000000 100000
#                                                              ADD
# 0b000000 10000 10000 10000 00000 100000
# opcode     rs           rt         rd     ****   func
###########################################################
add $s0, $s0, $s0

###################################

#   Question 4: Write an MIPS procedure to take an input positive integer 𝑎 through $a0 and return
#   the value 𝑎^2 hrough $v0.

li		$t0, 0 		# $t0  = 0
Loop: bge		$t0, $a0, quit	           # if $t0 >= $t1 then quit
          add		    $t1, $t1, $t0		# $t1 = $t1 + a
         addi	            $t0, $t1, 1			# $t0 = $t1 + 1
         j		       Loop			    # jump to Loop
         

quit: move 	$v0, $t1		# $v0 = $t1