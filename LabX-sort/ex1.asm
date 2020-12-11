.data
stringsArray: .space 10000
N:      .space 100   		# N - number of strings to sort, will not be over 100
length: .space 400		# length, strings will not be more than 100 characters*4, for fgets
newline: .asciiz "\n"
prompt1: .asciiz "Please enter N: "
prompt2: .asciiz "Please enter "
prompt2b: .asciiz " strings, one per line: "
.text

#less than n * 100, and then 100s where there is 1
#problem is im reading strings array in but it is not copying when i need to load address
#main:
 # li $v0, 4
  #la $a0, prompt1
 # syscall				# Please enter N
 # li $v0, 4
 # la $a0, newline
 # syscall
 # addi	$v0, $0, 5			# system call 5 is for reading an integer
 # syscall 				# integer value read is in $v0
 # add $a0, $0, $v0			# read the m
 # addi $s0, $a0, 0			# store n inside $s0
 # li $v0, 4
 # la $a0, prompt2			# please enter 
 # syscall
 # li $v0, 1
 # la $a0, ($s0)				# store n in s0
 # syscall 				# N 
 # mul $s6, $s0, 100			# N * 100 maybe
 # li $v0, 4
  #la $a0, prompt2b
 # syscall 				# strings, one per line
 # li $v0, 4
 # la $a0, newline			# newline
 # syscall
  
 # addi $t8, $0, 0			# i variable
  #sll $t8, $8, 2
 # addi $a2, $0, 0			# array index ++
 # addi $t0, $0, 0			# outerBubbleLoop counter
 # la $s3, length
  
  
  main:
  addi $v0, $0, 5
  syscall
  sw $v0, N
  add $t0, $0, $0
  lw $s1, N
  addi $t2, $0, 100
  mult $s1, $t2
  mflo $s0
  
enterStrings:
li $v0, 8
la $a0, stringsArray($t0)
li $a1, 100 #100
syscall

addi $t0, $t0, 100
bne $t0 ,$s0, enterStrings

addi $t0, $0, 0
addi $s3, $s0, -100

  
  outerBubbleLoop:  
  beq $t0, $s3, exit			#branch to exit if t0 = s0
  add $t9, $0, $0			#int didSwap = 0
  add $t5, $0, $t0			#$inner = outer
  
  innerBubbleLoop:
  addi $t3, $t3, 0
  la $s4, stringsArray($t5)
  la $a3, stringsArray($t0)	#t0
  jal compareStrings
  beq $s5, 1, if
  j else
  
  if:
  add $t3, $0, $0
  la $s4, stringsArray($t5)
  la $a3, stringsArray($t0)	#t0
  jal swapStrings
  addi $t9, $0, 1			#didSwap = a
 
  
  else:
  addi $t5, $t5, 100 
  bne $t5, $s0, innerBubbleLoop
  
  addi $t0, $t0, 100 
  beq $t9, $0, exit
  j outerBubbleLoop
  
#!!!!!where does this counter to be implemented
#li $s3, 0					#compare strings counter

#addi $t0, $0, 0
compareStrings:
  lb $t4, ($s4)					#load strings array at index
  lb $s7, ($a3)

  addi $s4, $s4, 1				#advance to next character
  addi $a3, $a3, 1				#advance to next character

  beq $t4, $s7, equalTo				#branch to equalTo if equal
  slt $t8, $t4, $s7				#store in t8 if t4 is less than s7
  beq $t8, $0, greaterThan			#branch to greater than if t8 greater than 0
  j lessThan					#else less than

	equalTo:			#sets s5 equal to 1 if they are the same
	addi $t3, $t3, 1		#t3 or s3
	bne $t4, $0, compareStrings	#branch back to compareStrings if character is the same
	li $s5, 0			#sets s5 equal to 0 if they are equal
	jr $ra

	greaterThan:			#sets s5 equal to -1 if comparison is greater than
	li $s5, -1
	jr $ra

	lessThan:			#sets s5 equal to 1 if comparison is less than
	li $s5, 1
	jr $ra

addi $t3, $t3, 1
bne $t3, $s1, compareStrings
jr $ra

swapStrings:
 # addi $t0, $0, 0			#index
addi $t2, $t2, 0			#t2 = 100 earlier, just reseting temp value 

  lb $t1, ($s4)    			#load temp1 address with byte at $t1 in str array
  lb $t2, ($a3)    			#load temp2 address with byte at $t2 in str array
  beq $t1, $t2, equal
  sb $t1, ($a3)	    			#store temp1 byte into $t1'th position in str array
  sb $t2, ($s4)  			#store temp2 byte into $t2'th position in str array
  

  addi $t3, $t3, 1
  addi $s4, $s4, 1			#changed from a0/t6
  addi $a3, $a3, 1			#changed from a1/t8
  bne $t3, 100, swapStrings
  jr $ra

	equal:
	addi $t3, $t3, 1		#add 1 to t3
	addi $s4, $s4, 1		#add 1 to t6; changed from a0
	addi $a3, $a3, 1		#changed from a1/t8
	bne $t1, $0, swapStrings	#what register do i need to set this branch to? / changed from t4
	jr $ra
	
exit:
  addi $t7, $0, 0 			#print index

	print:
	addi $v0, $0, 4			#system call 4 for printing a string
	la $a0, stringsArray($t7)	#prints strings at index t7
	syscall

	addi $t7, $t7, 100		#increment t7		
	bne $t7, $s0, print		#branch if $t7 equal to length

	addi $v0, $0, 10      		# system call code 10 for exit
	syscall               		# exit the program 
