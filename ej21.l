/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion  */
%{
#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
"=" {return(EQ);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
"b"  {return(VAR);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
