/* Companion source code for "flex & bison", published by O'Reilly
 * Media, ISBN 978-0-596-15597-1
 * Copyright (c) 2009, Taughannock Networks. All rights reserved.
 * See the README.md file for license conditions and contact info.
 *
 * Original author: John Levine
 */

/* simplest version of calculator */

%{
#include <stdio.h>

#include "fb1-5.h"

// otherwise gcc8 complains with
// warning: implicit declaration of function ‘yyerror’
void yyerror(const char *s);

%}

/* declare tokens */

%token NUMBER
%token ADD SUB MUL DIV ABS
%token OP CP
%token EOL

%%

calclist: /* nothing, matches at beginning of input */
          | calclist exp EOL { printf("= %d\n> ", $2); } /* EOL is end of an expression */
          | calclist EOL { printf("> "); } /* blank line or a comment */
          ;

exp:      factor   /* default action $$ = $1 */
          | exp ADD factor { $$ = $1 + $3; }
          | exp SUB factor { $$ = $1 - $3; }
          ;

factor:   term
          | factor MUL term { $$ = $1 * $3; }
          | factor DIV term { $$ = $1 / $3; }
          ;

term:     NUMBER
          | ABS term  { $$ = $2 > 0 ? $2 : -$2; }
          | OP exp CP { $$ = $2; }
          ;

%%

int main(void)
{
    printf("> ");
    yyparse();
}

void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
