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
