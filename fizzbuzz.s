section .rodata
	LF	equ 0xA	; newline character

	fizz_msg	db "Fizz", LF
	fizz_len	equ $ - fizz_msg

	buzz_msg	db "Buzz", LF
	buzz_len	equ $ - buzz_msg

	fizzbuzz_msg	db "FizzBuzz", LF
	fizzbuzz_len	equ $ - fizzbuzz_msg

section .text
	global _start

write_stdout:
	mov	eax, 1	; sys_write
	mov	edi, 1	; stdout
	syscall
	ret

; TODO: Add documentation
is_divisible:
	xor	edx, edx
	mov	eax, ebx
	div	ecx
	test	edx, edx
	ret

_start:
	; TODO: Replace with the real fizzbuzz loop
	xor	edi, edi
	mov	eax, 60	; sys_exit
	syscall
