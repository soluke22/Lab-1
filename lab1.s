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
	.asciiz "\n The result is:  "

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
	li $t5, 0 #sum variable
	li $t1, 11 #creates an exit condition
	loop:
		beq $t0,$t1, Exit
		add $t3, $t0, $a0
		lb $t4, ($t3)
		bge $t4, 57, decimal
		ble $t4, 48, decimal
		bge $t4, 65, upper
		ble $t4, 89, upper
		bge $t4, 97, lower
		ble $t4, 171, lower
		addi $t0, 1
		j loop
		
	decimal:
		add $t5, $t4, $t5
	lower:
		addu $t5, $t5, 

	upper:
		
	Exit:

	la $a0, str
	li $v0, 4
	syscall

	
	li $v0, 10 #loads the op code to exit the program
	syscall #exits the program after reading v0=-0