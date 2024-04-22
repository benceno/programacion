%{
/* fichero instrucciones.y */
  #include <stdio.h>
%}
%token IDENTIFICADOR OPAS CONSTANTENTERA IF NL PUNTOCOMA MAS MENOS POR APAR CPAR
%start instrucciones
%%
instrucciones : instrucciones instruccion | instruccion
;
instruccion : IDENTIFICADOR OPAS expresion NL
            ;
expresion :  termino
          | expresion MAS termino PUNTOCOMA
          | expresion MENOS termino PUNTOCOMA
          | expresion POR termino PUNTOCOMA
          ;
if_stmt :
          IF "(" expresion ")""{"
              stmt PUNTOCOMA
          "}"
          |IF "(" expresion ")"
              stmt PUNTOCOMA
          |IF "(" expresion ")""{"
              stmt PUNTOCOMA
          "}" ELSE "{" stmt PUNTOCOMA "}"
          |IF "(" expresion ")""{"
              stmt PUNTOCOMA
          "}" ELSE  stmt PUNTOCOMA

termino : IDENTIFICADOR
        | CONSTANTENTERA
        | APAR expresion CPAR
        ;
%%
int yylex()
{  }
  yyerror(s)
      char *s
  {
    printf("%s\n", s );
  }

main() {
  yyparse();
}
