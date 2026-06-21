# sb-NASM

## Pré-requisitos

Antes de compilar o programa, certifique-se de que os seguintes pacotes estejam instalados:

- NASM (Netwide Assembler)
- Software `ld` para linkagem dos arquivos (Tarefa 1 - Q1)
- GCC com suporte a compilação 32 bits (Tarefa 2 - Q2)


## Como testar (Tarefa 1 - Q1)

**No Linux (usando ld):**
- Compile o código NASM para o formato objeto ELF: `nasm -g -f elf64 <nome_do_arquivo>.asm`
- Faça o link do arquivo: `ld <nome_do_arquivo>.o -o <nome_do_arquivo>`
- Execute o programa: `./<nome_do_arquivo>`

**No Windows (usando NASM + Visual Studio):**
- Certifique-se de ter o **NASM** e o **Visual Studio (com C++ Build Tools)** instalados.
- Abra o **Developer Command Prompt for VS**.
- Compile o código NASM para o formato objeto Win64: `nasm -g -f win64 <nome_do_arquivo>.asm`
- Faça o link do arquivo usando o linker da Microsoft: `link /subsystem:console /entry:_start <nome_do_arquivo>.obj /out:<nome_do_arquivo>.exe`
- Execute o programa: `<nome_do_arquivo>.exe`


## Como testar (Tarefa 2 - Q2)
```bash
cd tarefa-2-q2
make        # monta o .asm, compila o .c e linka tudo em ./prog
make run    # executa
make clean  # apaga os arquivos gerados
```

Por baixo dos panos o `make` faz:
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
