# tiny.s: mp2warmup program

        .globl _start
_start:
	movl $8, %eax   # store 8 in eax
	addl $0x3, %eax # add 3 to eax
	movl %eax, 0x200 # store eax in memory location 0x200
	int $3 	
   	.end
