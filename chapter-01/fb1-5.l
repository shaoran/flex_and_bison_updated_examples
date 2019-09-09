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
#include "fb1-5.tab.h"
%}

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
"("     { return OP; }
")"     { return CP; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
"//".*
[ \t]   { /* ignore whitespaces and comments starting with // */ }
.       { printf("Mystery character %c\n", *yytext); }

%%
