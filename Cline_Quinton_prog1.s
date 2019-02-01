# This is a simple program that uses the SPIM simulator

	.data

# Constant strings to be output to the terminal


prompt1:		.asciiz "Hello, This is a guessing Game!\n"
guessNumber:	.asciiz "Please guess a number:"
guessHigh:		.asciiz "You guess is high\n"
guessLow:		 .asciiz "Your guess is low\n"
loose:			.asciiz "Sorry you lost, thanks for playing.\n"
win:			.asciiz "Winner, Total guesses: \n"
linefeed:		.asciiz	"\n"


    .text

main: 

addi   $t0, $0, 4		 #Hardcode of secret number
addi   $t1, $0, 0		 #Stores the number of guesses
addi   $t2, $0, 10		 #This is the max number of tries
addi   $t3, $0,1		 #Stores value 1


# display "Hello" message
	li	$v0,4			# code for print_string
	la	$a0,prompt1		# point $a0 to prompt1
	syscall				# print the string


while:
	# display prompt message
		li	$v0,4			# code for print_string
		la	$a0,guessNumber		# point $a0 to prompt string
		syscall				# print the prompt

	# get an integer from the user
		li	$v0,5			# code for read_int
		syscall				# get an int from user --> returned in $v0
		move	$s0,$v0			# move the resulting int to $s0


	beq $s0,$t0,winner   #If input number is correct jump to winner 
	beq $s1,$t2, looser #If limit reached you loose
	addi $t1, $t1, 1  #increments guess counter

	
	
	li $s7,0  #Used as flag for less than or greater than
	slt $s7,$s0,$t0 # If the number guess < secretNum $s7=1 else $s7=0
	beq $s7,$0, greater #Jumps to greater

	#Less than
	# display "guessLow" message
	li	$v0,4			# code for print_string
	la	$a0,guessLow		# point $a0 to guessLow
	syscall				# print the string

	j while #Go back to top of while

	greater:
	# display "guessHigh" message
	li	$v0,4			# code for print_string
	la	$a0,guessHigh		# point $a0 to guessHigh
	syscall				# print the string

	j while # go back to top of while


winner:
# display win message
		li	$v0,4			# code for print_string
		la	$a0,win		# point $a0 to prompt string
		syscall				# print the prompt

		# print out total guesses
	li	$v0,1			# code for print_int
	move	$a0,$t1			# put number in $t1
	syscall				# print out the number
	
j exit


looser:
# display win message
		li	$v0,4			# code for print_string
		la	$a0,loose		# point $a0 to prompt string
		syscall				# print the prompt


	exit:
	li	$v0,10			# code for exit
	syscall				# exit program