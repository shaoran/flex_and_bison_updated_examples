/* Companion source code for "flex & bison", published by O'Reilly
 * Media, ISBN 978-0-596-15597-1
 * Copyright (c) 2009, Taughannock Networks. All rights reserved.
 * See the README.md file for license conditions and contact info.
 *
 * Original author: John Levine
 */

/* English -> American */

/*
   https://stackoverflow.com/q/39075510/1480131
   suppresses the generation of the function
   input & yyunput, otherwise gcc -Wall complains
   about those functions being defined but not used.
*/
%option nounput
%option noinput

%%

"colour"     { printf("color"); }
"flavour"    { printf("flavor"); }
"clever"     { printf("smart"); }
"smart"      { printf("elegant"); }
"liberal"    { printf("conservative"); }
.            { printf("%s", yytext); }

%%

int main(void)
{
    yylex();
    return 0;
}

int yywrap(void)
{
    return 1;
}
