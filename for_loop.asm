; Macros para um FOR
%macro for 3
    %push for
    mov %1, %2          ; inicialização
%$inicio:
    cmp %1, %3          ; condição
    jge %$fim
%endmacro

%macro endfor 1
    inc %1              ; passo
    jmp %$inicio
%$fim:
    %pop
%endmacro

; Segmento de Dados
section .data
    digit: db 0, 10             ; primeiro byte (0) placeholder
                                ; segundo byte (10) representando newline

; Segmento de Código
section .text
global _start

_start:
    mov ebx, 0
    mov ecx, 0

    for ecx, 0, 5
        add ebx, 1
    endfor ecx

    mov eax, ebx
    add eax, 48                     ; converte para ascii
    mov [digit], al                 ; guarda caracteres ascii na variável digit
    mov rax, 1                      ; seleciona a função write
    mov rdi, 1                      ; define o file descriptor para stdout
    mov rsi, digit                  ; assinala o endereço da variável a ser impressa
    mov rdx, 2                      ; diz quantos bytes devem ser impressos
    syscall

    mov rax, 60                     ; syscall exit
    mov rdi, 0                      ; exit 0 
    syscall