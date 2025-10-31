%{
#include <stdio.h>

int v = 0;
int c = 0;
%}

%%

[aeiouAEIOU]   { v++; }
[a-zA-Z]       { c++; }

%%

int main()
{
    printf("Enter the string of vowels and consonants:\n");
    yylex();
    printf("Number of vowels are: %d\n", v);
    printf("Number of consonants are: %d\n", c - v);
    return 0;
}

int yywrap()
{
    return 1;
}

/* ALGORITHM: Count Number of Vowels and Consonants Using LEX

Step 1: Start

Step 2: Include the required header file <stdio.h> inside the declaration section.

Step 3: Declare two integer variables v and c and initialize them to zero.
         v → counts vowels
         c → counts total alphabets

Step 4: In the rules section, define patterns as follows:
        [aeiouAEIOU]   { v++; }         → to count vowels
        [a-zA-Z]       { c++; }         → to count all alphabets
        .|\n           { /* ignore other characters */ /*}

Step 5: In the main() function:
        - Print "Enter the string of vowels and consonants"
        - Call yylex() to start lexical analysis
        - After scanning input, print:
              Number of vowels = v
              Number of consonants = c - v

Step 6: Define the yywrap() function that returns 1 to indicate end of input.

Step 7: Stop
*/ 
