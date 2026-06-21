extern printf       ; stdio.h
extern sqrt         ; math.h

global hipotenusa

; 10 é o código ASCII para \n e 0 é \0 (toda string em c termina com \0)
section .data
fmt:        db "[ASM] hipotenusa de %d e %d = %.4f", 10, 0


section .bss ; área de dados sem valor inicial
soma:       resd 1      ; a² + b² (int)
res:        resq 1      ; resultado de sqrt (double = 8 bytes)

section .text
; int hipotenusa(int a, int b);
;   a -> [ebp + 8]
;   b -> [ebp + 12]
;   retorno -> hipotenusa arredondado para inteiro (int)

hipotenusa:
    ; Prologo - Cria o frame na pilha
    push ebp ; salva o ebp de quem chamou
    mov ebp, esp ; faz ebp apontar para a base do novo frame

    ; Nesse momento a pilha está assim:
    ; [ebp] = ebp antigo (push ebp colocou aqui)
    ; [epb + 4] = endereço de retoro (o call colocou aqui)
    ; [ebp + 8] = a (o parametro que o C passou)
    ; [ebp + 12] = b (o parametro que o C passou)

    ; Calcular a² + b²
    mov     eax, [ebp + 8]  ; eax = a
    imul    eax, eax        ; eax = a * a
    mov     ecx, [ebp + 12] ; ecx = b
    imul    ecx, ecx        ; ecx = b * b
    add     eax, ecx        ; eax = a² + b²
    mov     [soma], eax     ; guarda na memória


    ; math.h -> res = sqrt((double) soma)
    fild    dword [soma]    ; ST0 = (double) soma (converte int -> double na FPU)
    sub     esp, 8          ; abre 8 bytes (tamanho do double)
    fstp    qword [esp]     ; Copia o ST0 para dentro do espaço de 8 bytes que abrimos e remove da FPU
    call    sqrt
    add     esp, 8          ; Limpa o argumento; o resultado volta para ST0
    fstp    qword [res]     ; guarda o resultado e esvazia a FPU

    ; stdio.h -> printf(fmt, a, b, res)
    ; ordem inversa: res (double, 8 bytes), depois b, depois a, depois fmt
    sub     esp, 8              ; abre 8 bytes
    fld     qword [res]         ; recarrega o resultado para ST0
    fstp    qword [esp]         ; Copia o ST0 para dentro do espaço de 8 bytes que abrimos e remove da FPU
    push    dword [ebp + 12]    ; b
    push    dword [ebp + 8]     ; a
    push    fmt
    call    printf
    add     esp,  20            ; 8 (double) + 4 + 4 + 4 = 20

    ; retorno -> arredonda o double para inteiro, em EAX
    fld     qword [res] 
    fistp   dword [soma]    ; converte ST0 -> int (arredodado) e guarda
    mov     eax, [soma]     ; valor de retorno em eax

    ; Epilogo
    mov     esp, ebp
    pop     ebp
    ret                 ; Volta pro programa C


; Instruções:
; fild - float load integer: le um inteiro da memória e empilha como double na FPU
; fld  - float load: le um double da memória e empilha na FPU
; fstp - float store and pop: grava o topo da FPU na memória e remove da FPU
; fistp - float store integer and pop: converte o topo da FPU para inteiro, grava e remove