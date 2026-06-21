#include <stdio.h>

extern int hipotenusa(int a, int b);

int main(void)
{
    int a, b;

    printf("[C] Digite o cateto A: ");
    if (scanf("%d", &a) != 1) {printf("[C] Entrada inválida.\n"); return 1; }    

    printf("[C] Digite o cateto B: ");
    if (scanf("%d", &b) != 1) {printf("[C] Entrada inválida.\n"); return 1; }


    int h = hipotenusa(a, b);

    printf("[C] retorno (inteiro arredondado): %d\n", h);
    return 0;
}