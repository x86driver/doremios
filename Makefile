CC = gcc
LD = ld
LDFILE = doremi.ld
OBJCOPY = objcopy

all: image

image: doremi.bin
	dd if=/dev/zero of=a.img bs=512 count=2880
	dd if=doremi.bin of=a.img conv=notrunc

doremi.bin: doremi.elf
	@$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary $< $@

doremi.elf: start.o
	$(LD) start.o -o doremi.elf -T$(LDFILE)

start.o: start.S
	$(CC) -c -o $@ $<

clean:
	rm -rf *.o *.elf *.bin *.img bochsout.txt parport.out
