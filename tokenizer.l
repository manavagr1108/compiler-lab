%{ 
    #include "y.tap.h"
    int newLineCount = 0;
%}

alpha [a-zA-Z]
digit [0-9]
unary "++"|"--"

%%

"int" { printf("int"); return INT; }
"float" { printf("float"); return FLOAT; }
"double" { printf("double"); return DOUBLT; }
"char" { printf("char"); return CHAR; }
"printf" { printf("printf"); return PRINTFF; }
"scanf" { printf("scanf"); return SCANF; }
"void" { printf("void"); return VOID; }
"unsgined" { printf("unsgined"); return UNSIGNED; }
"struct" { printf("struct"); return STRUCT; }
"if" { printf("if"); return IF; }
"else" { printf("else"); return ELSE; }
"break" { printf("break"); return BREAK; }
"continue" { printf("continue");return CONTINUE; }
"switch" { printf("switch"); return SWITCH; }
"return" { printf("return"); return RETURN; }
"goto" { printf(""); return GOTO; }
"+" { printf(""); return ADD; }
"-" { printf(""); return SUBTRACT; }
"*" { printf(""); return MULTIPLY; }
"/" { printf(""); return DIVIDE; }
"|" { printf(""); return BOR; }
"&" { printf(""); return BAND; }
"^" { printf(""); return BXOR; }
"||" { printf(""); return OR; }
"&&" { printf(""); return AND; }
"!" { printf(""); return NOT; }
"=" { printf(""); return ASSIGN; }
"<" { printf(""); return LT; }
">" { printf(""); return GT; }
"<=" { printf(""); return LE; }
">=" { printf(""); return GT; }
"!=" { printf(""); return NE; }
"==" { printf("");return EQ; }
\/\/* { ; }
\/\*(.*\n)*.*\*\/ { ; } 
[ \t]* { ; }
[\n] { printf(""); newLineCount++; }     
. { printf(""); return *yytext; }              
["].*["] { printf(""); return STRING; }
['].['] { printf(""); return CHARACTER; }  
[-]?[0-9]+                { printf(""); return NUMBER; }
[-]?[0-9]+\.[0-9]{1,6} { printf(""); return FLOAT_NUM; }
[a-zA-Z]([a-zA-Z]|[0-9])* { printf(""); return ID; }
"++" | "--" { printf(""); return UNARY; }  
%%

int yywrap() {
    return 1;
}