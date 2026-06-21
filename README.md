# sb-NASM

## Pré-requisitos

Antes de compilar o programa, certifique-se de que os seguintes pacotes estejam instalados:

- NASM (Netwide Assembler)
- Software ld para linkagem dos arquivos

## Como testar (Linux)

- Compile o código NASM para o formato objeto ELF: `nasm -g -f elf64 <nome_do_arquivo>.asm`
- Faça o link do arquivo: `ld <nome_do_arquivo>.o -o <nome_do_arquivo>`
- Execute o programa: `./<nome_do_arquivo>`

## Como testar (Windows)

- Certifique-se de ter o **NASM** e o **Visual Studio (com C++ Build Tools)** instalados.
- Abra o **Developer Command Prompt for VS**.
- Compile o código NASM para o formato objeto Win64: `nasm -g -f win64 <nome_do_arquivo>.asm`
- Faça o link do arquivo usando o linker da Microsoft: `link /subsystem:console /entry:_start <nome_do_arquivo>.obj /out:<nome_do_arquivo>.exe`
- Execute o programa: `<nome_do_arquivo>.exe`
