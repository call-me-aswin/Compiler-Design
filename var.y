%{
#include <stdio.h>
#include <stdlib.h>
int yylex(); /* <-- Add this line */
int yyerror(const char *s); /* <-- Add this line */
%}

%token DIGIT ALPHA

%%
var: ALPHA
    | ALPHA DIGIT
    ;
%%

int main(int argc, char* argv[])
{
    printf("Enter the variable name: ");
    yyparse();
    printf("Valid Variable!\n");
    return 0;
}

/* Change this function signature */
int yyerror(const char *s)
{
    (void)s; /* This silences the 'unused variable' warning */
    printf("Invalid Variable!\n");
    /* You could also print the error: printf("Invalid Variable: %s\n", s); */
    return 0; /* Return 0 from yyerror */
}



/*ALGORITHM
------------------------------

ALGORITHM:

1. Start the program.

2. Create the Lex specification file (lex.l)
   a) Include the header file "y.tab.h".
   b) Define patterns for tokens:
        [a-zA-Z][a-zA-Z0-9]*   → return ALPHA
        [0-9]                  → return DIGIT
        .                      → return yytext[0]
        \n                     → return 0
   c) Define yywrap() function to return 1.

3. Create the Yacc specification file (yacc.y)
   a) Include the header files <stdio.h> and <stdlib.h>.
   b) Declare the tokens DIGIT and ALPHA.
   c) Define grammar rules as:
        var : ALPHA
            | ALPHA DIGIT ;
      → This defines that a variable name must start
        with an alphabet and can be followed by digits.

4. Define the main() function:
   a) Display the message "Enter the variable name:".
   b) Call the function yyparse() to begin parsing.
   c) If parsing is successful, print "Valid Variable!".
   d) Otherwise, the error function yyerror() is called.

5. Define yyerror() function:
   a) Display the message "Invalid Variable!" when
      the input does not match the grammar rule.

6. Compile and link the files:
      yacc -d yacc.y
      lex lex.l
      cc lex.yy.c y.tab.c -o output

7. Run the executable file:
      ./output

8. Enter a variable name and observe the result:
      If valid → “Valid Variable!”
      If invalid → “Invalid Variable!”

9. Stop the program.

*/

