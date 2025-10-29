#include <stdio.h>
#include <string.h>

int main() {
    char code[10][30], temp[20], op[10];
    int i = 0;

    printf("Enter intermediate code (type 'exit' to stop):\n");

    
    do {
        scanf("%s", code[i]);
    } while (strcmp(code[i++], "exit") != 0);

    printf("\nTarget Code Generation\n");
    printf("-----------------------------\n");
    i = 0;

    
    do {
        strcpy(temp, code[i]);

        
        switch (temp[3]) {
            case '+': strcpy(op, "ADD"); break;
            case '-': strcpy(op, "SUB"); break;
            case '*': strcpy(op, "MUL"); break;
            case '/': strcpy(op, "DIV"); break;
        }

        
        printf("\nMOV %c, R%d", temp[2], i);
        printf("\n%s %c, R%d", op, temp[4], i);
        printf("\nMOV R%d, %c\n", i, temp[0]);

    } while (strcmp(code[++i], "exit") != 0);

    return 0;
}

