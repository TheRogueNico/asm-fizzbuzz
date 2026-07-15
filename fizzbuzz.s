section .rodata
	LF	equ 0xA	; newline character

	fizz_msg	db "Fizz", LF
	fizz_len	equ $ - fizz_msg

	buzz_msg	db "Buzz", LF
	buzz_len	equ $ - buzz_msg

	fizzbuzz_msg	db "FizzBuzz", LF
	fizzbuzz_len	equ $ - fizzbuzz_msg

section .bss
	num_buffer	resb 4	; used by num_to_ascii

section .text
	global _start

; write a buffer to stdout
; in: rsi = buffer, rdx = length
; out: none
write_stdout:
	mov	eax, 1	; sys_write
	mov	edi, 1	; stdout
	syscall
	ret

; test if ebx is divisible by ecx
; in: ebx = number to test, ecx = divisor
; out: ZF=1 if divisible, ZF=0 otherwise
is_divisible:
	xor	edx, edx
	mov	eax, ebx
	div	ecx
	test	edx, edx
	ret

; convert ebx to a decimal ASCII string in num_buffer
; in: ebx = number to convert (1-100 for this program)
; out: rsi = pointer to first digit, rdx = length
num_to_ascii:
	mov	eax, ebx
	mov	ecx, 10

	; the string is being built back to front
	lea	rdi, [num_buffer + 3]	; last byte of the buffer
	mov	byte [rdi], LF		; newline goes at the end
	dec	rdi

.digit_loop:
	xor	edx, edx
	div	ecx	; eax = eax/10, edx = eax%10
	add	dl, '0'	; convert to ASCII code
	mov	[rdi], dl
	dec	rdi
	test	eax, eax
	jnz	.digit_loop

	inc	rdi		; undo the overshoot in .digit_loop
	mov	rsi, rdi	; return: pointer to start of text
	lea	rdx, [num_buffer + 4]
	sub	rdx, rdi	; return: length = end - start
	ret

_start:
	; TODO: Replace with the real fizzbuzz loop
	xor	edi, edi
	mov	eax, 60	; sys_exit
	syscall
