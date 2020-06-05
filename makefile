build:
	@lex  test.l
	@yacc -d test.y	
	@gcc main.c -o yper
	

