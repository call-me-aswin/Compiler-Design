%{
#include <ctype.h>
#include <stdio.h>
int i;
%}

%%

[a-zA-Z]+ {
    for(i = 0; i <= yyleng - 3; i++) {
        if((yytext[i]=='a') && (yytext[i+1]=='b') && (yytext[i+2]=='c')) {
            yytext[i] = 'A';
            yytext[i+1] = 'B';
            yytext[i+2] = 'C';
        }
    }
    printf("%s", yytext);
}

[\t]+     { printf("%s", yytext); }

\n        { printf("%s", yytext); }

.         { ECHO; }

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}


/*ALGORITHM: REPLACE "abc" WITH "ABC" USING LEX

Step 1: Start the program.

Step 2: Include the required header files:
        #include <stdio.h>
        #include <ctype.h>

Step 3: Declare a global integer variable ‘i’ for looping.

Step 4: Define the Lex rules section as follows:
        a) [a-zA-Z]+ → Match a sequence of alphabets.
           - For each matched word, check every three characters.
           - If the substring is "abc", replace it with "ABC".
           - Print the modified word.
        b) [\t]+ → Print tab spaces as they are.
        c) \n → Print newline to maintain line breaks.
        d) . → Echo any other character as it is.

Step 5: In the main() function:
        - Call the yylex() function to start lexical analysis.
        - Return 0 after processing all input.

Step 6: Define the yywrap() function to return 1,
        indicating the end of input.

Step 7: Stop the program.
*/
