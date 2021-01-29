package alexico;
import static alexico.Token.*;

%%
%class Lexico
%type Token

L=[a-zA-Z_]+
D=[0-9]
WHITE=[ \t\r]+
%{
public String lexeme;
%}

%%
int {lexeme=yytext(); return INT;}
if {lexeme=yytext(); return IF;}
else {lexeme=yytext(); return ELSE;}
while {lexeme=yytext(); return WHILE;}

{WHITE} {/* ignore */}
"//".* {/* ignore */}
"=" {lexeme=yytext(); return ASSIGN;}
"\n" {lexeme=yytext(); return LINEA;}
"==" {lexeme=yytext(); return EQUALS;}
"+" {lexeme=yytext(); return PLUS;}
"-" {lexeme=yytext(); return MINUS;}
"*" {lexeme=yytext(); return TIMES;}
"/" {lexeme=yytext(); return DEVIDED;}
"(" {lexeme=yytext(); return PARA;}
")" {lexeme=yytext(); return PARC;}
"{" {lexeme=yytext(); return LLAA;}
"}" {lexeme=yytext(); return LLAC;}
"main" {lexeme=yytext(); return MAIN;}
";" {lexeme=yytext(); return PUNTOC;}
{L}({L}|{D})* {lexeme=yytext(); return ID;}
("(-"{D}+")")|{D}+ {lexeme=yytext();return NUMERO;}
. {lexeme=yytext(); return ERROR;}