%{
#include <stdio.h>
#include <stdlib.h>

// --- FIX 1: Add these two function prototypes ---
int yylex(void);
int yyerror(const char *s);
// ----------------------------------------------

%}

%token ID NUMBER
%left '+' '-'
%left '*' '/'

%%

expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | ID
    | NUMBER
    ;

%%

int main()
{
    printf("\nEnter an expression: ");
    yyparse();
    printf("\nValid Expression\n");
    return 0;
}

// --- FIX 2: Change the function signature to accept a string ---
int yyerror(const char *s)
{
    printf("\nInvalid Expression: %s\n", s); // You can now print the specific error
    exit(0);
}


/*ALGORITHM: VALID EXPRESSION CHECKER USING LEX AND YACC

Step 1: Start the program.

Step 2: Design the LEX program (expr.l) to identify the tokens.
        • Define token patterns for identifiers, numbers, and operators.
        • Example:
            - [a-zA-Z]+ → ID
            - [0-9]+     → NUMBER
            - '+' , '-' , '*' , '/' , '(' , ')' → as individual characters.
        • Ignore spaces and tabs.

Step 3: Define yywrap() function to return 1, indicating the end of input.

Step 4: Design the YACC program (expr.y) for grammar validation.
        • Declare required header files and token definitions.
        • Specify precedence of operators using %left for '+' '-' and '*' '/'.
        • Define grammar rules for a valid arithmetic expression as:
              expr → expr + expr
                   | expr - expr
                   | expr * expr
                   | expr / expr
                   | ( expr )
                   | ID
                   | NUMBER
        • Define start symbol as “input” that calls the rule expr.

Step 5: In the action part of YACC,
        • Print “Valid Expression” if parsing succeeds.
        • Print “Invalid Expression” if parsing fails (inside yyerror()).

Step 6: In the main() function, prompt the user to enter an expression,
        then call yyparse() to begin parsing.

Step 7: Save both files:
        • expr.l  → for lexical analysis.
        • expr.y  → for syntax analysis.

Step 8: Compile and execute the program using the following commands:
        yacc -d expr.y
        lex expr.l
        cc lex.yy.c y.tab.c -o expr_check
        ./expr_check

Step 9: Test the program with different inputs:
        Example:
            Input: a+b*(c-5)
            Output: Valid Expression

            Input: a+*b
            Output: Invalid Expression

Step 10: Stop the program.
*/
