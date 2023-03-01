%{
    int COMMENT=0;
    int variable=0;
    void yyerror(const char *s);
%}
identifier [a-zA-Z][a-zA-Z0-9]*
%%
#.* {printf("\n%s is a preprocessor directive",yytext);}
int |
float |
char |
double |
usigned |
long |
while |
for |
struct |
typedef |
do |
if |
break |
continue |
void |
switch |
return |
else |
goto {printf("\n%s is a keyword",yytext);}
"/*" {COMMENT=1;}
"*/" {COMMENT=0;}
"//" {COMMENT=1;}{COMMENT = 0;}
{identifier}\( {if(!COMMENT)printf("\n function \n%s",yytext);}
\{  {if(!COMMENT)printf("\n block begins");}
\}  {if(!COMMENT)printf("block ends ");}
{identifier}(\[[0-9]*\])? {if(!COMMENT) {printf("\n %s is a indentifier",yytext);variable++;}}
\".*\" {if(!COMMENT)printf("\n %s is a string",yytext);}
[-]?[0-9]+ {if(!COMMENT) printf("\n %s is a number ",yytext);}
[-]?[0-9]+\.[0-9]* {if(!COMMENT) printf("\n %s is a fraction ",yytext);}
\)(\:)? {if(!COMMENT)printf("\n");ECHO;printf("\n");}
\( ECHO;
= {
    if(!COMMENT && variable != 0){
        if(variable != 0)
           printf("\n %s is a assignment operator",yytext);
        else
            yyerror("invalid variable name or function call");
    }
}
\+ {
    if(!COMMENT && variable != 0){
        if(variable != 0)
           printf("\n %s is a addition operator",yytext);
        else
            yyerror("invalid variable name or function call");
    }
}
\- {
    if(!COMMENT && variable != 0){
        if(variable != 0)
           printf("\n %s is a subtraction operator",yytext);
        else
            yyerror("invalid variable name or function call");
    }
}
\* {
    if(!COMMENT && variable != 0){
        if(variable != 0)
           printf("\n %s is a multiplication operator",yytext);
        else
            yyerror("invalid variable name or function call");
    }
}
\\ {
    if(!COMMENT && variable != 0){
        if(variable != 0)
           printf("\n %s is a division operator",yytext);
        else
            yyerror("invalid variable name or function call");
    }
}
\| {
    if(!COMMENT && variable != 0){
        if(variable != 0)
            printf("\n %s is a bitwise or operator",yytext);
        else
            yyerror("invalid variable name or function call");
    }
}
\& {
    if(!COMMENT){   
        if(variable != 0)
            printf("\n %s is a bitwise and operator",yytext);
        else 
            yyerror("invalid variable name or function call");
    }
}
\^ {
    if(!COMMENT){
        if(variable != 0)
            printf("\n %s is a bitwise xor operator",yytext);
        else 
            yyerror("invalid variable name or function call");
    }
}
\<= |
\>= |
\< |
== |
\> {
    if(!COMMENT ){
        if(variable != 0)
            printf("\n%s is a relational operator",yytext);
        else
            yyerror("invalid variable name or function call");
    }
}
; {if(!COMMENT) {printf("\n%s is a delimiter", yytext); variable = 0;}}
\'.\' {if(!COMMENT) printf("\n%s is a char",yytext);}
[^a-zA-Z0-9_;{][\n][^$] {if(!COMMENT && variable == 0){
    printf("\n %s",yytext);
    yyerror("invalid variable name or function call\n");
}}
%%
int main(int argc, char **argv)
{
FILE *file;
file=fopen("sampleTest.c","r");
if(!file)
{
printf("could not open the file");
exit(0);
}
yyin=file;
yylex();
printf("\n");
return(0);
}
void yyerror(const char* msg) {
    fprintf(stderr, "%s", msg);
}
int yywrap()
{
return(1);
}