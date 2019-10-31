#N = 26+9 = 35, Base-35 from '0' to '9', 'a' to 'y', 'A' to 'Y', any character after y is ignored
#M = 35-10 = 25
#Steps:
# 1) Take in a string of 10 characters 
# 2) Convert them
# 3) Sum up the converted numbers
# 4) Print out the number
# 5) Exit the program


.data

str:
	.space 32
input:
	.asciiz "\Enter the character: \n"


output:
	.asciiz "\The result is:  "

.text

main:
	li $v0, 4
	la $a0, input
	syscall

	la $a0, str #takes in a string
	la $a1, 11 #this is for the string length
	li $v0, 8 #this inputs a string
	syscall
	
	la $a0, output #loads the address of the output ascii string
	li $v0, 4 #op code 4 prints the string
	syscall
	
	li $t0, 0 #initialize the loop variable
	li $t1, 10 #creates an exit condition
	loop:
	beq $t1,$t0, Exit
	addu $a1,$a1,$t1 #a1 = &str[t1]
	lb $a0,$t0($a1)#this should load a byte from the str
	li $v0, 11
	syscall
	addi $t0, $t0, 1 #increments $t1
		#j loop
		


		
	Exit:

	la $a0, str
	li $v0, 4
	syscall

	
	li $v0, 10 #loads the op code to exit the program
	syscall #exits the program after reading v0=-0