#include <stdio.h>
#include <stdlib.h>

int main(void)
{

	extern int yyparse(void);
	extern FILE *yyin;

	//	yyin = stdin;
	yyin = fopen("input.txt", "r");

	if(yyparse()) {
		fprintf(stderr, "Error ! Error ! Error !\n");
		exit(1);
	}
	fclose(yyin);
	return 0;
}
	
