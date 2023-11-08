# Assembly
Machine Projects

# Mp1 objective: 
  It's a tiny single user terminal monitor system with the following commands:
  
  **md <hexaddress>**
  Memory Display
  Display contents (in hex) of 16 bytes at the specified address.
  (16 pairs of hex characters followed by 16 characters interpreting each byte as a printable character for ASCII codes 
  0x20 through 0x7e or a fixed ‘.’ for all other (non-printable) ASCII codes values.)
  
  **ms <hexaddress> <new_val>**
  Memory Set
  Stores byte new_val (two hex characters) at specified address.
  
  **h <cmd>**
  Help
  Help on the specified command, for ex., "h ps", or all commands if no argument.
  
  **s**
  Stop
  Stop running your tutor and return to the regular SAPC TUTOR (or back to the shell if
  running on LINUX). 
  
# Mp2 objective: 
   **part1:**
    A C callable assembler function that counts the number of characters in a string, the C calling program (countc.c) calls the count function to count
    the number of times a user-entered character appeared in a user-entered string and prints the result.
    
  **part2:**
     A C calling program (printbinc.c) that calls printbin.s. The C caller for this program provides a char to the assembly function printbin. 
     It asks the user for a hex number between 0 and 0xff, converts the input from an ASCII string to a char value, passes it to printbin as an 
     argument, and displays the returned string which should be the ASCII characters for the binary value, e.g. for entry of the hex value 0x3d, 
     you will get the printout: “The binary format for character = is 0011 1101”
     
  **part3:**
    A C-callable assembler version of the library strncpy function called mystrncpy that copies the contents of one string to a user provided array
    and returns a pointer to the provided array.
  
  
