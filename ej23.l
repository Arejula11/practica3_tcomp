/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion  */
%{
#include "y.tab.h"
%}
%%
"+"	{printf("%s",yytext);return(ADD);}
"-"	{printf("%s",yytext);return(SUB);}
"*"	{printf("%s",yytext);return(MUL);}
"/"	printf("%s",yytext);{return(DIV);}
"("	{printf("%s",yytext);return(OP);}
")"	{printf("%s",yytext);return(CP);}
"=" {printf("%s",yytext);return(EQ);}
":" {printf("%s",yytext);return(PP);}
[0-9]+	{printf("%s",yytext);yylval = atoi(yytext); return(NUMBER);}
[a-z]+  {printf("%s",yytext);return(VAR);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
