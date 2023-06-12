# Deliverable 3: YACC grammar
## Problem description:

After translating to tokens, the now the job of the parser is to take those tokens and write into the *.asm* file the valid syntax for the CPU to use. 


## Valid Sentences
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


## Run example:
Input:
```
robot please move 3 blocks ahead and then turn 90 degrees, then move 2 blocks
```
**OUTPUT instructions.asm:**

![created_file](https://github.com/BoJavs-svg/RobotComputationalMethods/assets/73002064/a81a1040-095a-42c5-bd0b-066d682d6772)

