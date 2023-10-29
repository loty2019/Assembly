.text
.globl count

count:
    pushl %ebp          # Save the base pointer
    movl %esp, %ebp     # Set up the stack frame

    movl 12(%ebp), %ecx # Character to count
    movl 8(%ebp), %edx  # Pointer to the string
    movl $0, %eax       # Counter set to 0

loop:
    cmpb $0, (%edx)     # Check for end of string (null terminator)
    je end              # If end of string, exit loop

    cmpb %cl, (%edx)    # Compare character with the current character in the string
    je found            # If a match, increment the counter

    addl $1, %edx       # Move to the next character
    jmp loop

found:
    addl $1, %eax       # Increment the counter
    addl $1, %edx       # Move to the next character
    jmp loop

end:
    leave               # Restore the stack and base pointer
    ret 

