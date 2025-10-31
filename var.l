%{
#include "y.tab.h"
%}

%%
[a-zA-Z]               return ALPHA; /* <-- Changed: Match only one letter */
[0-9]                  return DIGIT;
.                      return yytext[0];
\n                     return 0;
%%

int yywrap()
{
    return 1;
}
