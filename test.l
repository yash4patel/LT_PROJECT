%{
	#include <stdio.h> 
	#include <stdlib.h>
	#include <string.h>
	extern void yyerror(const char *);
	//#include "tokenI.h"
	#include "y.tab.h"
	#include "lineno.h"
	extern SYMTABNODEPTR symTab[SYMTABSIZE];
	extern int currentSymTabSize;
	int id_num = 1;
	int error_exist = 0;
	extern int line_num;
	int comment_flag = 0;
	static int num_no = 1;
	static int rnum_no = 1;
	//FILE *f_write;
	//static FILE* f_read;
	int BUFFSIZE = 256;
	
	struct TokenInfo 
{
	int s;
	//common place to store the identifiers
	union
	{
		int i;			//constant integer value
		float f;		//constant real value
		char s[21];		//function names, id names
	}val;
	//lno = line number, df = cnt for constant int/real number
	int lno, df;		
	struct TokenInfo *n;
	struct TokenInfo *prev;
};
typedef struct TokenInfo tokenInfo;

struct idt{
		tokenInfo* idToken;
		tokenInfo* dt;
		struct idt* n;
};
typedef struct idt idt;
	tokenInfo* getFirstToken();
	tokenInfo* getNextToken();
	tokenInfo* initToken();
	tokenInfo* end;
	tokenInfo* first;
	tokenInfo* scan;
	tokenInfo* getFirstToken()
	{
		return first->n;
		
	}
	
	tokenInfo* getNextToken()
	{
		if(scan == NULL)
		{	
			scan = first;
		}
		else
		{
			scan = scan->n;
		}	
		return scan;
	}
	tokenInfo* initToken()
	{
		if(end==NULL){
		//Initialise the basic common values of Token
		tokenInfo* temp = (tokenInfo *)malloc(sizeof(tokenInfo));
		temp->lno = line_num;
		temp->n = NULL;
		temp->prev = NULL;		
		//temp->prev = end;
		//end->n = temp;
		end = temp;
		first = temp;
		return temp;
		}else{
		tokenInfo* temp = (tokenInfo *)malloc(sizeof(tokenInfo));
		temp->lno = line_num;
		temp->n = NULL;
		//temp->prev = NULL;		
		temp->prev = end;
		end->n = temp;
		end = temp;
		return temp;
		}
		
	}
%}
DIGIT    [0-9]
%%
integer		{
			tokenInfo* temp = initToken();
			temp->s=INTEGER	;
			return INTEGER;
		}
real		{
			tokenInfo* temp = initToken();
			temp->s=REAL;	
			return REAL;
		}
boolean		{
			tokenInfo* temp = initToken();
			temp->s=BOOLEAN;	
			return BOOLEAN;
		}
of		{
			tokenInfo* temp = initToken();
			temp->s=OF;	
			return OF;
		}
array		{
			tokenInfo* temp = initToken();
			temp->s=ARRAY;	
			return ARRAY;
		}
start		{
			tokenInfo* temp = initToken();			
			temp->s=START;	
			return START;
		}
end		{
			tokenInfo* temp = initToken();
			temp->s=END;	
			return END;
		}
declare		{
			tokenInfo* temp = initToken();
			temp->s=DECLARE;	
			return DECLARE;
		}
module		{
			tokenInfo* temp = initToken();
			temp->s=MODULE;	
			return MODULE;
		}
program		{
			tokenInfo* temp = initToken();
			temp->s=PROGRAM;	
			return PROGRAM;
		}
get_value	{
			tokenInfo* temp = initToken();
			temp->s=GET_VALUE;	
			return GET_VALUE;
		}
print		{
			tokenInfo* temp = initToken();
			temp->s=PRINT;	
			return PRINT;
		}
use		{
			tokenInfo* temp = initToken();
			temp->s=USE;	
			return USE;
		}
with		{
			tokenInfo* temp = initToken();
			temp->s=WITH;	
			return WITH;
		}
parameters	{
			tokenInfo* temp = initToken();
			temp->s=PARAMETERS;	
			return PARAMETERS;
		}
true		{
			tokenInfo* temp = initToken();
			temp->s=TRUE_;	
			return TRUE_;
		}
false		{
			tokenInfo* temp = initToken();
			temp->s=FALSE_;	
			return FALSE_;
		}
takes		{
			tokenInfo* temp = initToken();
			temp->s=TAKES;	
			return TAKES;
		}
input		{
			tokenInfo* temp = initToken();
			temp->s=INPUT;	
			return INPUT;
		}
returns		{
			tokenInfo* temp = initToken();
			temp->s=RETURNS;	
			return RETURNS;
		}
AND		{
			tokenInfo* temp = initToken();
			temp->s=AND;	
			return AND;}
OR		{
			tokenInfo* temp = initToken();
			temp->s=OR;	
			return OR;
		}
