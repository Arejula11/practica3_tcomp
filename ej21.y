/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion   */
%{
#include <stdio.h>
int b;
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token VAR EQ
%%

calclist : /* nada */
	| calclist defvar
	| calclist exp EOL { printf("=%d\n", $2); }
	;
exp : 	factor 
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	;
factor :  factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple 
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER VAR { $$ = funcion($1, b);}
        | NUMBER
		;
defvar :  VAR EQ NUMBER EOL { b = $3;}
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int funcion(int num, int b){
	int vector[100];
	int i=0;
	int res=0;
	int aux=1;
	while(num>0){
		res+=num%10*aux;
		num/=10;
		aux*=b;
		i++;
	}
	return res;
}

int main() {
  yyparse();
}