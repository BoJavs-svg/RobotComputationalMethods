%{
#include <stdio.h>
#include <ctype.h>
int pass = 1; // Flag indicating if the sentence passes or fails
int yylex(void);
void yyerror(const char* s);
extern FILE* yyin;
FILE* outFile; // Output file
char* toLowerCase(char* str);
%}

%union{
    char* string;
}

%token<string> NOUN KIND_WORD POSITION ORIENTATION ADVERB BLOCKS DIRECTION NUMBER DEGREES CONJUNCTION ANGLE EOL 
%%
statement_list : statement 
               | statement_list statement EOL
               | statement EOL
               ;

statement : noun_phrase robot_command {printf("PASS \n");}
          ;

robot_command : action
              | action CONJUNCTION action {fprintf(outFile, "\n");}
              | action CONJUNCTION ADVERB action {fprintf(outFile, "\n");}
              ;

noun_phrase: NOUN KIND_WORD
            ;

action : movement
       | rotation
       | action ADVERB action {fprintf(outFile, "\n");}
       ;

movement : POSITION NUMBER BLOCKS DIRECTION {fprintf(outFile, "mov,%d\n", $2);}
         | POSITION NUMBER BLOCKS {fprintf(outFile, "mov,%d\n", $2);}
         ;

rotation : ORIENTATION ANGLE DEGREES {fprintf(outFile, "turn,%d\n", $2);}
         | ORIENTATION DIRECTION {fprintf(outFile, "turn,%s\n", $2);}
         ;

%%
int yylex(void);
void yyerror(const char *s){
	printf("FAIL\n");
    pass = 0;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Please provide a filename as an argument.\n");
        return 1;
    }
    FILE* file = fopen(argv[1], "r");
    outFile = fopen("instructions.asm", "w");
    if (file == NULL) {
        printf("Failed to open the file.\n");
        return 1;
    }

    yyin = file;
    yyparse();
    
    fclose(file);
    fclose(outFile);

    if (!pass) {
        printf("The sentence fails.\n");
    }

    return 0;
}

char* toLowerCase(char* str) {
    int i = 0;
    while (str[i]) {
        str[i] = tolower(str[i]);
        i++;
    }
    return str;
}
