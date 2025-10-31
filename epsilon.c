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


/*ALGORITHM: Epsilon Closure of NFA

Step 1:  Start

Step 2:  Open the file "input.dat" in read mode.
          // The file contains transitions in the form:
          // state1   symbol   state2

Step 3:  Read the total number of states ‘n’ from the user.

Step 4:  Read all the state names and store them in the array ‘states’.

Step 5:  For each state in ‘states’, perform the following steps:

          a) Initialize i = 0
          b) Copy the current state into variables ‘state’ and ‘copy’.
          c) Add this state itself into the ‘result’ array 
             (because a state is always included in its own epsilon closure).

Step 6:  Repeat until the end of the file is reached:
          
          a) Read one transition (state1, input, state2) from the file.
          b) If end of file (EOF) is reached, exit the loop.
          c) If (state == state1) and (input == "e") then
                 Add state2 to the ‘result’ array.
                 Copy state2 into variable ‘state’.
             End If

Step 7:  Display all the states stored in the ‘result’ array 
          as the epsilon closure of the state ‘copy’.

Step 8:  Rewind the file pointer to the beginning of the file 
          so that transitions can be checked again for the next state.

Step 9:  Repeat Steps 5 to 8 for all the states.

Step 10: Close the file.

Step 11: Stop
*/

