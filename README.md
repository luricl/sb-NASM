# sb-NASM

## Pré-requisitos

Antes de compilar o programa, certifique-se de que os seguintes pacotes estejam instalados:

- NASM (Netwide Assembler)
- GCC com suporte a compilação 32 bits
- Arquivos da biblioteca `asm_io` (`asm_io.inc` e `asm_io.asm`)


## Como testar (Tarefa 1 - Q1)

**No Linux (usando GCC):**
- Compile o código NASM para o formato objeto ELF: `nasm -f elf32 for_loop.asm`
- Monte a biblioteca `asm_io`: `nasm -f elf32 -d ELF_TYPE asm_io.asm`
- Ligue os objetos compilando o driver junto com a ajuda do GCC: `gcc -m32 for_loop.o asm_io.o -o for_loop`
- Execute o programa: `./for_loop`

**No Windows (usando GCC / MinGW):**
- Compile o código NASM para o formato objeto Win32: `nasm -f win32 for_loop.asm`
- Ligue os objetos usando o GCC: `gcc -o for_loop for_loop.obj asm_io.obj`
- Execute o programa: `for_loop.exe`


## Como testar (Tarefa 2 - Q2)
```bash
cd tarefa-2-q2
make        # monta o .asm, compila o .c e linka tudo em ./prog
make run    # executa
make clean  # apaga os arquivos gerados
```

Por baixo dos panoss o `make` faz:
```bash
nasm -f elf32 rotina.asm -o rotina.o # monta o Assembly em código-objeto 32 bits
gcc -m32 -no-pie driver.c rotina.o -o prog # compila o C e linka com o Assembly
```

Exemplo de uso:
```bash
make run
[C] Digite o cateto A: 2
[C] Digite o cateto B: 4
[ASM] hipotenusa de 2 e 4 = 4.4721
[C] retorno (inteiro arredondado): 4
```

