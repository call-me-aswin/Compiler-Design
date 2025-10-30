%{
#include "y.tab.h"
%}

%%

[a-zA-Z]+      { return ID;
}
[0-9]+         { return NUMBER;
}
[ \t]+         { /* ignore spaces and tabs only */ }
\n             { return 0; /* <-- ADD THIS LINE: Signals end of input */ }
.              { return yytext[0];
}

%%

int yywrap(void) { return 1; }

//output:yacc -d expr.y
//       lex expr.l
//       cc lex.yy.c y.tab.c
//       ./a.out
