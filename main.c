#include<stdio.h>
#include<stdlib.h>
extern void yyerror(); 
extern int  yylex();
#define YYDEBUG 1
#include "y.tab.c"
#include "lex.yy.c"
extern FILE *yyin;
char str[1000];

int main(int argc, char *argv[])
{
	init_symtable();
	FILE *fptr; 
	char str[100];
	 FILE *fp;
	 int i;
	 if(argc>1)
	 { 
	 	fp = fopen(argv[1],"r");
	 }
	 if(!fp)
	 {
		printf("\n File not found");  
		exit(0);
	 }
	 yyin = fp;
	yyparse();
	int c=-1;
	char ch='y';
	while(ch=='y'){
	printf("\n1.Print Symbol Table");
	printf("\n2.Print Parse Tree");
	printf("\n0.Exit");
	printf("\nEnter your choice: ");
	scanf("%d",&c);	
	switch(c){
	case 0: exit(0); break;
	case 1: print_table(); break;
	case 2:
		fptr = fopen("parseTree.txt","r");
		while(fgets(str,1000,fptr)!=NULL)
			printf("%s",str);
		fclose(fptr);
		break;
	default: printf("Enter Correct Choice..");
	}
	printf("\nDo you want more?(y/n):");
	scanf(" %c",&ch);
	}	
	return 0;
}
