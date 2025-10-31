%{
#include <stdio.h>
#include <stdlib.h>

int flag = 0;
int yylex();           // ✅ Declaration added
void yyerror(const char *s);  // ✅ Correct declaration
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
ArithmeticExpression:
    E { 
        printf("\nResult = %d\n", $$); 
        return 0; 
    }
    ;

E:
    E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { $$ = $1 / $3; }
  | '(' E ')' { $$ = $2; }
  | NUMBER { $$ = $1; }
  ;
%%

int main()
{
    printf("\nEnter any arithmetic expression:\n");
    yyparse();
    if(flag == 0)
        printf("\nEntered arithmetic expression is valid\n\n");
    return 0;
}

void yyerror(const char *s)
{
    printf("\nEntered arithmetic expression is invalid\n\n");
    flag = 1;
}



/* Algorithm: Arithmetic Expression Validator and Calculator

Steps:

1. Start the program.

2. In the Lex file (calculator.l):
   a. Define header files and include “y.tab.h”.
   b. Declare yylval as an external integer variable.
   c. Write regular expressions to identify:
      - Numbers ([0-9]+)
      - Spaces and tabs (to ignore)
      - Newline (to end input)
      - Any other symbol (to return as it is)
   d. Convert recognized numbers to integer using atoi() and return
      the token NUMBER to YACC.
   e. Define yywrap() to return 1.

3. In the Yacc file (calculator.y):
   a. Include necessary header files and declare flag variable.
   b. Declare the functions yylex() and yyerror().
   c. Define tokens and precedence rules for operators (+, -, *, /).
   d. Write grammar rules for arithmetic expressions as:
        ArithmeticExpression → E
        E → E + E | E - E | E * E | E / E | (E) | NUMBER
   e. For each rule, compute the result using $$ = $1 + $3, etc.

4. In the main() function:
   a. Display a message to enter an arithmetic expression.
   b. Call yyparse() to start parsing.
   c. If flag = 0, print “Entered arithmetic expression is valid”
      and display the result.
   d. If yyerror() is called, print “Entered arithmetic expression is invalid”
      and set flag = 1.

5. The yyerror() function displays an error message when
   the expression does not match the grammar.

6. Stop the program.
*/
