#include <stdio.h>
#include <string.h>


char result[20][20], copy[3], states[20][20];


void add_state(char a[3], int i) {
    strcpy(result[i], a);
}


void display(int n) {
    int k;
    printf("Epsilon closure of %s = { ", copy);
    for (k = 0; k < n; k++)
        printf("%s ", result[k]);
    printf("}\n\n");
}

int main() {
    FILE *input;
    input = fopen("input.dat", "r");  

    int n, i, k, end;
    char state[3], state1[3], state2[3], symbol[3];

   
    printf("Enter number of states: ");
    scanf("%d", &n);

    
    printf("Enter the states:\n");
    for (k = 0; k < n; k++)
        scanf("%s", states[k]);

   
    for (k = 0; k < n; k++) {
        i = 0;
        strcpy(state, states[k]);
        strcpy(copy, state);

        add_state(state, i++);

        while (1) {
            end = fscanf(input, "%s%s%s", state1, symbol, state2);
            if (end == EOF) break;

            if (strcmp(state, state1) == 0 && strcmp(symbol, "e") == 0) {
                add_state(state2, i++);
                strcpy(state, state2);
            }
        }

        display(i);
        rewind(input); 
    }

    fclose(input);
    return 0;
}

