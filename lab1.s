.data

insert_into:
	.word 4

Ask_Input:
	.asciiz "\Please enter a string to print \n"

Tell_Output:
	.asciiz "\You typed in: "

.text

main:

	la $a0, Ask_Input #loads the address for Ask_Input into register a0
	li $v0, 4 #loads the value 4 into the register v0, 4 has the op code for print string 
	syscall #reads the register v0 for its op code, see it's 4 and prints the string in register a0