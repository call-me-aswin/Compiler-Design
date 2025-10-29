%{
#include <stdio.h>
%}

math    [+\-*/^]
eq      [=><]
sp      [,;]

%%
"if"|"else"|"int"|"char"|"double"|"float"   { printf("\n%s\tis a keyword", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                      { printf("\n%s\tis an identifier", yytext); }
[0-9]+                                      { printf("\n%s\tis a constant", yytext); }
{sp}                                        { printf("\n%s\tis a special character", yytext); }
{math}                                      { printf("\n%s\tis an Arithmetic Operator", yytext); }
{eq}                                        { printf("\n%s\tis an Equality Operator", yytext); }
%%

int yywrap()
{
    return 1;
}

int main(int argc, char **argv)
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}



//Output:
//flex lex.l
//gcc lex.yy.c -lfl
//./a.out
