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
%token PC
%%

calclist : /* nada */
    | calclist defvar
    | calclist exp PC EOL { printf("\n=%d\n", $2); }
    | calclist exp PC VAR EOL { printf("\n=%d\n", funcion($2, b)); }
	;
exp :  factor 
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	;
factor :  factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple 
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER 
        | PC 
		;
defvar :  VAR EQ NUMBER EOL { b = $3;printf("\n");}
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int funcion(int num ,int b){
    int vector[100];
    int i=0;
    int res=0;
    while(num>0){
        vector[i]=num%b;
        num=num/b;
        i++;
    }

    for(int j=i; j>=0; j--){
        long aux=1;
        for(int x=j; x>0; x--){
           aux=10*aux;
        }
        
        res+=vector[j]*aux;
    }
    return res;
}
int main() {
  yyparse();
}