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
"then"                      { return CONJUNCTION; }
"subsequently"              { return CONJUNCTION; }
"after"                     { return CONJUNCTION; }
"afterwards"                { return CONJUNCTION; }
"next"                      { return CONJUNCTION; }
"finally"                   { return CONJUNCTION; }

"move"                      { return COMMAND; }
"advance"                   { return COMMAND; }

"turn"                      { return COMMAND; }
"rotate"                    { return COMMAND; }

"a"                         { return ARTICLE; }
"an"                        { return ARTICLE; }
"the"                       { return ARTICLE; }

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

\n                          { /* Skip newline character */ }
[ \t]+                      { /* Skip whitespace */ }
%%

int yywrap(void) {
    return 1;
}
