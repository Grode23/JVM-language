/*
Grammar with semantics and type checking.
Lexical Analyser
You will need to make changes in this file.
*/

%{
#include <stdlib.h>
#include <string.h>

%}
%option yylineno

D [0-9]
LETTER [a-zA-Z]
VARIABLE {LETTER}({LETTER}|{D}|_)*
FLOAT {D}+\.{D}*
newline \n|\x0A|\x0D\x0A
%%
"start" {return T_start;}
"end" {return T_end;}
"print" {return T_print;}
"int" {return T_type_integer;}
"float" {return T_type_float;}

"+" {return '+';}
"-"  {return '-';}
"*" {return '*';}
"/" {return '/';}
"(" {return '(';}
")" {return ')';}


{D}+ {yylval.lexical = strdup(yytext);  return T_num;}
{FLOAT} {yylval.lexical = strdup(yytext); return T_real;}
{VARIABLE} {yylval.lexical = strdup(yytext); return T_id;}

{newline}  {/* yylineno used instead*/}
[ \t] { /* nothing */ }
. {
	printf("Lexical Analysis: Unexpected String! :: %s. in line %d. \n",yytext,yylineno); }

%%
