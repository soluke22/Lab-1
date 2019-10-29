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

Ask_Input:
	.asciiz "\Please enter a string of 10 characters to print \n"

Tell_Output:
	.asciiz "\You typed in: "

.text

main:

	la $a0, Ask_Input #loads Ask_Input and stores it into register a0
	li $v0, 4 #loads the value 4 into the register v0, 4 has the op code for print string 
	syscall #reads the register v0 for its op code, see it's 4 and prints the string located in register a0

	la $a0, str #sets a0 to a space allocated for writing words
	la $a1, str #gets the length of a1 so we can't go over the memory limit
	li $v0, 8 #loads the value 8 into the register v0, 8 has the op code for getting a string from the user into register v0
	syscall #reads the register v0 for op code, sees 8 and asks the user to input a string

	looper:
		add $t0, $zero, $zero #i = 0
	L1: add $t1, $a0, $t0 #t1 now has the address of the  index of the string
		lb $t2, 0($t1) #t2 now has the value of the  index of the string
		addi, $t2, $t2, -48 #convert the character to ASCII
		la $a0, $t2 #store it into register a0
		li $v0, 4 #print the string in register a0
		syscall#call so it prints
		addi $t0,$t0,1#increment
		j L1

	la $a0, Tell_Output #loads addres from the memory and stores it into a0
	li $v0, 4 #loads the value 4 into the register v0, 4 is the op code for print string
	syscall #reads the op code in v0, sees 4 and prints the string located in a0

	la $a0, str #loads the insert_into address into a0
	syscall #reads v0, sees 4 and prints the string in a0
	li $v0, 4 #loads 4 into register v0 which is the op code for print string
	
	li $v0, 10 #loads the op code to exit the program
	syscall #exits the program after reading v0=-0