# Deliverable 2: Lex analyzer

Contributors:
- Israel vidal paredes - A01750543
- Javier Eric Hernández - A01635390
- Mariana BusTos Hernández - a01641324 
- 
## Problem description:

In order for a human operator to use the robot, a language that is more atuned with regular human speech is necesary. 

In order to achieve this, a series of tokens that are used by a lexer in order to understand some common words is required.

## Accepted Keywords
Keywords accepted and translated to tokens:

- **⟨NOUN⟩** → "robot" | "gerald"
- **⟨KIND_WORD⟩** → "please" | "kindly"
- **⟨BLOCKS⟩** → "block" | "blocks"
- **⟨DEGREES⟩** → "degrees"
- **⟨CONJUNCTION⟩** →  "and"
- **⟨ADVERB⟩** → "then" | "subsequently"|"after"|"afterwards"|"next"
- **⟨POSITION⟩** →  "move" | "advance"
- **⟨ORIENTATION⟩** →  "turn" | "rotate"
- **⟨ANGLE⟩** → "90" |"180"|"270" | "360"
- **⟨DIRECTION⟩** → "ahead" | "left"|"right"| "up" |"down"
## Run example:
```
robot please move 3 blocks ahead and then turn 90 degrees, then move forward 5 blocks and turn 90 degrees
```
![pass](https://github.com/BoJavs-svg/RobotComputationalMethods/assets/73002064/b4860f1c-5925-44f6-bce7-5e95455d6904)
```
robot moves 2 blocks quickly
```
![fail](https://github.com/BoJavs-svg/RobotComputationalMethods/assets/73002064/e9ce5809-8f1e-4607-9d8a-584acaa0101c)
