/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion  */
%{
#include "y.tab.h"
%}
%%
"x"  {return(x);}
"y"  {return(y);}
"z"  {return(z);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
