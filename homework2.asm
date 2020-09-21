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

###################################

#   Question 3: Find the MIPS instruction with the machine code 0x02108020.

###################################

#   Question 4: Write an MIPS procedure to take an input positive integer 𝑎 through $a0 and return
#   the value 𝑎^2 hrough $v0.