## SOAR COURSE - CAPSTONE PROJECT
To complete the course, we will introduce the final project: 2048. Before the dive into the technical details, we'll provide an overview of the game:
* The gameboard consists of a 4 X 4 grid. Each cell in the grid can hold a number in the order of 2^x.
* The gameboard starts by adding two '2' values randomly to the board.
* The you have the option of moving in four directions: Up, Down, Left, Right. When you move a given direction, blocks of like value combine (and double). Two '2' values combine into '4'. All whitespace gets shifted so that the blocks are as far towards the direction as possible. During every move, a '2' is placed in a blank space randomly on the board.
* You win the game by obtaining 2048, or lose it by filling up the gameboard to the point where no blocks can be combined
Give the game a shot if you have never played it.
* Start off by downloading the most recent version of the repo. Navigate to /SOAR/2048 within terminal. You can run it by typing 'make run'. Your rules should be in a file called 2048.Soar in the same folder. Update the makefile to point to your Soar directory.
* Play this Game : https://play2048.co/

## INPUT
Input
The gameboard is inputted into Soar automatically at the beginning of each decision cycle. It utilizes the following format:

* At io.input-link there are 16 variables representing each on the blocks on the board.
* Each block has a name and a value:
```
io.input-link.<blockX>.name <val> (example: io.input-link.<blockX>.name block1-1)
io.input-link.<blockX>.value <val> (example: io.input-link.<blockX>.value 0)

Each block has values for up/down/left/right of the block:
io.input-link.<blockX>.u <val> (example: io.input-link.<blockX>.u 0)
io.input-link.<blockX>.d <val> (example: io.input-link.<blockX>.d 4)
io.input-link.<blockX>.l <val> (example: io.input-link.<blockX>.l 16)
io.input-link.<blockX>.r <val> (example: io.input-link.<blockX>.r 0)
```

* Important note: The block values aren't necessarily the adjacent values. This value will represent the closest value that isn't 0, or 0 if none exists. As an example, the u value for the red block would be '2', since it is the closest none-zero value:
```
Each block also has the names of the adjacent blocks. These will only exist if the block exists, and isn't a wall:
io.input-link.<blockX>.uBlock <val> (example: io.input-link.<blockX>.uBlock block0-2)
io.input-link.<blockX>.dBlock <val> (example: io.input-link.<blockX>.dBlock block2-2)
io.input-link.<blockX>.lBlock <val> (example: io.input-link.<blockX>.lBlock block1-1)
io.input-link.<blockX>.rBlock <val> (example: io.input-link.<blockX>.rBlock block1-3)

If a given direction has a wall, it will be represented as:
io.input-link.<blockX>.wall <dir> (example: io.input-link.<blockX>.wall u)

If the board has not changed, a variable will be added with the number of times it has remained unchanged:
io.input-link.<blockX>.change.count <val>

```

## OUTPUT
The only thing required for the output is the direction that the agent has chosen:

* io.output-link.otherlink.direction u/d/l/r

The output link must be cleansed at every cycle, or the old moves will remain. 
```
#CLEAN Output Link 
sp {top*apply*cleanupOutput 
    (state <s> ^operator <op> 
               ^superstate nil 
               ^io.output-link <out>) 
               (<out> ^<cmd> <id>) 
               (<id> ^status) 
    --> (<out> ^<cmd> <id> -) 
    }

```
The goal of this project is not for you to obtain a perfect score. Although this game can come off as simple, it is quite complex. The main goal is to obtain a result that is based off of some reasoning that you determine. One recommended path is to simply propose an operator for each adjacent pair of blocks and select
the highest.

## SOLUTION
### THOUGHTS ?? The difference between search algorithms and learning algorithms is:
* In search algorithms, the A.I. simulate the next millions of possible moves and back-propagate the results to pick the next best move. This is often accompanied by different heuristics to help the search algorithm make shortcuts in the search. For example, it would never search an action that results in a "bad" state defined by the heuristic. You can think of search methods as being "look ahead". The problem with search based A.I. is that it is computationally expensive during run-time and will only work for environments where all the states and actions are deterministic.
* Learning methods (such as reinforcement learning) analyzes the current state of the game and pick a decision based on what it has learned from previous trials. Learning methods is all about letting the machine do the solving. The machine automatically adjust a set of weights dynamically to reflect what it is learning. The problem with learning methods is that the developer (humans) have to design the reward methods to let the machine know whether it is making good choices vs bad choices. This is especially difficult for long term reward functions. In a game like 2048, it may take thousands of moves to reach 2048. It is also not easy to tell mid-game whether a state is bad or good.

The SOAR language is similar to prolog, it's execution strategy is a form of search called "depth-first search" with some backtracking. By this nature, SOAR may be more suited to search-based methods. So if you'd like to do research into search based algorithms and implement that in SOAR for 2048, I'd think that would be interesting to see. Definitely an extra credit thing though.

### Why this is a interesting Problem?
* It has a random componenet, it is impossible to predict teach time the new tile will be placed. It is impossible to have an algorithm that will solve this each time in the same way. The best way to handle this, is to determine what is likely to be the best move at every stage and play the probability game :)
* At any point we have only four move to choose from, challange is to figure out which if these four moves will going to be one that has best long-term outcome.

### Solution - Logic/Strategy
* Once we have the below scquence we can simply execute merge and win.(2-2-4-8-16-32-64-128-256-512-1024)
* Moves to 2048 will be [R-R-D-L-L-L-D-R-R-R]
* We mean that always leep your biggest tile in the corner. We need to accu,ulate all the tiles in the bottom row and biggest in the corner. So most of the times we will focus on down and right.
* Sometimes tiles will spawn such that you cannot move right or down. In such a case, we need to move left, but never move up. It would be difficult to recover if we move up in later part of the game.

| Col1 | Col2| Col3 |Col4 |
| :--- |:---:| ---: |---: |
|      |     |      |     |
|      |  2  |  2   | 4   |
|  64  | 32  |  16  | 8   |
|  128 | 256 |  512 | 1024|





## LINKS
* [2048 AI RUNS[ : http://ronzil.github.io/2048-AI/]
* [Discussion Random Moves[ : https://stackoverflow.com/questions/22342854/what-is-the-optimal-algorithm-for-the-game-2048/23853848#23853848
* https://www.quora.com/What-is-the-logic-for-cracking-the-2048-puzzle


