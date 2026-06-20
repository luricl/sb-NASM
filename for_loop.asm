; Importação de rotinas de I/O via C
%include "asm_io.inc"

; Macros para um FOR mais simples
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
segment .data
    msg_resultado db "O valor final no acumulador EAX e: ", 0

; Segmento de Código
segment .text
global _asm_main

_asm_main:
    enter 0, 0
    pusha

    xor eax, eax        ; acumulador = 0

    for ecx, 0, 10
        add eax, 2
    endfor ecx

    ; Salva o resultado, porque print_string usa EAX
    mov ebx, eax

    mov eax, msg_resultado
    call print_string

    mov eax, ebx
    call print_int
    call print_nl

    popa
    leave
    ret