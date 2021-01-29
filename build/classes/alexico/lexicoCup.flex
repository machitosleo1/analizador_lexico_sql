package alexico;
import java_cup.runtime.Symbol;

%%
%class LexicoCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

L=[a-zA-Z_]+
D=[0-9]
WHITE=[ \t\r\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}

%%
int {return new Symbol(sym.INT, yychar, yyline, yytext());}
if {return new Symbol(sym.IF, yychar, yyline, yytext());}
else {return new Symbol(sym.ELSE, yychar, yyline, yytext());}
while {return new Symbol(sym.WHILE, yychar, yyline, yytext());}

{WHITE} {/* ignore */}
"//".* {/* ignore */}
"=" {return new Symbol(sym.ASSIGN, yychar, yyline, yytext());}
"==" {return new Symbol(sym.EQUALS, yychar, yyline, yytext());}
"+" {return new Symbol(sym.PLUS, yychar, yyline, yytext());}
"-" {return new Symbol(sym.MINUS, yychar, yyline, yytext());}
"*" {return new Symbol(sym.TIMES, yychar, yyline, yytext());}
"/" {return new Symbol(sym.DEVIDED, yychar, yyline, yytext());}
"(" {return new Symbol(sym.PARA, yychar, yyline, yytext());}
")" {return new Symbol(sym.PARC, yychar, yyline, yytext());}
"{" {return new Symbol(sym.LLAA, yychar, yyline, yytext());}
"}" {return new Symbol(sym.LLAC, yychar, yyline, yytext());}
"main" {return new Symbol(sym.MAIN, yychar, yyline, yytext());}
";" {return new Symbol(sym.PUNTOC, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.ID, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.NUMERO, yychar, yyline, yytext());}
. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}