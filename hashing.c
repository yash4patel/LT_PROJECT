#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define SYMTABSIZE 997
struct node{
	char *name;
	char *type;
	char *val;
};

struct node symtab[SYMTABSIZE]; 

int hash(char *str,int i)
{
    unsigned long hash = 5381;
    int c;

    while (c = *str++)
        hash = ((hash << 4) + hash) + c; /* hash * 33 + c */

    return ((int)((hash+i)%SYMTABSIZE));
}
int hash_search(char *str) {
	int i=0;
	int j=hash(str,i);
	while((i<SYMTABSIZE) && (strcmp(symtab[j].name,"NIL")!=0)) {
		if(strcmp(symtab[j].name,str)==0) {
			return j;
		}
		i++;
		j=hash(str,i);
	}
	return (-1);
}
int hash_insert(char *str,char *typ) {
	if(hash_search(str)==-1) {
		int i=0;
		int j;
		while(i<SYMTABSIZE) {
			j=hash(str,i);
			if(strcmp(symtab[j].name,"NIL")==0) {
				strcpy(symtab[j].name,str);
				symtab[j].type=(char*)malloc(10*sizeof(char));
				strcpy(symtab[j].type,typ);
				return j;
			}
			i++;
		} 
	}
	return (-1);
}
int hash_insert_val(char *str,char *v){
	if(hash_search(str)!=-1){
		int j=hash_search(str);
		symtab[j].val=(char*)malloc(10*sizeof(char));
		strcpy(symtab[j].val,v);
		return j;
	}
	return (-1);
}
void init_symtable() {
	int k;
	for(k=0;k<SYMTABSIZE;k++) {
		symtab[k].name=(char *)malloc (100 + 1);
		strcpy(symtab[k].name,"NIL");
	}
	return ;
}
void print_table() {
	int i;
	printf("SYMBOL TABLE\n");
	printf("--------------------------------------------------\n");
	printf("|INDEX\t|NAME\t|DATATYPE\t|value\t\n");
	printf("--------------------------------------------------\n");
	for(i=0;i<SYMTABSIZE;i++) {
		if(strcmp(symtab[i].name,"NIL")!=0)
			printf("|%d\t|%s\t|%s\t|%s\n",i,symtab[i].name,symtab[i].type,symtab[i].val);
	}
	printf("--------------------------------------------------\n");
return;
}
