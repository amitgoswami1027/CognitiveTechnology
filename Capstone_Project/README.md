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

## Solution - Logic/Strategy

### Challanges and Baseline
* One of the method to take advantage in this game is to put the tiles with larger values at the corner and edges, but randomness makes this strategy risky. Sometimes these larger values tiles are forces to move to the center which no other move possible and newly generated tile may block large value tiles to go back to edges.

### STRATEGY : 01 - AI Strategy in Older days - EXPERT SYSTEMS
* Approach to the AI Programmers in the older/initial days was to simply program the ideals that programmer has in his mind. This results in alot of rules into the 
  system. Though this approach was sucessful but its brittle and hard. This types of rule based systems mature and in-corporated and is also known as "Expert 
  Systems". (Heuristic Based)
* Another Approach is if we can give every position a rating and then choose the best score amount the all the possible options. 

### STRATEGY : 02 - Basis Experience of playing game multiple times, we found the pattern
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


### STRATEGY : 03 - Tree Search
* Tree Search is one of the basis method in AI. It try to search for the possible future states and find the one with the highest possibility to win the game.We can make use of DFS with the given depth to find the all possible states and record the score at each phase and select the patch that recieve the highest score. 

### STRATEGY : 04- ExpectiMax Search (Recommanded Approach for Expectimax Algo Implementation)
#### ABOUT THE ALGO
* Its Specilized verion of the MiniMax Algo. 
* Difference is that in Expectimax, instead of minimizer trying to minimize the overall utility of the game, MIN node take action by chance and value associated to the min node is the expected value of utility of the states it may take. 
* Expectimax algo search, all the possible states of the game at the particular depth and evaluate how good the state is using the Heuristic functions in the leave nodes. 
* After getting the value, algo carry it up using the branches and evaluate the value of each min and max nodes and finally the agent which is represented by the MAX node will take the action.

