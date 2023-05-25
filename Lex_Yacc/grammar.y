%{
#include <stdio.h>
#include <ctype.h>
int pass = 1; // Flag indicating if the sentence passes or fails
int yylex(void);
void yyerror(const char* s);
extern FILE* yyin;
char* toLowerCase(char* str);
%}

%token NOUN KIND_WORD COMMAND BLOCKS DIRECTION NUMBER DEGREES CONJUNCTION

%%

#############################################

%%
int yylex(void);
void yyerror(const char* s);

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Please provide a filename as an argument.\n");
        return 1;
    }

    FILE* file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Failed to open the file.\n");
        return 1;
    }

    yyin = file;
    yyparse();

    fclose(file);

    if (pass) {
        printf("The sentence passes.\n");
    } else {
        printf("The sentence fails.\n");
    }

    return 0;
}

void yyerror(const char* s) {
    printf("Syntax error: %s\n", s);
    pass = 0;
}

char* toLowerCase(char* str) {
    int i = 0;
    while (str[i]) {
        str[i] = tolower(str[i]);
        i++;
    }
    return str;
}
