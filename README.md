# asm-fizzbuzz

Classic FizzBuzz program written in NASM, 64‑bit Linux.

## Usage

After cloning the repository, assemble _fizzbuzz.s_ with `nasm` and link it
with `ld`:

```sh
nasm -f elf64 -o fizzbuzz.o fizzbuzz.s
ld -o fizzbuzz fizzbuzz.o
```

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