### 2048 PROBLEM 
* We define MAX node as AI Agent, while MIN node as the game itself, which randomly places a newly generated tile on the emply grid on the board after each move. 
* Agent first first simulate the four actions it can take and pass the state to the MIN node. MIN Node evalaute the value by listing down all the possible values of all the states that the new tile will possibly be, take the expected valueof all those states.  If we run this logic recursively, we get the following working expectimax tree for single player game.
  ![Image](https://user-images.githubusercontent.com/13011167/94126181-e92e2b80-fe74-11ea-8918-109f66a89d7f.png)
* To evaluate each state (WITH EXPECTIMAX ALGO), we make use of the certain Heuristics:
  * PATTERN HEURISTICS: Tile with highest values should be at the corner and second and third tiles should form the "MONOTONICITY".
  
    ![image](https://user-images.githubusercontent.com/13011167/94126707-91dc8b00-fe75-11ea-9374-e5a0d4688672.png)
  * CLUSTER HEURISTICS: 
    * After some trials, we found out that the previous heuristics is not enough to keep the tiles with large value all together. Although three tiles with the
      largest value has a high probability to stay at one corner, some of the other tiles are spread to two edges, at an opposite corner of the board.
    * In order for the tiles of the similar value to be close to one another, we make use of the penalty to tiles that stay close together but 
      have the different value. In order for the agent to minimize the penalty, tiles with large value should come close together to form a cluster, while tiles 
      with small values only introduce a smaller penalty because they are small in absolute value compare to the larger one, so this heuristics should have minimal 
      effect on the merging of smaller tiles.
    
    ```
    penalty = 0
      for each cell on the board as i:
          for each neighbour of i as j:
               penalty = penalty + absolute(value[i] - value [j])
          end loop
      end loop
    ```
  * MONOTONIC HEURISTICS: Tiles should be aligned in increasing or decresing values. To implement this heuristics, we give reward to the states where the tile in 
    the lower edge and right edge that align monotonically. We keep the other nine cells away from this calculation of this heuristics to make
    the merging of the tiles with smaller values remain unaffected.
     ![image](https://user-images.githubusercontent.com/13011167/94127480-9eadae80-fe76-11ea-84e6-e738197bc801.png)
    * The expectimax search algorithm together with the above heuristics gives better result than the simple tree search in our first approach.
    * Basis the research and experimentaiton it is found, Expectimax agent on average can reach a score higher than 20000, with 79% of chance winning a game. It 
      even can form a 4096 tile in some rare cases.
     ![image](https://user-images.githubusercontent.com/13011167/94127701-d9afe200-fe76-11ea-9af6-bb2a770f87fc.png)

    #### ABOUT THE -MINIMAX ALGORITHM : 
    * This algo can be used for building an AI for two player board game with alternative moves. It's the strategy where maximum node represents best move to make 
      for highest gain while minimum is the worst move which opponent can make. Manimax is a kind of backtracking algorithm that is used in the game theory to find 
      the optimal move of the player.In Minimax the two players are called maximizer and minimizer. 
    * The maximizer tries to get the highest score possible while the minimizer tries to do the opposite and get the lowest score possible. Every board state has a 
      value associated with it. The values of the board are calculated by some heuristics which are unique for every type of game.
    * Our goal is to find the best move for the player. To do so, we can just choose the node with best evaluation score. To make the process smarter, we can also 
      look ahead and evaluate potential opponent's moves.
    * Technically, we start with the root node and choose the best possible node. We evaluate nodes based on their evaluation scores. In our case, evaluation 
      function can assign scores to only result nodes (leaves). Therefore, we recursively reach leaves with scores and back propagate the scores. As this is a 
      backtracking algorithm so it tries all possible moves before taking the final decision which move is the best.
      ![image](https://user-images.githubusercontent.com/13011167/93713698-29db2b80-fb7b-11ea-9f64-62e607156e1d.png)
    * Maximizer starts with the root node and chooses the move with the maximum score. Unfortunately, only leaves have evaluation scores with them, and hence the 
      algorithm has to reach leaf nodes recursively. In the given game tree, currently it's the minimizer's turn to choose a move from the leaf nodes, so the nodes 
      with minimum scores (here, node 3 and 4) will get selected. It keeps picking the best nodes similarly, till it reaches the root node
    * This algo can be optimized by using the alpha-beta pruning for optimization. 

## IMPLIMENTATION

### SOME POINTERS HELPFULL 
* There are two important differences between the SUPERSTATE and the TOP state. First, the top state doesn’t have any augmentations relating to an impasse, nor does it have a superstate. Instead, the top state has “^superstate nil”. The second difference is that only the top state has “io,” “input-link,” and “output-link ” augmentations that connect to the perception and action systems. There are no independent  “ nput-link” and “output-link” structures in substates, although it is possible to copy pointers to the top state structures in the substates. 

```
## Project CapStone
# Amit Goswami

visualize image-type jpg
visualize architectural-wmes on

epmem -e
epmem --set timers off

#rl --set learning on
#indifferent-selection –-epsilon-greedy
#indifferent-selection -g

############################################################
#Initializing the Board Game and Inputs for the 2048 Game 
###########################################################

sp {  propose*init
      (state <s> ^superstate nil
                -^init-game)
  -->
     (<s> ^operator <op> + )
     (<op> ^name init-game)
}

sp {  apply*init
      (state <s> ^operator <op>
                 ^io.input-link <input>)
      (<op> ^name init-game)
  -->
     (<s> ^init-game true)
     (<s> ^reset false)
     
     (<s> ^up false)
     (<s> ^down false)
     (<s> ^right false)
     (<s> ^left false)

     (<input> ^block0 <block0> ^block1 <block1> ^block2 <block2> ^block3 <block3>
              ^block4 <block4> ^block5 <block5> ^block6 <block6> ^block7 <block7>
              ^block8 <block8> ^block9 <block9> ^block10 <block10> ^block11 <block11>
              ^block12 <block12> ^block13 <block13> ^block14 <block14> ^block15 <block15>)
   
     (<block0> ^name block0-0 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val000> ^dblock <val001> ^rblock <val002> ^lblock <val003> ^wall <dir0> ^change.count <cal0>)
     (<block1> ^name block0-1 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val010> ^dblock <val011> ^rblock <val012> ^lblock <val013> ^wall <dir1> ^change.count <cal1>)
     (<block2> ^name block0-2 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val020> ^dblock <val021> ^rblock <val022> ^lblock <val023> ^wall <dir2> ^change.count <cal2>)
     (<block3> ^name block0-3 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val030> ^dblock <val031> ^rblock <val032> ^lblock <val033> ^wall <dir3> ^change.count <cal3>)

     (<block4> ^name block1-0 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val100> ^dblock <val101> ^rblock <val102> ^lblock <val103> ^wall <dir4> ^change.count <cal4>)
     (<block5> ^name block1-1 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val110> ^dblock <val111> ^rblock <val112> ^lblock <val113> ^wall <dir5> ^change.count <cal5>)
     (<block6> ^name block1-2 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val120> ^dblock <val121> ^rblock <val122> ^lblock <val123> ^wall <dir6> ^change.count <cal6>)
     (<block7> ^name block1-3 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val130> ^dblock <val131> ^rblock <val32> ^lblock <val133> ^wall <dir7> ^change.count <cal7>)

     (<block8> ^name block2-0 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val200> ^dblock <val201> ^rblock <val202> ^lblock <val203> ^wall <dir8> ^change.count <cal8>)
     (<block9> ^name block2-1 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val210> ^dblock <val211> ^rblock <val212> ^lblock <val213> ^wall <dir9> ^change.count <cal9>)
     (<block10> ^name block2-2 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val220> ^dblock <val221> ^rblock <val222> ^lblock <val223> ^wall <dir10> ^change.count <cal10>)
     (<block11> ^name block2-3 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val230> ^dblock <val231> ^rblock <val232> ^lblock <val233> ^wall <dir11> ^change.count <cal11>)

     (<block12> ^name block3-0 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val300> ^dblock <val301> ^rblock <val302> ^lblock <val303> ^wall <dir12> ^change.count <cal12>)
     (<block13> ^name block3-1 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val310> ^dblock <val311> ^rblock <val312> ^lblock <val313> ^wall <dir13> ^change.count <cal13>)
     (<block14> ^name block3-2 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val320> ^dblock <val321> ^rblock <val322> ^lblock <val323> ^wall <dir14> ^change.count <cal14>)
     (<block15> ^name block3-3 ^value 0 ^u 0 ^d 4 ^l 16 ^r 0 ^ublock <val330> ^dblock <val331> ^rblock <val332> ^lblock <val333> ^wall <dir15> ^change.count <cal15>)

}

##########################################################
#Cleaning the Output Link and other Variables.
##########################################################

sp { top*propose*cleanupOutput1
     (state <s> ^superstate nil 
                ^io.output-link <output>)
     (<output> ^<cmd> <id>)
     (<id> ^status)
     (<s> ^reset true)
-->
     (<s> ^operator cleanOut + !)
}

sp { top*apply*cleanupOutput1
     (state <s> ^operator <op> 
                ^superstate nil 
                ^io.output-link <output>)
     (<output> ^<cmd> <id>)
     (<id> ^status)
     (<s> ^reset true)
-->
     (<output> ^<cmd> <id> -)
     (<s> ^reset true -)
     (<s> ^reset false)
}

##############################################################
#Proposing the Operators for Up, Down, Right and Left and 
#choosing between then basis the logic for the movement
#############################################################
     
sp { propose*move-up
    (state <s> ^superstate nil)
    (<s> ^io.input-link <input>)
    (<input> ^block0 <block>)
-->
    (<s> ^operator <o> + )
    (<o> ^name move
         ^direction u)
}

sp { propose*move-down
     (state <s> ^superstate nil)
     (<s> ^io.input-link <input>)
     (<input> ^block0 <block>)
-->
     (<s> ^operator <o> + )
     (<o> ^name move
          ^direction d)
}

sp { propose*move-left
     (state <s> ^superstate nil)
     (<s> ^io.input-link <input>)
     (<input> ^block0 <block>)
-->
     (<s> ^operator <o> + )
     (<o> ^name move
          ^direction l)
}

sp { propose*move-right
     (state <s> ^superstate nil)
     (<s> ^io.input-link <input>)
     (<input> ^block0 <block>)
-->
     (<s> ^operator <o> + )
     (<o> ^name move
          ^direction r)
}


#####################################################################
# Apply Logic for moves
####################################################################

sp {apply*move
     (state <s> ^operator.direction <dir>
                ^io.output-link <output>)
-->
     (<output> ^command.name move
               ^move.direction <dir>)
      (write (crlf) |moving: | <dir>)
}


#gp { propose*moves
#     (state <s> ^io.input-link <input>)
#                (<input> ^status ok
#                         ^move-num <mn>)
#-->
#   (<s> ^operator <o> + =)
#   (<o> ^direction [left right up down])
#}

#sp { apply*move*remove
#:o-support
#    (state <s> ^io.output-link <output>)
#    (<output> ^move <move>
#              ^command <cmd>)
#    (<move> ^status complete)
#    (<cmd> ^status complete)
#-->
#    (<output> ^move <move> -
#              ^command <cmd> -)
#     (write (crlf) |removing move command|)
#}

#sp {propose*moves
#   (state <s> ^io.input-link (^status ok
#                              ^move-num <mn>))
#-->
#   (<s> ^operator <o1> + = .5
#        ^operator <o2> + = .9
#        ^operator <o3> + =  .1
#        ^operator <o4> + = .8)
#        (<o1> ^direction left)
#        (<o2> ^direction right)
#        (<o3> ^direction up)
#        (<o4> ^direction down)}

##############################################################
#Breaking the Impasse and selecting the particular direction
##############################################################

sp { propose*Substate*BreakImpasse
     (state <s> ^impasse tie)
     (<s> ^io.input-link <input>)
     (<s> ^board.block0 <board>)
     
     (<input> ^block0 <block>)
     (<s> ^item <o1>)
     (<s> ^item <o2>)
     (<s> ^item <o3>)
     (<s> ^item <o4>)
     (<o1> ^name move 
           ^direction u)
     (<o2> ^name move 
           ^direction r)
     (<o3> ^name move 
           ^direction l)
     (<o4> ^name move 
           ^direction d)
     (<board> -^up true)
     (<board> -^right true)
     (<board> -^left true)
     (<board> -^down true)
    -->
     (<s> ^operator <o> + =)
     (<o> ^name breakImpasse)
     (<o> ^name1 move 
          ^direction u)
     (<o> ^name2 move 
          ^direction r)
     (<o> ^name3 move 
          ^direction l)
     (<o> ^name4 move 
          ^direction d)
}

sp { apply*Substate*BreakImpasse
     (state <s> ^operator <o>)
     (<o> ^name breakImpasse)
     (<o> ^name1 <name1>)
     (<o> ^name1 <name2>)
     (<o> ^name1 <name3>)
     (<o> ^name1 <name4>)      
     
     (<s> ^superstate <ss>)
     (<ss> ^operator <o1> +)
     (<ss> ^operator <o2> +)
     (<ss> ^operator <o3> +)
     (<ss> ^operator <o4> +)
     
     (<o1> ^name move ^direction u)
     (<o2> ^name move ^direction r)
     (<o3> ^name move ^direction l)
     (<o4> ^name move ^direction d)
-->
    (<ss> ^operator <o1> + = 0.3)
    (<ss> ^operator <o2> + = 0.9)
    (<ss> ^operator <o3> + = 0.5)
    (<ss> ^operator <o4> + = 0.8)
}


######################################################################################################
# Fetching the inputs and other details related to the Board using the episodic memory!!
#####################################################################################################

sp { propose*search
     (state <s> ^impasse tie)
   -->
     (<s> ^operator <o> + =)
     (<o> ^name search)
     (write (crlf) |tie, proposing to handle|)
}

sp { apply*search
     (state <s> ^operator.name search
                ^superstate <ss>
                ^epmem.command <ec>)
          (<ss> ^io.input-link <b>)
   -->
          (<ec> ^query <q>)
          (<q> ^io <io>)
          (<io> ^input-link <b>
                ^output-link.move <m>)
}

sp {use*search*result
:interrupt
   (state <s> ^superstate <ss>
              ^epmem.result.success <q>
              ^item <o>)
   -->
   (<ss> ^operator <o> + =)}


###########################################################################
# Elaboration Rules
##########################################################################

sp  { elaborate*vote-down
      (state <s> ^impasse tie)
     # (<s> ^superstate <ss>)
      (<s> ^epmem.result.retrieved.io.input-link <blocks>)
      (<blocks> ^<block> <blocks>)
      (<blocks> ^value <value>)
      (<blocks> ^d = <value>)
      (<blocks> ^value > 0)
-->
      (write (crlf) |voting down|)
      (<blocks> ^down true)
}

sp {elaborate*vote-left
    (state <s> ^impasse tie)
    (<s> ^epmem.result.retrieved.io.input-link <blocks>)
    (<blocks> ^<block> <blocks>)
    (<blocks> ^value <value>)
    (<blocks> ^l = <value>)
    (<blocks> ^value > 0)
-->
    (write (crlf) |voting left|)
    (<blocks> ^left true)
}

sp {elaborate*vote-right
    (state <s> ^impasse tie)
    (<s> ^epmem.result.retrieved.io.input-link <blocks>)
    (<blocks> ^<block> <blocks>)
    (<blocks> ^value <value>)
    (<blocks> ^r = <value>)
    (<blocks> ^value > 0)
-->
    (write (crlf) |voting right|)
    (<blocks> ^right true)
}


sp {elaborate*state*name
    (state <s> ^superstate.operator.name <name>)
-->
    (<s> ^name <name>)
}

sp { elaborate*state*top-state
     (state <s> ^superstate.top-state <ts>)
-->
     (<s> ^top-state <ts>)
}

sp { elaborate*top-state*top-state
     (state <s> ^superstate nil)
-->
     (<s> ^top-state <s>)
}

sp {elaborate*state*io
    (state <s> ^superstate.io <io>)
-->
    (<s> ^io <io>)
}


########################################################################################################################
#Rule Template : Rule templates allow Soar to dynamically generate new RL rules based on a predefined pattern as the 
#agent encounters novel states. This is useful when either the domains of environment dimensions are not known ahead of 
#time, or when the enumerable state space of the environment is too large to capture in its entirety using gp, but the 
#agent will only encounter a small fraction of that space during its execution.Templates give the programmer the 
#convenience of the gp command without lling production memory with unnecessary rules.
#######################################################################################################################

sp { generated*rule*template
     :template
     (state <s> ^operator <op> +)
     (<op> ^name move ^direction r)
     (<s> ^io.input-link <input>)
     # (<op> ^name move ^direction r) 
     (<input> ^block0.value <val0>)
     (<input> ^block1.value <val1>)
     (<input> ^block2.value <val2>)
     (<input> ^block3.value <val3>)
     (<input> ^block4.value <val4>)
     (<input> ^block5.value <val5>)
     (<input> ^block6.value <val6>)
     (<input> ^block7.value <val7>)
     (<input> ^block8.value <val8>)
     (<input> ^block9.value <val9>)
     (<input> ^block10.value <val10>)
     (<input> ^block11.value <val11>)
     (<input> ^block12.value <val12>)
     (<input> ^block13.value <val13>)
     (<input> ^block14.value <val14>)
     (<input> ^block15.value <val15>)
-->
    (<s> ^operator <op> = 0)
}

sp { generated*rule*template
     :template
    (state <s> ^operator <op> +)
    (<op> ^name move ^direction r)
    (<s> ^io.input-link <input>)
    (<input> ^<block>.value > 0)
    (<input> ^<block>.value <val>)
    (<input> ^<block>.u <uVal>)
    (<input> ^<block>.l <lVal>)
    (<input> ^<block>.r <rVal>)
    (<input> ^<block>.d <dVal>)
-->
    (<s> ^operator <op> = 0)
}

sp { generated*rule*template
     :template
     (state <s> ^operator <op> +)
     (<op> ^name move ^direction l)
     (<s> ^io.input-link <input>)
     (<input> ^<block>.value > 0)
     (<input> ^<block>.value <val>)
     (<input> ^<block>.u <uVal>)
     (<input> ^<block>.l <lVal>)
     (<input> ^<block>.r <rVal>)
     (<input> ^<block>.d <dVal>)
-->
     (<s> ^operator <op> = 0)
}

sp { generated*rule*template
     :template
     (state <s> ^operator <op> +)
     (<op> ^name move ^direction d)
     (<s> ^io.input-link <input>)
     (<input> ^<block>.value > 0)
     (<input> ^<block>.value <val>)
     (<input> ^<block>.u <uVal>)
     (<input> ^<block>.l <lVal>)
     (<input> ^<block>.r <rVal>)
     (<input> ^<block>.d <dVal>)
-->
     (<s> ^operator <op> = 0)
}


####################################################################
# Halting the Soar Program after 25 runs
###################################################################

#sp { propose*halt
#     (state <s> ^io.input-link.round <r> > 25)
#  -->
#     (<s> ^operator <o> + >)
#     (<o> ^name halt)
#}

#sp { apply*halt
#     (state <s> ^operator.name halt)
#  -->
#     (write |reached max rounds, halting|)
#     (halt)
#}

##################################################################

```

## LINKS
* [2048 AI RUNS[ : http://ronzil.github.io/2048-AI/]
* [Discussion Random Moves[ : https://stackoverflow.com/questions/22342854/what-is-the-optimal-algorithm-for-the-game-2048/23853848#23853848
* https://www.quora.com/What-is-the-logic-for-cracking-the-2048-puzzle
* https://github.com/HermanZzz/Smart-2048
* https://rosettacode.org/wiki/2048

