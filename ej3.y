/* Pablo Angusto Delgado 842255 y Miguel Aréjula Aísa 850068 */
%{
#include <stdio.h>
%}
%token x y z EOL
%start S
%%

S :  
    | C x S
    ;
B :  x C y
    | x C
    ;
C :  x B x
    | z
    ;

%%
int yyerror(char* s) {
   printf("%s\n", s);
   return 0;
}

int main() {
  yyparse();
}