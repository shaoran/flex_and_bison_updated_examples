/* Companion source code for "flex & bison", published by O'Reilly
 * Media, ISBN 978-0-596-15597-1
 * Copyright (c) 2009, Taughannock Networks. All rights reserved.
 * See the README.md file for license conditions and contact info.
 *
 * Original author: John Levine
 */

/* recognize tokens for the calculator and print them out */

/*
   https://stackoverflow.com/q/39075510/1480131
   suppresses the generation of the function
   input & yyunput, otherwise gcc -Wall complains
   about those functions being defined but not used.
*/
%option nounput
%option noinput

%{
    enum yytokentype {
        NUMBER = 258,
        ADD    = 259,
        SUB    = 260,
        MUL    = 261,
        DIV    = 262,
        ABS    = 263,
        EOL    = 264,  // end-of-line
    };

    int yylval;
%}

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { /* ignore whitespaces */ }
.       { printf("Mystery character %c\n", *yytext); }

%%

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int tok;

    while((tok = yylex())) {
        printf("%d", tok);
        if(tok == NUMBER)
            printf(" = %d\n", yylval);
        else
            printf("\n");
    }

    return 0;
}
