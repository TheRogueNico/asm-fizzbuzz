section .data
	fizz_msg db "Fizz", 10
	buzz_msg db "Buzz", 10
	fizzbuzz_msg db "FizzBuzz", 10
	nope db "No FizzBuzz", 10

section .text
	global _start

_start:
	mov	rbx, 1	; loop counter

loop:
	cmp	rbx, 100	; loop condition
	jg	end

	mov 	rax, rbx
	mov	rcx, 15
	mov	rdx, 0
	div	rcx
	cmp	rdx, 0
	je	fizzbuzz	

	mov 	rax, rbx
	mov	rcx, 3
	mov	rdx, 0
	div	rcx
	cmp	rdx, 0
	je	fizz


	mov 	rax, rbx
	mov	rcx, 5
	mov	rdx, 0
	div	rcx
	cmp	rdx, 0
	je	buzz

	jmp	nofizzbuzz

fizz:
	mov	rdx, 5
	mov	rsi, fizz_msg
	mov	rdi, 1
	mov	rax, 1
	syscall		

	inc	rbx
	jmp	loop

buzz:
	mov	rdx, 5
	mov	rsi, buzz_msg
	mov	rdi, 1
	mov	rax, 1
	syscall		

	inc	rbx
	jmp	loop

fizzbuzz:
	mov	rdx, 9
	mov	rsi, fizzbuzz_msg
	mov	rdi, 1
	mov	rax, 1
	syscall		

	inc	rbx
	jmp	loop

nofizzbuzz:
	mov	rax, rbx
	mov	rcx, 10
	mov	r8d, 0	; number of digits
	push	10	; newline

to_ascii:
	mov	edx, 0
	div	rcx

	add	dl, '0'
	dec	rsp
	mov	[rsp], dl
	inc	r8

	cmp	rax, 0
	jne	to_ascii

	inc	r8 	; to include newline

	mov	rax, 1
	mov	rdi, 1
	mov	rsi, rsp
	mov	rdx, r8
	syscall

	inc	rbx
	jmp	loop

end:
	mov	rdi, 0
	mov	rax, 60
	syscall
