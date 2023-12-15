.text
.globl echo
echo:
    pushl %ebp # Save the current base pointer
    movl %esp, %ebp # Set up a new base pointer
    subl $8, %esp # Make room for local variables
    movb 12(%ebp), %bl # Get the character to echo
    movl 8(%ebp), %edx # Get the port number

    xorl %ecx, %ecx # Set up a counter
    movb $0xfc, %dl # Set up the mask
    inb (%dx), %al # Read the port
    orb $0x03, %al # Set the bits we want to set
    outb %al, (%dx) # Write the port
    movb $0xfe, %dl # Set up the mask

# Loop until the bits are set
loop1: 
    inb (%dx), %al # Read the port
    andb $0xb0, %al # Mask off the bits we want to check
    xorb $0xb0, %al # Check if the bits are set
    jnz loop1 # If not, try again

# Loop until the bit is clear
loop2: 
    movb $0xfd, %dl # Set up the mask
    inb (%dx), %al # Read the port
    andb $0x01, %al # Mask off the bit we want to check
    jz loop2 # If not, try again
    movb $0xf8, %dl # Set up the mask
    inb (%dx), %al # Read the port
    movb %al, %cl # Save the value
    cmpb %cl, %bl # Compare the value to the character
    je return # If they are the same, we are done
    movb $0xfd, %dl # Set up the mask

# Set up the mask
type:
    inb (%dx), %al # Read the port
    andb $0x20, %al # Mask off the bit we want to check
    jz loop2 # If not, try again
    movb %cl, %al # Restore the value
    movb $0xf8, %dl # Set up the mask
    outb %al, (%dx) # Write the port
    jmp loop2 # Try again

# Clean up and return
return: 
    mov %ebp, %esp # Restore the stack pointer
    popl %ebp # Restore the base pointer
    ret # Return to the caller
    .end
