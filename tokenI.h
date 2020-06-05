#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
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


