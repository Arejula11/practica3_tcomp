/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion   */
%{
#include <stdio.h>
%}
%token x y z EOL
%start S
%%

S :  C x S
    |
    ;
B :  x C y
    | x C
    ;
C :  x B x
    | z
    ;

%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}

int main() {
  yyparse();
}