%{
#include <stdio.h>
#include <ctype.h>
int pass = 1; // Flag indicating if the sentence passes or fails
int yylex(void);
void yyerror(const char* s);
extern FILE* yyin;
char* toLowerCase(char* str);
%}

%token NOUN KIND_WORD POSITION ORIENTATION ADVERB BLOCKS DIRECTION NUMBER DEGREES CONJUNCTION ANGLE EOL 
%{
    FILE* output_file;    
%}
%union {
    char* string;
    int number;
}
%type <string> action movement rotation

%%
statement_list : statement 
               | statement_list statement EOL
               | statement EOL
               ;
               
statement : noun_phrase robot_command {printf("PASS \n");}
          ;

robot_command : action { fprintf(output_file, "&s,&d\n", $1, $2); }
              | action CONJUNCTION action { fprintf(output_file, "%s,%d\n%s,%d\n", $1, $2, $3, $4); }
              | action CONJUNCTION ADVERB action { fprintf(output_file, "%s,%d\n%s\n%s,%d\n", $1, $2, $3, $4, $6); }
              ;

noun_phrase: NOUN KIND_WORD
            ;

action : movement { $$ = $1; }
       | rotation { $$ = $1; }
       | action ADVERB action { $$ = $1; }
       ;

movement : POSITION NUMBER BLOCKS DIRECTION { $$ = "mov"; }
         | POSITION NUMBER BLOCKS { $$ = "mov"; }
         ;

rotation : ORIENTATION ANGLE DEGREES { $$ = "turn"; }
         | ORIENTATION DIRECTION { $$ = "turn"; }
         ;  

%%
int yylex(void);
void yyerror(const char *s){
	printf("FAIL\n");
    pass = 0;
}

int main(int argc, char** argv) {
    if (argc < 3) {
        printf("Please provide an input filename and an output filename as arguments.\n");
        return 1;
    }
    FILE* input_file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Failed to open the input file.\n");
        return 1;
    }
    output_file = fopen(argv[2], "w");
    if(output_file == NULL) {
        printf("Failed to open the output file.\n");
        return 1;
    }
    yyin = input_file;
    yyparse();
    
    fclose(input_file);
    fclose(output_file);

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
