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
	.asciizz "\Enter the character: \n"


output:
	.asciiz "\The result is:  "

.text

main:
	li $v0, 4
	la $a0, input
	syscall

	


	
	li $v0, 10 #loads the op code to exit the program
	syscall #exits the program after reading v0=-0