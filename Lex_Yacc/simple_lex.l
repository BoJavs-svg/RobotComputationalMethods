%{
#include "grammar.tab.h"
#define PUNCTUATION 257
#define ARTICLE 258
%}

%%
"robot"                     { return NOUN; }
"gerald"                    { return NOUN; } /*robots name*/

"block"                    { return BLOCKS; }
"blocks"                   { return BLOCKS; }

"degrees"                  {return DEGREES; }

"please"                    { return KIND_WORD; }
"kindly"                    { return KIND_WORD; }

","                         { return PUNCTUATION; }

"and"                       { return CONJUNCTION; }

"then"                      { return ADVERB; }
"subsequently"              { return ADVERB; }
"after"                     { return ADVERB; }
"afterwards"                { return ADVERB; }
"next"                      { return ADVERB; }

"move"                      { return POSITION; }
"advance"                   { return POSITION; }

"turn"                      { return ORIENTATION; }
"rotate"                    { return ORIENTATION; }

"90"                        { return ANGLE; }
"180"                       { return ANGLE; }
"270"                       { return ANGLE; }
"360"                       { return ANGLE; }

[0-9]+                      { return NUMBER; }


"ahead"                     { return DIRECTION; }
"left"                      { return DIRECTION; }
"right"                     { return DIRECTION; }
"up"                        { return DIRECTION; }
"down"                      { return DIRECTION; }

\n                          { return EOL;}
[ \t]+                      { /* Skip whitespace */ }
%%

int yywrap(void) {
    return 1;
}
