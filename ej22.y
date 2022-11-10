/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion   */
%{
#include <stdio.h>
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token VAR EQ
%token PC
%%

calclist : /* nada */
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
		| defvar exp PC VAR { $$ = funcion($2, $1);}
        | NUMBER 
		;
defvar :  VAR EQ NUMBER EOL { $$ = $3;}
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int funcion(int num, int b){
    printf("%d\n", num);
    printf("%d\n", b);
    int vector[100];
    int i=0;
    int res=0;
    while(num>0){
        vector[i]=num%b;
        printf("%d\n", vector[i]);
        num=num/b;
        i++;
    }
    for(int j=i; j>=0; j--){
        int aux=1;
        for(int x=j; x>0; x--){
            aux=10*aux;
        }
        res+=vector[j]*aux;
    }
    printf("%d\n", res);
    return res;
}
int main() {
  yyparse();
}