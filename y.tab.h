#define INTEGER 257
#define REAL 258
#define BOOLEAN 259
#define OF 260
#define ARRAY 261
#define START 262
#define END 263
#define DECLARE 264
#define MODULE 265
#define PROGRAM 266
#define GET_VALUE 267
#define PRINT 268
#define USE 269
#define WITH 270
#define PARAMETERS 271
#define TRUE_ 272
#define FALSE_ 273
#define TAKES 274
#define INPUT 275
#define RETURNS 276
#define AND 277
#define OR 278
#define FOR 279
#define IN 280
#define SWITCH 281
#define CASE 282
#define BREAK 283
#define DEFAULT 284
#define WHILE 285
#define PLUS 286
#define MINUS 287
#define MUL 288
#define DIV 289
#define LT 290
#define LE 291
#define GE 292
#define GT 293
#define EQ 294
#define NE 295
#define DEF 296
#define ENDDEF 297
#define COLON 298
#define RANGEOP 299
#define SEMICOL 300
#define COMMA 301
#define ASSIGNOP 302
#define SQBO 303
#define SQBC 304
#define BO 305
#define BC 306
#define DOLLAR 307
#define ID 308
#define NUM 309
#define RNUM 310
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union 	{
	int iVal;
	float fVal;
	char *sVal;
	struct value sv;
	BINARY_TREE tVal;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
