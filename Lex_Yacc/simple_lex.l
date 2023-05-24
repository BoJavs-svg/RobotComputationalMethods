%{
#include "y.tab.h"
%}

%%
"robot"                     { return NOUN; }
"gerald"                    { return NOUN; } /*robots name*/

"block"                    { return BLOCKS; }
"blocks"                   { return BLOCKS; }

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

[0-9]+                      { return NUMBER; }
"90"|"180"|"270"|"360"      { return DEGREES; }

"ahead"                     { return DIRECTION; }
"left"|"right"|"up"|"down"  { return DIRECTION; }

\n                          { /* Skip newline character */ }
[ \t]+                      { /* Skip whitespace */ }
%%

int yywrap(void) {
    return 1;
}
