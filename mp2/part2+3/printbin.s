.text
.globl _printbin
.data

bin:
    .ascii "1111 1111\0"

_printbin:
    pushl %ebp            # Setup stack frame
    movl %esp, %ebp       # move esp to exteneded base pointer
    subl $8, %esp         # Setup room for local variables
    movl 8(%ebp), %eax    # User input to eax
    movl %eax, -4(%ebp)   # store user input in local variable aswell
    movl $0, -8(%ebp)	   # Move zero into local variable 2
    movl %eax, -8(%ebp)   # User input in local variable
    shrl $4, -8(%ebp)     # shift right 4 times for hex value
    movl $bin, %edx   	   # store bin for editing later in code
    
    call donibble		   	 # Call shift to setup loop
    incl %edx             	 # increment for next int value
    movl -4(%ebp), %eax	 # local user input to eax
    movl %eax, -8(%ebp)   	 # local user input to ebp
    
    call donibble	 	 # Call shift ti setup loop
    movl $bin, %eax	 # move binary to edit in eax
    movl %ebp, %esp	 # restore esp
    popl %ebp		 # remove ebp
    ret			 # return
    
    movl $bin, %eax	 # move binary to fin in eax
    movl %ebp, %esp	 # restore esp
    popl %ebp		 # remove ebp
    ret   		 	 # return

donibble:
    pushl %ebp           # start new stack
    movl %esp, %ebp      # Move esp to ebp
    subl $16, %esp       # save room for a local var
    movl 8(%ebp), %eax   # user input to eax
    movb %al, -4(%ebp)	  # char into memory address
    movl $4, -12(%ebp)	  # counter into memory address
    movl $3, -16(%ebp)	  # second counter into memory address
    jmp ck               # Setup a loop to shift and count 

ck:
    movl 8(%ebp), %eax      # user input to eax   
    movl %eax, -8(%ebp)     # user input to ebp to shift
    movl -16(%ebp), %ecx    # enable shift
    shrl %cl, -8(%ebp)      # shift right
    andl $1, -8(%ebp)        # get furthest bit 
    movzbl -8(%ebp), %eax    # store bit into eax
    addb $0x30, %al          # adds for ascii 1 or 0
    movb %al, (%edx)	      # moves ^ value to edx
    incl %edx   	            # increment to next char value
    decl -16(%ebp)           # reduce shift value by 1
    decl -12(%ebp)	      # reduce shift value by 1
    cmpb $0, -12(%ebp)       # test for null
    jne ck		   	      # Continue checking
    movl %ebp, %esp          # else restore stack
    popl %ebp		      # remove ebp
    ret			      # return

.end