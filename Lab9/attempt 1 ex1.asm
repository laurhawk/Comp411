#register usage
#$t0 = N
#$t1 = currentLevel
#$t2 = pattern array

.data 0x0
	pattern: .word

.text 0x3000

.globl main

main:
la $t2, pattern				#initialized pattern array

addi	$v0, $0, 5			# system call 5 is for reading an integer
syscall 				# integer value read is in $v0
move	$t0, $v0			# copy the width into $t0; initializing N to $t0

j makePatterns 				#jump to makePatterns after scanning in N



makePatterns:
addi $t1, $0, 0				#currentLevel at t1
beq $t1, $t0, exit			#if currentLevel == N, exit

addi $t2, $t2, 0			#??????initializing patterns to 0

#pattern[currentLevel] = '0'
addi $sp, $sp, -8			#what number am i supposed to put here
sw $ra, 4($sp)
sw $fp, 0($sp)
addi $fp, $sp, 4

addi $sp, $sp, -8
sw $s0, 4($sp)				#save s0
sw $s1, 0($sp)				#save s1

#do task
addi $s0, $s0, 1			#current level = currentlevel + 1

lw $s0, -8($fp)
lw $s1, -12($fp)

addi $sp, $fp, 4
lw $ra, 0($fp)
lw $fp, -4($fp)

jal makePatterns			#call back to top of method for recursion, need parameters

#pattern[currentLevel] = '1'
jal makePatterns			#call back to top of method for recursion, need parameters

exit:
addi $v0, $0, 4            		# system call code 4 for printing a string
la   $a0, pattern   			# put address of pattern in $a0
syscall       	        		# print the string

addi $v0, $0, 10    	  		# system call code 10 for exit
syscall      	         		# exit the program



complete:
jr $ra