%{
#include <stdio.h>
#include <string.h>

int wc = 0, lc = 0, ch = 0, sc = 0;
%}

%%
\n          { lc++; }               /* Count number of lines */
[ ]         { sc++; }               /* Count number of spaces */
[^\t\n ]    { ch++; }               /* Count number of characters (non-space, non-tab, non-newline) */
%%

int main()
{
    printf("Enter the program:\n");
    yylex();

    printf("\nNumber of lines      = %d", lc);
    printf("\nNumber of characters = %d", ch);
    printf("\nNumber of spaces     = %d", sc);
    printf("\nApprox number of words = %d\n", sc + lc);

    return 0;
}

int yywrap()
{
    return 1;
}


/*ALGORITHM:

1. START

2. Include necessary header files:
   - #include <stdio.h>
   - #include <string.h>

3. Declare and initialize variables:
   - lc = 0  → to count lines
   - ch = 0  → to count characters
   - sc = 0  → to count spaces

4. Define lexical rules:
   a) For each newline character '\n', increment line counter (lc++).
   b) For each space character ' ', increment space counter (sc++).
   c) For each non-space, non-tab, non-newline character ([^\t\n ]), increment character counter (ch++).

5. In the main() function:
   a) Display message "Enter the program".
   b) Call the function yylex() to start lexical analysis.
   c) After scanning, display:
      - Total number of lines.
      - Total number of characters.
      - Total number of spaces.
      - Approximate number of words as (lc + sc).

6. Define yywrap() function to return 1, indicating the end of input.

7. STOP
*/

