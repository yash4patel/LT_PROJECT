#include <stdio.h> 
#include <stdlib.h>
#define SYMTABSIZE	997
#define IDLENGTH	30
#define INDENTOFFSET	2
struct treeNode {
	struct value{
		union {
			int i;
			float f;
			char *s;
		} v;
		char *usethis;
	} val;
	int nodeIdentifier;
	struct treeNode *first;
	struct treeNode *second;
	struct treeNode *third;
	struct treeNode *fourth;
};
typedef struct treeNode TREE_NODE;
typedef TREE_NODE *BINARY_TREE;
BINARY_TREE create_node(struct value,int,BINARY_TREE,BINARY_TREE,BINARY_TREE,BINARY_TREE);
/*-------------Symbol Table----------*/
struct symTabNode {
	char identifier[IDLENGTH];
	char type[100];
};
typedef struct symTabNode SYMTABNODE;
typedef SYMTABNODE *SYMTABNODEPTR;

SYMTABNODEPTR symTab[SYMTABSIZE];
void PrintTree(BINARY_TREE);

