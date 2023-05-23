%{
#include "y.tab.h"
%}

%%

"robot"                     { return NOUN; }
"please"                    { return KIND_WORD; }
"move"                      { return VERB; }
"blocks"                    { return NOUN; }
"ahead"                     { return DIRECTION; }
"and"                       { return CONJUNCTION; }
"then"                      { return CONJUNCTION; }
"turn"                      { return VERB; }
"90"|"180"|"270"|"360"      { return DEGREES; }
"left"|"right"|"up"|"down"  { return DIRECTION; }
"a"|"an"|"the"              { return ARTICLE; }
","                         { return PUNCTUATION; }
[0-9]+                      { return NUMBER; }
\n                          { /* Skip newline character */ }
[ \t]+                      { /* Skip whitespace */ }
.                           { return INVALID; }
%%

int yywrap(void) {
    return 1;
}
