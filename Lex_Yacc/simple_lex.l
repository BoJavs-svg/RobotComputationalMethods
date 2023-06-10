%{
#include "grammar.tab.h"
#include <string.h>
%}

%%
"robot"                     { yylval.string = strdup(yytext); return NOUN; }
"gerald"                    { yylval.string = strdup(yytext); return NOUN; } /*robots name*/

"block"                     { yylval.string = strdup(yytext); return BLOCKS; }
"blocks"                    { yylval.string = strdup(yytext); return BLOCKS; }

"degrees"                   { yylval.string = strdup(yytext); return DEGREES; }

"please"                    { yylval.string = strdup(yytext); return KIND_WORD; }
"kindly"                    { yylval.string = strdup(yytext); return KIND_WORD; }

"and"                       { yylval.string = strdup(yytext); return CONJUNCTION; }

"then"                      { yylval.string = strdup(yytext); return ADVERB; }
"subsequently"              { yylval.string = strdup(yytext); return ADVERB; }
"after"                     { yylval.string = strdup(yytext); return ADVERB; }
"afterwards"                { yylval.string = strdup(yytext); return ADVERB; }
"next"                      { yylval.string = strdup(yytext); return ADVERB; }

"move"                      { yylval.string = strdup(yytext); return POSITION; }
"advance"                   { yylval.string = strdup(yytext); return POSITION; }

"turn"                      { yylval.string = strdup(yytext); return ORIENTATION; }
"rotate"                    { yylval.string = strdup(yytext); return ORIENTATION; }

"90"                        { yylval.string = strdup(yytext); return ANGLE; }
"180"                       { yylval.string = strdup(yytext); return ANGLE; }
"270"                       { yylval.string = strdup(yytext); return ANGLE; }
"360"                       { yylval.string = strdup(yytext); return ANGLE; }

[0-9]+                      { yylval.string = strdup(yytext); return NUMBER; }


"ahead"                     { yylval.string = strdup(yytext); return DIRECTION; }
"left"                      { yylval.string = strdup(yytext); return DIRECTION; }
"right"                     { yylval.string = strdup(yytext); return DIRECTION; }
"back"                      { yylval.string = strdup(yytext); return DIRECTION; }
"up"                        { yylval.string = strdup(yytext); return DIRECTION; }
"down"                      { yylval.string = strdup(yytext); return DIRECTION; }

\n                          { yylval.string = strdup(yytext); return EOL;}
[ \t]+                      { /* Skip whitespace */ }
%%

int yywrap(void) {
    return 1;
}
