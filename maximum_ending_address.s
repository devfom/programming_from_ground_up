# %edi - index
# %ebx - largest so far
# %eax - current item
.section .data
data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66
data_end:

.section .text
.globl _start
_start:
	movl $0, %edi
	movl data_items(, %edi, 4), %eax
	movl %eax, %ebx

	start_loop:
		incl %edi
		# Check if we reached the end
		imul $4, %edi, %eax
		addl $data_items, %eax
		cmpl $data_end, %eax
			je loop_exit

		movl data_items(, %edi, 4), %eax
		cmpl %ebx, %eax
			jle start_loop
		movl %eax, %ebx
		jmp start_loop

	loop_exit:
		movl $1, %eax
		int $0x80
