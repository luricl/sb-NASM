CC	= gcc # Compilador C

# -m32: gera código de 32 bits
# -nopie: usa endereços absolutos
# -Wall: compilador mostra avisos úteis 
CFLAGS = -m32 -no-pie -Wall

NASM = nasm
NASMFLAGS = -f elf32 # gera arquivo objeto no formato ELF 32 bits


# No make, a sintaxe básica de um alvo é:
# alvo: dependencia1 dependencia2
#	comando

all: prog #alvo padrão

rotina.o: rotina.asm
	$(NASM) $(NASMFLAGS) rotina.asm -o rotina.o

prog: driver.c rotina.o
	$(CC) $(CFLAGS) driver.c rotina.o -o prog -lm

run: prog
	./prog

clean:
	rm -f rotina.o prog
