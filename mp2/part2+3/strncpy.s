.text
.globl mystrncpy


#   %edi: Destination string pointer
#   %esi: Source string pointer
#   %edx: Number of characters to copy
# Returns:
#   Pointer to the destination string
mystrncpy:
    # Save the necessary registers on the stack
    push %edi
    push %esi
    push %edx

    # Initialize the counter to zero
    xor %ecx, %ecx

copy_loop:
    # Check if we've copied n characters or reached the end of the source string
    cmp %ecx, %edx
    je copy_done

    # Load the current character from the source string
    movb (%esi, %ecx), %al

    # Store the character in the destination string
    movb %al, (%edi, %ecx)

    # Increment the counter
    inc %ecx

    # Check if we've reached the end of the source string
    test %al, %al
    jz copy_done

    # Continue copying
    jmp copy_loop

copy_done:
    # Restore the stack frame and return
    pop %edx
    pop %esi
    pop %edi

    # Null-terminate the destination string
    movb $0, (%edi, %ecx)

    ret