for		{
			tokenInfo* temp = initToken();
			temp->s=FOR;	
			return FOR;
		}
in		{
			tokenInfo* temp = initToken();
			temp->s=IN;	
			return IN;
		}
switch		{
			tokenInfo* temp = initToken();
			temp->s=SWITCH;	
			return SWITCH;
		}
case		{
			tokenInfo* temp = initToken();
			temp->s=CASE;	
			return CASE;
		}
break		{
			tokenInfo* temp = initToken();
			temp->s=BREAK;	
			return BREAK;}
default		{
			tokenInfo* temp = initToken();
			temp->s=DEFAULT;
			return DEFAULT;}
while		{
			tokenInfo* temp = initToken();
			temp->s=WHILE;	
			return WHILE;
		}
"+"		{
			tokenInfo* temp = initToken();
			temp->s=PLUS;	
			return PLUS;
		}
"-"		{
			tokenInfo* temp = initToken();
			temp->s=MINUS;	
			return MINUS;
		}
"*"		{
			tokenInfo* temp = initToken();
			temp->s=MUL;	
			return MUL;
		}
"/"		{
			tokenInfo* temp = initToken();
			temp->s=DIV;	
			return DIV;
		}
"<="		{
			tokenInfo* temp = initToken();
			temp->s=LE;	
			return LE;
		}
"<"		{
			tokenInfo* temp = initToken();
			temp->s=LT;	
			return LT;
		}
">="		{
			tokenInfo* temp = initToken();
			temp->s=GE;	
			return GE;
		}
">"		{
			tokenInfo* temp = initToken();
			temp->s=GT;	
			return GT;
		}
"=="		{
			tokenInfo* temp = initToken();
			temp->s=EQ;	
			return EQ;
		}
"!="		{
			tokenInfo* temp = initToken();
			temp->s=NE;	
			return NE;
		}
"<<"		{
			tokenInfo* temp = initToken();
			temp->s=DEF;	
			return DEF;
		}
">>"		{
			tokenInfo* temp = initToken();
			temp->s=ENDDEF;	
			return ENDDEF;
		}
":"		{
			tokenInfo* temp = initToken();
			temp->s=COLON;	
			return COLON;
		}
".."		{
			tokenInfo* temp = initToken();
			temp->s=RANGEOP;	
			return RANGEOP;
		}
";"		{
			tokenInfo* temp = initToken();
			temp->s=SEMICOL;	
			return SEMICOL;
		}
","		{
			tokenInfo* temp = initToken();
			temp->s=COMMA;	
			return COMMA;
		}
":="		{
			tokenInfo* temp = initToken();
			temp->s=ASSIGNOP;	
			return ASSIGNOP;
		}
"["		{
			tokenInfo* temp = initToken();
			temp->s=SQBO;	
			return SQBO;
		}
"]"		{
			tokenInfo* temp = initToken();
			temp->s=SQBC;	
			return SQBC;
		}
"("		{
			tokenInfo* temp = initToken();
			temp->s=BO;
			return BO;
		}
")"		{
			tokenInfo* temp = initToken();
			temp->s=BC;
			return BC;
		}
"$"		{
			tokenInfo* temp = initToken();
			temp->s=DOLLAR;
			return DOLLAR;
		}

[ \t]+          /* eat up whitespace */
[\n]		{line_num++;}
"**"[^*]*"**"     /* eat up comment start:** end:** */
{DIGIT}+	{
			//printf( "An integer: %s\n", yytext);
			int num = atoi(yytext);
			num_no++;
			tokenInfo* temp = initToken();
			temp->s = NUM;	
			temp->val.i = num;
			temp->df = num_no;
			yylval.iVal=num;
			return NUM;
                }

{DIGIT}+"."{DIGIT}*	{
                     		//printf( "A real: %s\n", yytext);
				float num = atof(yytext);
				rnum_no++;
				tokenInfo* temp = initToken();
				temp->s = RNUM;
				temp->val.f = num;
				temp->df = rnum_no;
				yylval.fVal=num;
				return RNUM;
			}
{DIGIT}+"."{DIGIT}+[Ee]("+"|"-"){0,1}{DIGIT}+ 	{
                     						//printf( "A real: %s\n", yytext);
								float num = atof(yytext);
								rnum_no++;
								tokenInfo* temp = initToken();
								temp->s = RNUM;
								temp->val.f = num;
								temp->df = rnum_no;
								yylval.fVal=num;
								return RNUM;                     	
						}
													
[a-zA-Z][a-zA-Z0-9]*	{
				char *id = yytext;
				tokenInfo* temp = initToken();
				temp->s = ID;
				strcpy(temp->val.s, id);
				yylval.sVal=strdup(yytext);
				return ID;
			}
.	printf( "Unrecognized character: %s\n", yytext );
%%
int yywrap(void) {
return 1;
}
