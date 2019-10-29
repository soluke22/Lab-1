.data

insert_into:
	.word 4

Ask_Input:
	.asciiz "\Please enter a string to print \n"

Tell_Output:
	.asciiz "\You typed in: "

.text

main:

	la $a0, Ask_Input #loads Ask_Input and stores it into register a0
	li $v0, 4 #loads the value 4 into the register v0, 4 has the op code for print string 
	syscall #reads the register v0 for its op code, see it's 4 and prints the string located in register a0

	la $a0, insert_into #sets a0 to a space allocated for writing words
	la $a1, insert_into #gets the length of a1 so we can't go over the memory limit
	li $v0, 8 #loads the value 8 into the register v0, 8 has the op code for getting a string from the user into register v0
	syscall #reads the register v0 for op code, sees 8 and asks the user to input a string

	la $a0, Tell_Output #loads addres from the memory and stores it into a0
	li $v0, 4 $loads the value 4 into the register v0, 4 is the op code for print string
	syscall #reads the op code in v0, sees 4 and prints the string located in a0

	