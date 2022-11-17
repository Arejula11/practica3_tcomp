/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion   */
%{
#include <stdio.h>
int acum;
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token VAR EQ PP
%%

calclist : /* nada */
    | calclist exp EOL { printf("\n=%d\n", $2); }
	| calclist defvar 
	| calclist EOL 
    
	;
exp : factor
	| exp SUB factor { $$ = $1 - $3; }	
    | exp ADD factor { $$ = $1 + $3;}
	;
factor :  factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple 
		;
factorsimple : 	OP exp CP { $$ = $2; } 
        | NUMBER
		| VAR { $$ = acum;}
		;
defvar :  VAR PP EQ exp EOL{ acum = $4;printf("\n");}
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}