# Deliverable 1: machine state and CPU simulator

## 🚀 Problem description:

A robot language and compiler first needs a CPU that is capable of reading and executing instructions; in order to simulate the functionalities that such robot would have, a the *CPU.py* file found in the */src* folder has the capacity to:

- [x] Open and queue instructions from .asm file
- [x] Understand and execute instructions
- [x] Draw the machine's state on a matrix.

---
## ⭕ Diagram
![nfa1](nfa.png)
![nfa2](S2.png)
![nfa3](S5.png)
## 🖋️ Instruction Syntax:
Valid syntax for the **instructions.asm** file

#### **Move instruction:**

"mov" keyword followed by a comma separated value
```
mov,2
```

#### **Turn instruction:**
"turn" keyword followed comma and valid value: (90,180, 270 or 360)
```
turn, 180
```
---

## 📦 Usage:
1. Write instructions into the instructions.asm file with valid syntax
2. Run CPU.py file

## 👟 Run example:
instructions image {}
matrix image {}