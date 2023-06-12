# Deliverable 3: YACC grammar



## 🚀 Problem description:

After translating to tokens, the now the job of the parser is to take those tokens and write into the *.asm* file the valid syntax for the CPU to use. 


## ✏️ Valid Sentences
With the tokens already defined, examples of valid sentences are as follows:
```
    * Robot please move 2 blocks ahead
    * Robot please move 3 blocks ahead and then turn 90 degrees, then move 2 blocks
```
Examples of invalid sentences:
```
    * Robot moves 2 blocks
    * Robot moves 2 blocks quickly
    * Move 2 blocks right now
    * Robot  2 blocks moves
    * Moves Robot 2 blocks and turns 89 degrees
```


## 👟 Run example:
human input {}
.asm file {}

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