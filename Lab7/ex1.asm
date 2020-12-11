.data
  AA:     .space 400  		# int AA[100]
  BB:     .space 400  		# int BB[100]
  CC:     .space 400  		# int CC[100]
  m:      .space 4   		# m is an int whose value is at most 10
                     		# actual size of the above matrices is mxm

      # You may add more variables here if you need to

.text

main:
add $s2, $0, $0				#set registers equal to 0 for use in for loops
add $s6, $0, $0 

#read in input
addi	$v0, $0, 5			# system call 5 is for reading an integer
syscall 				# integer value read is in $v0
add $a0, $0, $v0			# read the m
#lw $a0, m
mul $s4, $a0, $a0			#m value squared 
 
#temporary register set to 0
#slt statement (if t0 < m*m keep going to root (jump to top) if not, skip to next line 

ForA:
 sll $s3, $s2, 2			#$s3 = $s2 * 4
 lw $a1, AA($s3)			#add element to array at index
 addi	$v0, $0, 5			#system call 5 is for reading an integer
 syscall 				#integer value read is in $v0
 add $a1, $0, $v0			#read AA
 addi $s2, $s2, 1			#i++
 slt $s5, $s2, $s4			#$s5 = i < m*m
 bne $s5, $0, ForA			#branch if untrue

ForB:
 sll $s6, $t8, 2			#$s6 = $t8 * 4
 lw $a2, BB($s6)			#add element to array at index
 addi	$v0, $0, 5			#system call 5 is for reading an integer
 syscall 				#integer value read is in $v0
 add $a2, $0, $v0			#read BB
 addi $t8, $t8, 1			#i++
 slt $s7, $t8, $s4			#$s7 = i < m*m
 bne $s7, $0, ForB			#branch if untrue
 
 lw $a3, CC	
 
#multiply matrix A by matrix B		

add $10, $0, $0 			#$10 has i set equal to 0
add $12, $0, $0 			#$12 has j set equal to 0
add $14, $0, $0 			#$14 has k set equal to 0

ForI:
sll $11, $10, 2 			#$11 = i*4
addi $10, $10, 1 			#i++
#j ForJ

ForJ:
sll $13, $12, 2 			#$13 = j*4
addi $12, $12, 1 			#i++
#j ForK

ForK:
sll $15, $14, 2 			#$15 = k*4
addi $14, $14, 1 			#k++

#bge $14, $a0, exit #branches to exit if the k index is larger than m
#add $a3, $a3, $

slt $16, $14, $a0  			#$16 = k<m
#bne $16, $0, ForK 			#if 16 is true, go back to fork

#row * m+col
mul $17, $10, $a0		
add $17, $17, $12
#row * m+k
mul $k1, $10, $a0
add $k1, $k1, $14
#col + k*m
mul $fp, $14, $a0
add $fp, $fp, $12

#how to express this
#mul $a3($17), $a1($k1), $a2($fp)

#sw $a3, CC($17) #store to CC

#jal ForK



#print	
add $k0, $0, $0			#i = 0
Print:
addi $v0, $0, 4  		# system call 4 is for printing a string
la $a3, CC($0)			# address of CC string is in $a3
syscall				#system call to print CC
sll $t9, $k0, 2 		#$t9 = i * 4
addi $k0, $k0, 1		#i++
slt $t8, $k0, $s4		#$t8 = i<m 
bne $k0, $0, Print		#if $t8 is true, go back to print
#jal ForJ

#------- INSERT YOUR CODE HERE for main -------
#
#  Best is to convert the C program line by line
#    into its assembly equivalent.  Carefully review
#    the coding templates near the end of Lecture 8.
#
#
#  1.  First, read m (the matrices will then be size mxm).
#  2.  Next, read matrix A followed by matrix B.
#  3.  Compute matrix product.  You will need triple-nested loops for this.
#  4.  Print the result, one row per line, with one (or more) space(s) between
#      values within a row.
#  5.  Exit.
#
#------------ END CODE ---------------


exit:                     	# this is code to terminate the program -- don't mess with this!
  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program



#------- If you decide to make other functions, place their code here -------
#
#  You do not have to use helper methods, but you may if you would like to.
#  If you do use them, be sure to do all the proper stack management.
#  For this exercise though, it is easy enough to write all your code
#  within main.
#
#------------ END CODE ---------------
