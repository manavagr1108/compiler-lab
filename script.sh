lex tokenizer.l
yacc -v -d parser.y
cc lex.yy.c
./a.out
