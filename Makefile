TARGET  = fizzbuzz
DEBUG   = $(TARGET)_debug

.PHONY: debug run clean

$(TARGET): fizzbuzz.s
	nasm -f elf64 fizzbuzz.s -o $(TARGET).o
	ld $(TARGET).o -o $(TARGET)

debug: fizzbuzz.s
	nasm -f elf64 -g -F dwarf fizzbuzz.s -o $(DEBUG).o
	ld $(DEBUG).o -o $(DEBUG)

run:
	./$(TARGET)

clean:
	rm -f $(TARGET).o $(TARGET) $(DEBUG).o $(DEBUG)
