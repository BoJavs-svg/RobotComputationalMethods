# Deliverable 2: Lex analyzer

## 🚀 Problem description:

In order for a human operator to use the robot, a language that is more atuned with regular human speech is necesary. 

In order to achieve this, a series of tokens that are used by a lexer in order to understand some common words is required.

## ✅ Accepted Keywords
Keywords accepted and translated to tokens:

- **NOUN**: robot, gerald
- **BLOCKS**: block, blocks
- **DEGREES**: degrees
- **KIND_WORD**: please, kindly
- **CONJUNCTION**: and
- **ADVERB**: then, subsequently, afterwards, after, next
- **POSITION**: move, advance
- **ORIENTATION**: turn, rotate
- **ANGLE**: 90, 180, 270, 360
- **NUMBER**: [0-9]+
- **DIRECTION**: ahead, forward, left, right, back, up, down.
- **EOL**: \n (*used to separate sentences*)

## 👟 Run example:
In order to run:
<!--
Declare in format that compiler is ran with 
win_flex simple_lex.l
win_bison -d grammar.y
gcc lex.yy.c grammar.tab.c -o program 
./program text.txt

flex simple_lex.l
bison -d grammar.y
gcc lex.yy.c grammar.tab.c -o program 
./program text.txt

-->
In order to run:
<!--
Declare in format that compiler is ran with 
win_flex simple_lex.l
win_bison -d grammar.y
gcc lex.yy.c grammar.tab.c -o program 
./program text.txt

flex simple_lex.l
bison -d grammar.y
gcc lex.yy.c grammar.tab.c -o program 
./program text.txt

-->
input1 {}
accepted {}
input2 {}
rejected {}

In order to run:
<!--
Declare in format that compiler is ran with 
win_flex simple_lex.l
win_bison -d grammar.y
gcc lex.yy.c grammar.tab.c -o program 
./program text.txt

flex simple_lex.l
bison -d grammar.y
gcc lex.yy.c grammar.tab.c -o program 
./program text.txt

-->



