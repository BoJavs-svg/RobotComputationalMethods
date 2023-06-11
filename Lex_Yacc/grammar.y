%{
#include <stdio.h>
#include <ctype.h>
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
%left CONJUNCTION

%%
statement_list : statement 
               | statement_list statement EOL
               | statement EOL
               ;

statement : noun_phrase robot_command {printf("PASS \n");}
          ;

robot_command : action
              | action CONJUNCTION action
              | action CONJUNCTION ADVERB action
              ;


noun_phrase: NOUN KIND_WORD
            ;

action : movement
       | rotation
       | action ADVERB action %prec CONJUNCTION
       | action CONJUNCTION rotation
       ;


movement : POSITION NUMBER BLOCKS DIRECTION {fprintf(outFile, "mov,%s\n", $2);}
        |POSITION DIRECTION NUMBER BLOCKS {fprintf(outFile, "mov,%s\n", $3);}
         | POSITION NUMBER BLOCKS {fprintf(outFile, "mov,%s\n", $2);}
         ;

rotation : ORIENTATION ANGLE DEGREES {fprintf(outFile, "turn,%s\n", $2);}
         | ORIENTATION DIRECTION {
            if($2 == "ahead"||$2 == "forward"){fprintf(outFile, "turn, 360\n");}
            if($2 == "left"){fprintf(outFile, "turn, 270\n");}
            if($2 == "right"){fprintf(outFile, "turn, 90\n");}
            if($2 == "back"){fprintf(outFile, "turn, 180\n");}
            }
         ;

%%
int yylex(void);
void yyerror(const char *s){
	printf("FAIL\n");
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
