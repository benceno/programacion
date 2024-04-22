/*
  fichero instrucciones.l
*/
%{
    #include <stdio.h>
    #include "y.tab.h" /* Generado automaticamente por bison*/
%}
separador ([\t""])+
letra  [a-zA-Z]
digito [0-9]
identificador {letra}({letra}|{digito})*
constEntera {digito}({digito})*
%%
{separador} {/* omitir */}
{constEntera} {return (CONSTANTENTERA);}
":="  {return (OPAS);}
"+"   {return (MAS);}
"-" {return (MENOS);}
"*" {return (POR);}
"if" {return (IF);}
";" {return (PUNTOCOMA);}
{identificador} {return (IDENTIFICADOR);}
"(" {return (APAR);}
")" {return (CPAR);}
\n {return (NL);}
.   ECHO;
%%
