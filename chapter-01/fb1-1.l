/* Companion source code for "flex & bison", published by O'Reilly
 * Media, ISBN 978-0-596-15597-1
 * Copyright (c) 2009, Taughannock Networks. All rights reserved.
 * See the README.md file for license conditions and contact info.
 *
 * Original author: John Levine
 */

/* fb1-1 just like unix wc */

/*
   https://stackoverflow.com/q/39075510/1480131
   suppresses the generation of the function
   input & yyunput, otherwise gcc -Wall complains
   about those functions being defined but not used.
*/
%option nounput
%option noinput

%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+    { words++; chars += strlen(yytext); }
\n           { chars++; lines++; }
.            { chars++; }

%%

#include <stdio.h>
#include <string.h>

int main(void)
{
    yylex();
    printf("%8d%8d%8d\n", lines, words, chars);

    return 0;
}
