# asm-fizzbuzz

A FizzBuzz implementation in x86-64 assembly, NASM syntax, for Linux.

Prints the numbers 1 to 100, replacing multiples of 3 with Fizz, multiples of 5 with Buzz, and multiples of both with FizzBuzz.

## Usage

After cloning the repository, assemble _fizzbuzz.s_ with `nasm` and link it
with `ld`:

```sh
nasm -f elf64 -o fizzbuzz.o fizzbuzz.s
ld -o fizzbuzz fizzbuzz.o
```

Or use `make`.

Now, running `./fizzbuzz` should run the FizzBuzz program for the first 100
numbers. Here is the output:

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16

...

98
Fizz
Buzz
```

## Notes

This project is for educational purposes. Although the FizzBuzz implementation can be optimized to use fewer `div` operations, or no `div` operation at all, it is not the objective of this project, and therefore it uses the default approach for the FizzBuzz program.
