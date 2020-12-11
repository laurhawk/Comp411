# Starter file for ex1.asm

.data 0x0
	#...
   n: .space 100
   k: .space 100
   result: .space 100
   newline: .asciiz "\n"
      
.text 0x3000

.globl main
main:

 #   ori     $sp, $0, 0x3000     # Initialize stack pointer to the top word below .text
                                # The first value on stack will actually go at 0x2ffc
                                #   because $sp is decremented first.
 #   addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame



    # =============================================================
    # No need to create room for temporaries to be protected.
    # =============================================================
 #while n!=0 and k!=0
     				# Read the n; n is at $t0 or $16
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  move	$t0, $v0			# copy the width into $16
  beqz $v0, end        			#branch if input equals zero to exit program
  
   				# Read the k; k is at $t1 or $17
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  
  add $a0, $0, $t0		#put contents of $t0 into $a0	
  add $a1, $0, $v0		#put contents of 
  jal NchooseK
  
  move $t0, $v0
  				#Print nchoosek
  move $a0, $t0			#moves from $t0 to $t0
  addi $v0, $0, 1		#system call 1 is for printing an integer
  syscall			#print the integer
  
  addi $v0, $0, 4  		# system call 4 is for printing a string
  la $a0, newline 		# address of areaIs string is in $a0
  syscall           		# print the string
  j main			#jump back to main if this all works
  j end				#jump to end byeeeee

 end: 
  ori     $v0, $0, 10    	# System call code 10 for exit
  syscall                 	# Exit the program
  

    # ... MORE CODE FOR main HERE
    # ...
    # ...
    # END OF BODY OF main
    # =============================================================





NchooseK:    		# PLEASE DO NOT CHANGE THE NAME "NchooseK"
	#----------------------------------------------------------------#
	# $a0 has the number n, $a1 has k, from which to compute n choose k
	#
	# Write code here to implement the function you wrote in C.
	# Your implementation MUST be recursive; an iterative
	# implementation is not acceptable.
	#
	# $v0 should have the NchooseK result to be returned to main.
	#----------------------------------------------------------------#

	#...
	#...
	 slt $t0, $a0, $a1         # if n < k, then set t0 to 1
         bne $t0, $zero, END1      # if t0 != 0, branch to end1
         beq $a0, $a1, END2        # if n == k, branch to end2
         beq $a1, $zero, END2      # if n == 0, branch to end2

         sw $fp, -4($sp)		
         addi $fp, $sp, 0
         addi $sp, $sp, -12
         sw $ra, 4 ($sp)
         sw $a0, 0 ($sp)
         addi $sp, $sp, -4	#deincrement $sp
         sw $t1, ($sp)
         addi $a0, $a0, -1	#n = n-1
         jal NchooseK		#jump back to top of method for recursion

         move $t1, $v0		#move contents of t1 into v0 
         addi $sp, $sp, -4	#deincrement $sp
         sw $a1, ($sp)
         addi $sp, $sp, -4	#deincrement $sp
         sw $ra, ($sp) 

         addi $a1, $a1, -1	#increment a1
         jal NchooseK		#jump back to top of method for recursion

         add $v0, $t1, $v0

         lw $ra, ($sp)		#set contents of $ra to $sp
         addi $sp, $sp, 4	#increment $sp

         lw $a1, ($sp)
         addi $sp, $sp, 4

         lw $t1, ($sp)		
         addi $sp, $sp, 4	

         lw $a0, ($sp)		#set $a0 to contents of #$sp
         addi $sp, $sp, 4	#increment $sp
         lw $ra, ($sp)		#set $ra to contents of $sp
         addi $sp, $sp, 4	#increment $sp
         lw $fp, ($sp)		#set $fp to contents of $sp
         addi $sp, $sp, 4	#increment $sp
	 j complete		#jump to complete
	
END1:   move    $v0, $zero         
        j complete		#jump to complete 

END2:   addi $v0, $zero, 1	#increment $v0

complete: jr $ra		#return from procedure (can only call this once apparently)

