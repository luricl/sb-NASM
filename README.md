# sb-NASM

## Pré-requisitos

Antes de compilar o programa, certifique-se de que os seguintes pacotes estejam instalados:

- NASM (Netwide Assembler)
- GCC com suporte a compilação 32 bits
- Arquivos da biblioteca `asm_io` (`asm_io.inc` e `asm_io.asm`)


## Como testar

**No Linux (usando GCC):**
- Compile o código NASM para o formato objeto ELF: `nasm -f elf32 for_loop.asm`
- Monte a biblioteca `asm_io`: `nasm -f elf32 -d ELF_TYPE asm_io.asm`
- Ligue os objetos compilando o driver junto com a ajuda do GCC: `gcc -m32 for_loop.o asm_io.o -o for_loop`
- Execute o programa: `./for_loop`

**No Windows (usando GCC / MinGW):**
- Compile o código NASM para o formato objeto Win32: `nasm -f win32 for_loop.asm`
- Ligue os objetos usando o GCC: `gcc -o for_loop for_loop.obj asm_io.obj`
- Execute o programa: `for_loop.exe`