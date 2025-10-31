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


/*ALGORITHM: TARGET CODE GENERATION FROM INTERMEDIATE CODE
--------------------------------------------------------

Step 1: Start

Step 2: Declare the following variables:
        - icode[10][30] to store intermediate code lines
        - str[20] to store each statement temporarily
        - opr[10] to store the operation name
        - integer variable i = 0

Step 3: Display message 
        "Enter the set of intermediate code (terminated by exit):"

Step 4: Repeat
            Read each intermediate code statement into icode[i]
        Until the input statement equals "exit"

Step 5: Display message 
        "TARGET CODE GENERATION"
        and print a separator line for clarity

Step 6: Set i = 0

Step 7: Repeat for each intermediate code statement until "exit" is found

        1. Copy icode[i] into str
        2. Identify the operator using str[3]
           If str[3] == '+' then opr = "ADD"
           If str[3] == '-' then opr = "SUB"
           If str[3] == '*' then opr = "MUL"
           If str[3] == '/' then opr = "DIV"

        3. Generate the target code as follows:
           MOV str[2], R<i>
           opr str[4], R<i>
           MOV R<i>, str[0]

        4. Increment i by 1

Step 8: Until icode[i] equals "exit"

Step 9: Stop
*/
