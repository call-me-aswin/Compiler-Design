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


/* 

Step 1: Start the program.

Step 2: Include the header file <stdio.h> to perform
        input and output operations.

Step 3: Define regular expressions for different tokens.
        Example:
            math → [+\-*///^]
            eq   → [=><]
            sp   → [,;]  

/*Step 4: Write the token matching rules between the %% sections.
        For each pattern, define an action using printf().

        Example:
            "if"|"else"|"int"|"char"|"double"|"float"
                → print keyword message.

            [a-zA-Z_][a-zA-Z0-9_]*
                → print identifier message.

            [0-9]+
                → print constant message.

            {math}
                → print arithmetic operator message.

            {eq}
                → print equality operator message.

            {sp}
                → print special character message.

Step 5: Define the function yywrap() to return 1
        indicating the end of input.

Step 6: In the main() function:
        - Open the input file using fopen().
        - Call the function yylex() to start lexical analysis.
        - Close the file using fclose().

Step 7: Compile and execute the program using the commands:
        lex filename.l
        gcc lex.yy.c -o output
        ./output input.txt

Step 8: The program will analyze each token and display
        its type such as:
        keyword, identifier, constant,
        arithmetic operator, equality operator, or special character.

Step 9: Stop the program.
*/
