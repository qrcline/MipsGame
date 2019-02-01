# This is a simple program that uses the SPIM simulator

	.data

# Constant strings to be output to the terminal


prompt1:		.asciiz "Hello, This is a guessing Game!\n"
guessNumber:	.asciiz "Please guess a number:"
guessHigh:		.asciiz "You guess is high\n"
guessLow:		 .asciiz "Your guess is low\n"
loose:			.asciiz "Sorry you lost\n"
win:			.asciiz "Winner, Total guesses: \n"
linefeed:		.asciiz	"\n"


    .text

main: 

addi   $t0, $0, 4  #Hardcode of secret number


# display "Hello" message
	li	$v0,4			# code for print_string
	la	$a0,prompt1		# point $a0 to prompt1
	syscall				# print the string

# display prompt message
	li	$v0,4			# code for print_string
	la	$a0,guessNumber		# point $a0 to prompt string
	syscall				# print the prompt

# get an integer from the user
	li	$v0,5			# code for read_int
	syscall				# get an int from user --> returned in $v0
	move	$s0,$v0			# move the resulting int to $s0


beq $s0,   #If input number is correct jump to winner


# print result string
	li	$v0,4			# code for print_string
	la	$a0,result		# point $a0 to string
	syscall				# print the string
	
# print out the result
	li	$v0,1			# code for print_int
	move	$a0,$s0			# put number in $a0
	syscall				# print out the number

#print linefeed
	li	$v0,4			# code for print_string
	la	$a0,linefeed		# point $a0 to linefeed string
	syscall				# print linefeed

# All done, thank you!
	li	$v0,10			# code for exit
	syscall				# exit program



