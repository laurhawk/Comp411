.data

n: .space 4
currentLevel: .space 4
pattern: .space 84

newline: .asciiz "\n"
zero: .asciiz "0"
one: .asciiz "1"
nullTerminator: .asciiz ""

.globl main

.text

main: 
addi $v0, $0, 5			#system call for reading an int
syscall

sw $v0, n			#n at v0
sw $0, currentLevel
la $t0, nullTerminator		#nullTerminator at $t0
sll $t1, $v0, 2			#shift n (input) by 2
sw $t0, pattern($t1)		#pattern at index
la $s0, zero			#store zero in $s0
la $s1, one			#store one in $s1
lw $s2, n			#store n in $s2
lw $s3, currentLevel		#store currentLevel in $s3
lw $a1, pattern			#pattern array in $a1
jal makePatterns

exit:
addi $v0, $0, 10		#system call code 10 for exit
syscall

makePatterns:
addi $sp, $sp, -4		
sw $ra, 0($sp)
addi $sp, $sp, -4
sw $s3, 0($sp)
addi $sp, $sp, -4
sw $a1, 0($sp)
beq $s2, $s3, if
j else 

if:
addi $t2, $0, 0
j print

else:
sll $t0, $s3, 2
sw $s0, pattern($t0)
addiu $s3, $s3, 1
jal makePatterns
lw $ra, 8($sp)
lw $s3, 4($sp)
lw $a1, 0($sp)
sll $t0, $s3, 2
sw $s1, pattern($t0)
addiu $s3, $s3, 1
jal makePatterns
j restore

print:			#print the outputs 
slt $t5, $t2, $s3
beq $t5, $0, newlinePrint
sll $t3, $t2, 2
addi $v0, $0, 4
lw $a0, pattern($t3)
syscall
addi $t2, $t2, 1
j print

newlinePrint:		#need to print newline for outputs
addi $v0, $0, 4
la $a0, newline
syscall
j restore

restore:
#restore the stack
lw $ra, 8($sp)
lw $s3, 4($sp)
lw $a1, 0($sp)
addi $sp, $sp, 12
jr $ra