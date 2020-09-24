## COGNITIVE TECHNOLOGY - MY Notes for Reference

1. INTRO: Many Disciplines contribute to the field of Cognitive Science that include psychology, linguistics,anthropology, and 
   artificial intelligence.
   #### COGNITIVE PHENOMENA - phenomena like problem solving, decision making,language, memory, and learning.

2. IDEA OF ARCHITECTURE
   Unified theories of cognition (UTCs) - unified theory of cognition means trying to find a set of computationally-realizable 
   mechanisms and structures that can answer all the questions we might want to ask about cognitive behavior. A key piece of  
   the puzzle, we believe, lies in the idea of architecture.

   BEHAVIOR = ARCHITECTURE + CONTENT Using this idea, we can define a cognitive architecture as a theory of the fixed  
   mechanisms and structures that underlie human cognition. Factoring out what is common across cognitive behaviors across the 
   phenomena explained by microtheories, seems to us to be a significant step toward producing a unified theory of cognition.

3. WHAT COGNITIVE BEHAVIORS HAVE IN COMMON
   What sort of behaviour should we model in SOAR Architecutre. A cognitive architecture must help produce cognitive behavior. 
   Reading certainly requires cognitive ability. So does solving equations, cooking dinner, driving a car,telling a joke, or 
   playing baseball. In fact, most of our everyday behavior seems to require some degree of thinking to mediate our 
   perceptions and actions. Because every architecture is a theory about what is common to the content it processes, Soar is a 
   theory of what cognitive behaviors have in common. In particular SOAR theory posits that cognitive behaviour has at least 
   the following characteristics
   * 1. It is Goal Oriented.
   * 2. It takes place in a rich, complex, detailed environment
   * 3. It requires a large amount of knowledge
   * 4. It requires the use of symbols and abstraction
   * 5. It is flexible, and a function of the environment
   * 6. It requires learning from the environment and experience

   #### BEHAVIOR = ARCHITECTURE + CONTENT

  How can we express the different kinds of knowledge the model must have so that it acts in a goal oriented way?representing 
  the knowledge in terms of goals, states, and operators and guiding the choice of which operator to apply by the principle of 
  rationality.

4. BEHAVIOUR AS A MOVEMENT THROUGH PROBLEM SPACES
   What knowledge becomes part of the state and what knowledge becomes part of the operators? How do we know what an operator 
   application will do? How do we know when the goal has been achieved? To answer these questions, the next section describes 
   how Soar supports goals, problem spaces, states and operators.

5. TYING THE CONTENT TO THE ARCHITECTURE
   Architecture must support what is common across many domains, its mechanisms must process a domain-independent level of 
   description. What is common across all domains and problems? In Soar, it is the decomposition of knowledge into goals, 
   problem spaces, states, and operators that is common across all problems. h

### SOAR ARCHITECTURE
* What is SOAR ( State, Operator And Result)
* WHAT IS SOAR : Unified Architecture for building the intelligent systems

### SOAR SETUP 
Supported Development Tools/Libraries and Required Downloads 
* Computer with Java installed (1.8.0_144 required) - Mac highly recommended 
* VS Code (App Store) or Install Eclipse
* Graphviz

#### Official Soar Manual
To facilitate continual updating and improvement of the Soar manual, it is no
longer distributed as part of the binary release.  The latest version can be
found at:

https://soar.eecs.umich.edu/downloads/SoarManual.pdf

#### Launching
* Navigate to the folder you extracted to
* Launch Soar
  * To launch Soar within a graphical user interface
     * Windows users, run SoarJavaDebugger.bat
     * Linux and Mac users, run SoarJavaDebugger.sh
  * To launch Soar using a command line interface,
    * Windows users, run Soar_CLI.bat
    * Linux and Mac users, run Soar_CLI.sh
    * You can also navigate to the /bin directory in a terminal and run the Soar executable directly

Launch options for the CLI and the java debugger are listed at the bottom of this document.

#### Soar-CLI Command Line Options
    -l            Listen on, i.e. launches Soar kernel in new thread
    -n            No syntax coloring (for people on light background or on 
                  Windows, which doesn't support our color codes.  Also turning 
                  off color does speed up printing.)
    -p <port>     Listens on port <port>
    -s <file>     Sources file <file> on load

To manage multiple agents, you can use the commands "create", "list", and 
"switch".  These are Soar-CLI commands, not native Soar commands.  They are 
not available in other interfaces, for example the Soar Java Debugger.

#### Soar Java Debugger Command Line Options
    -remote             Use a remote connection (with default ip/port)
    -ip xxx             Use this IP value (implies remote connection)
    -port ppp           Use this port (implies remote connection, without any 
                        remote options we start a local kernel)
    -agent <name>       On a remote connection select this agent as initial 
                        agent
    -agent <name>       On a local connection use this as the name of the 
                        initial agent
    -source <path>      Load this file of productions on launch (only valid 
                        for local kernel)
    -quitonfinish       When combined with source causes the debugger to exit 
                        after sourcing that one file
    -listen ppp         Use this port to listen for remote connections (only 
                        valid for a local kernel)
    -maximize           Start with maximized window
    -width <width>      Start with this window width
    -height <height>    Start with this window height
    -x <x> -y <y>       Start with this window position
    -cascade            Cascade each window that starts (offseting from the 
                        -x <x> -y <y> if given). This option now always on. 
                        Note that providing width/height/x/y => not a maximized 
                        window.

If you have problems with the debugger, try deleting any .soar* files in your 
home directory.  Corrupt settings can cause the java debugger to fail to launch.

## SOAR COURSE INTRODUCTION
### Section-02: Soar Introduction,The Decision Cycle, Working memory, Procedural Memory, Example 1 Weather, Guided Example 1-1 
Weather revised, Guided Example 1-2 Debugger set up, Self-assessment 1 AND Project 1 Echo. - *MY NOTES*

* For example, a Soar program for playing chess would have an initial state that de-scribed the board and the positions of the pieces. Its operators would supply knowl-edge about how to transform a state by moving a piece. Knowledge about the desired states would describe what it means to win the game: checkmate.

#### SOAR DECISION CYCLE
* PROPOSE => DECISION => APPLICATION
#### EXAMPLE: 
* Proposal - 'What are all the things that I could do right now'
* Decision - 'I can only do one thing at once, which one should I pick?'
* Application - 'Now that I picked one thing to do, I can now actually do it'
* Multitasking is an illusion.

* For example, a Soar program for playing chess would have an initial state that described the board and the positions of the pieces. Its operators would supply knowledge about how to transform a state by moving a piece. Knowledge about the desiredstates would describe what it means to win the game: checkmate.

![image](https://user-images.githubusercontent.com/13011167/84102103-2c32d300-aa2d-11ea-89e6-cfd083edabfb.png)

Real world example: We are building an agent to play a simple video game. The locations of the enemies and our player's health 
are loaded into the input link, which allows us to propose operators based on that knowledge. The direction our character 
moves and the moves it makes are sent back to the video game on the output link.

#### WORKING MEMORY
Working memory contain all SOAR AGENT dynamic information about its world and internal reasoning. In SOAR WM is organized as the Garph structure in STATES. SOAR has two kinds of nodes:
* IDENTIFIERS : Nodes that has Links emerging from them. Only Identifiers have ATTRIBUTES
* CONSTANTS : Nodes that does not have Links emerging from them.
* LINKS: Links are called ATTRIBUTES in SOAR and is prefaced by "^". 
* OBJECTS : Collection of working memory elements that share the same IDENTIFIER is called OBJECT.
* AUGMENTATIONS: Working memory elements that make up the OBJECT are called AUGMENTATIONS.

OBJECTS are usually written as a list of augmentations surrounded by parenthesis. 

![image](https://user-images.githubusercontent.com/13011167/84102801-0e666d80-aa2f-11ea-8d7b-86c4dd4b1454.png)

Soar has a decision cycle to makes decisions. At the input step, it checks the input Working Memory for values. In the 
proposal step, Soar utilizes procedural memory rules to create operators if the situation is correct (ie. certain working 
memory elements in the rules match). The operator decision step is automatic but requires special tuning that we'll talk about 
later. This is where Soar picks one and only one operator. At the operator application step Soar checks which rules match the 
situation and have the selected operator. Finally, in the Output step Soar outputs to the working memory. The cycle then 
repeats.

#### Procedural Memory
Let's assume for the purposes of this example that our environment will tell us it is raining with the use of input-link variable. We'll 'pack the umbrella' by placing an attribute/value pair of pack/umbrella on the output-link.
Proposal Rule 1: If it is raining outside then create an operator 'ItsRaining' Apply Rule 1: If an operator exists in the working memory called 'ItsRaining' and it was selected in the decision phase then put pack/umbrella on the output link

![image](https://user-images.githubusercontent.com/13011167/84103152-e1ff2100-aa2f-11ea-9d31-a54a2db472fe.png)

### Specific Rule Syntax
#### Proposal Rules: Check if the situation is correct for an action to occur, propose that we do the action. 
* Conditions: The conditions of the proposal rules ensure that the situation is good fit by matching elements in the working 
memory
* Actions: By referencing the variables in the 'Conditions' Section, code in this section creates an Operator in the Working 
Memory. One important thing, the decision's action isn't occurring here (ie. the cake doesn't get baked or the robot doesn't 
move). The 'action' in this case is proposing that the action take place.
#### Operator Decision: This step is automatic. SOAR picks a single operator to apply.SOAR notated this by adding another '
Operator' link on it.
#### Application Rules :Check if the situation is correct and do the action. Checking the situation' in this case has three 
requirements: The operator is in the working memory, it was selected in the 'Operator Decision Phase', and any other working memory elements match (like proposal rules).
* Conditions: Check the working memory to see if a certain operator exists and has a preference (More on this in later 
sections) and to check that other Working Memory Elements Exist (if needed).
* Actions: By referencing the variables in the 'Conditions' Section, code in this section performs the action by adding modifying/adding working elements.

SOAR looks at all the proposal rules to see if the situation is correct for the 'Actions' section to run. It does this by 
taking all the conditions and building out a Conditional Graph. If this conditional graph is a subgraph of the Working Memory, 
the proposal's 'Action' section will run, creating an operator. The below WM has two operators in memory, but there could be 
as many more, one for every rule match. Operators created by rules that don't match will not appear in working memory.

## PROJECT01

### Section-03: Variables, Advance Rules, Memory Persistance, Operator Persistance - MY NOTES
#### Memory Persistence
#### Proposal Rule
* As a reminder, proposal rules compare the Conditional Graph to the working memory and adds in an operator to it. These 
  operators will remain in the working memory for as long as all the conditions match in the proposal rule that created the 
  operator. Once one or more of the conditions in the proposal's condition section fail, the operator will be removed from the 
  working memory automatically. This type of memory is referred to as 'I supported' or Instantiation supported in the SOAR 
  documentation.
* If you do not invalidate one of the conditions in the 'Conditions' section of the proposal rule, the operator will stay 
  proposed, which will cause your Soar program to produce an error. Even if you want the same action occur in the next cycle, 
  you must retract the current operator.
#### Application Rule
* As a reminder, application rules examine the working memory for an operator and then adds/removes information to the memory. 
  Any changes made by these rules persistent until you remove them. They are not automatically removed, even if the proposal 
  rules (and their operators) that went into creating them no longer match/retract. This type of memory is referred to as 'O 
  supported' or Operator supported, since they were created by an operator.
* Memory created in these rules persist until you remove them with other rules.
* Leaving old memory sitting around could cause you issues in the future. It may cause some of your other rules to fire if you 
  are checking for this memory (and you didn't realize it existed there).
#### Operator Persistence
Operators should not persist into the next cycle. This is occurring since these changes persist. This shouldn't occur due to a 
theoretical reason: Soar operators should not exist across cycles as they should get all their work done in the application 
phase and then be removed.
### DECISION CYCLE : A Desision cycle is a fixed processing mechanism in soar architecture that does its work in five phases:
* Input : During input, working memory elements are created that reflect changes in perception.
* Elaboration : During elaboration, the contents of working memory are matched against the “if” parts of the rules in long-term memory. All rules 
that matches from procedure memory, fire in parallel, resulting in changes to the features and values of the state in additons to suggestions, or 
preferences , for selecting the current operator. As a result of working memory changes more rules can fire. Elaboration continues in parallel waves 
of rule firings unitl no more rule fires. QUIESCENCE in ELABORATION i.e absence of any further LTM rules, signal the start of the decision phase.
* decison 
* application and 
* output. 

## PROJECT03 - Notes for Reference
### Impasses and Substates
Whenever there is the Operator Tie and Soar cannot able to take the decision to which operator to apply, it is known as Impassess. Soar resolve this by creating the substates.Purpose of this new substate is to resolve the impasse. There are six different types of the Impasses which require different resolution methods. New substate is linked to our original state and contain the description of the issue. There are four type of Impasses:

#### Tie Impasse - A tie impasse arises if the preferences do not distinguish between two or more operators that have acceptable preferences. If two operators both have best or worst preferences, they will tie unless additional preferences distinguish between them.
#### Conflict Impasse- A conflict impasse arises if at least two values have conicting better or worse preferences (such as A is better than B and B is better than A) for an operator, and neither one is rejected, prohibited, or required.
#### Constraint Failure Impasse - A constraint-failure impasse arises if there is more than one required value for an operator, or if a value has both a require and a prohibit preference. These preferences represent constraints on the legal selections that can be made for a decision and if they conflict, no progress can be made from the current situation and the impasse cannot be resolved by additional preferences.
#### No-Change Impasse - A no-change impasse arises if a new operator is not selected during the decision procedure. There are two types of no-change impasses: state no-change and operator no-change:
* State no-change impasse | A state no-change impasse occurs when there are no acceptable (or require) preferences to suggest operators for the current state
(or all the acceptable values have also been rejected). The decision procedure cannot select a new operator.
* Operator no-change impasse | An operator no-change impasse occurs when either a new operator is selected for the current state but no additional productions
match during the application phase, or a new operator is not selected during the next decision phase.

## PROJECT04 - Notes for Reference
### Categorization of Human Memory
#### 1. PROCEDURAL MEMORY ("Knowing how"): is the unconcious memory of skills and how to do the things, particularly the use of objects or movements of body ,such as tying a shoelace, playing the guitar or riding a bike. These memories are typically acquired through repetition and practice and are composed of automatic sensorimotor behaviors that are so deeply embedded that we are no longer aware of them. 
#### 2. DECLARATIVE MEMORY ("knowing what"): is of two type: semantic and episodic. Semantic memory is recall of general facts while episodic memory is recall of personal facts. Remembering the capital of france and the rules for playing football uses semantic memory. Episodic memory represents our memory of experiences and specific events in time in a serial form, from which we can reconstruct the actual events that took place at any given point in our lives.

![image](https://user-images.githubusercontent.com/13011167/87876444-c0f9fa80-c9f5-11ea-8b18-01f025a6641b.png)

### A. SEMANTIC MEMORY - SM is used for storing the long term knowledge and facts. e.g red id color, fire is hot and sky is blue. It would be in-appropiate to store this in working memory , as this knowledge is always not necessary.

* Before we begin, be sure to Enable the semantic memory as it is disabled by default. The Soar Data loader enables it automatically, but if you are using the stock debugger, run the following command: "sem --set learning on"

#### How would you store this type of information - WORKING MEMORY CONENCTION.
* Semantic working memory  store a series of multiple disconnected graphs. These graphs are not initially connected to WM.
* SOAR construct the working memory out of the Identififers. Identifiers in the SM are reffered to as Long Term identifiers (LTI). These exisit only in the 
  Semantic Memory.
#### How are we able to retrieve this knowledge from Semantic memory?
* How can we link this knowledge from the semantic memory? We can do this by linking one of the LTIs to a short term identifiers (STI) that exits in WM. 
* In the WM graph - smem attribute exists which ultimately connects to the 'command'(command link is used to query the semantic memory. This link is updated in a 
  specific way to ask the semantic memory for specific knowledge) and 'result'(The result link is used to retrieve the knowledge. Information on this link should 
  not be modified or deleted) attributes. 
* The simplest way to add the semantic memory to soar is with a command in debugger.
#### STORING MEMORY : The simplest way to add Semantic memory to Soar is with a command in the debugger. The format above is relatively simple to follow, with new variables being created, and attribute/value and attribute/id pairs being used to create the graph. This information can also be stored in the .sem file within the Soar Data loader.
```STORING MEMORY
 smem --add{
 (<n1> ^name alice ^friend <n2>)
 (<n2>  ^name bob ^friend <n1> <n3>)
 (<n3> ^name charley) 
 
 Another way to add objects to semantic memory is by utilizing the 'store' link. The following command can be placed in the 'action' section of a rule:
 <s> ^sem.command.store <identifier>
 
 }
```
* All of semantic memory storing occurs just before the output phase in the decision making cycle. 
#### RETRIEVING MEMORY - Retriving semanitc memory is also done with command link. The retrieved memory is stored on the result link. There are two ways to retriving memory. Cue and NON-Cue.
* CUE - In cue retrievels, the agent searches for an LTI that matches the one supplied on the commandlink. 
```
<s> ^smem.command.query <cueID>. 
```
Since this operations occurs at the end of decision making cycle, the results will be available in the next cycle. The result from the operation will be stored here: 
```
<s> ^smem.result.retrieve <cueID> . 
```
Using the cueID, you can describe what LTI you are trying to retrieve.Cue retrievals are especially useful if you don't have any LTIs linked already.
If multiple LTIs match, Soar picks the one that was most recently used. This can be modified to pick based on a variety of different vectors.

* NON-CUE - Non-cue retrievels are done when you already have a STI in memory (which is linked to an LTI). 
```
<s> ^smem.command.retrieve <LTI>

The result of this is stored at:
<s> ^smem.command.retrieve <LTI>
```

### B. EPISODIC MEMORY - Storage of EM is automatic. During storage, Soar automatically stores the top state along with the attributes and values that resides below it. This storage appends this informaiton, storing it alongside all past experiences. EM is stored is controlled with two variables :
* PHASE: Controls which phase in the decison making process, storage take place at. 
* TRIGGER: The result that concludes an episode, adding the new augmentaiton to the output-link or each decision cycle.
* Episodic memory retrievel - Present-id displays the current iteration. The agent modifies the 'command' link and result, errors and metadata and returned on the 'result link. EM can be saved to your computer , so it can be loaded in if you need it. 
* FORCE Parameter: For Debugging purpose, the force parameter allows the user to manually request thaat an episode be recorded (or not) during the current decision cycle. BEehaviour is as follows:
  * The value of the force parameter is initialized to off every decision cycle.
  * During the phase of episodic storage, episodic memory tests the value of the force parameter; if it has a value other than of o, episodic memory follows the 
    forced policy irrespective of the value of the trigger parameter.

Upon creation of the new state in WM,architecture creates the following augmentations to facilitate agent interaction with episodic memory:
```
(<s> ^epmen <e>)
(<e> ^command <e-c>)
(<e> ^result <e-r>)
(<e> ^present-id #)
```
As rules augment the command structure in order to retrieve episodes (7.3), episodic memory augments the result structure in response.The value of the present-id augmentation is an integer and will update to expose to the agent the current episode number. This information is identical to what is available via the time statistic.

#### RETRIEVING THE EM
* CUE Based Retrieval:  With this we try to find the best match. We describe the top state using structures we want and structures we don't want. Use the following links of this:

```
<s> ^epmem.command.query <required-que>
<s> ^epmem.command.neg-query <operational-negative-que>
```
The cue-based retrieval process can be thought of conceptually as a nearest-neighbor search.

* Absolute Non-Cue: This is based of time. Each episode is given a time when it is stored. These episode can be retrieved by specifying a time:

```
<s> ^epmem.command.retrieve time
```
* Relative Non-Cue: After retrieving an episode, Soar stores the time linked to it. You can go to the next episode in time, or the previous using the commands:
```
<s> ^epmen.command.next <n>
<s> ^epmen.command.previous <p>
```

#### EM is a record of an agent's stream of experiences. EM mechanism will automatically record episodes as a Soar agent executes. The agent can later deliberately retrieve episodic knowledge to extract information and regularities that may not have noticed during the original experience and combined them with the original knowledge to improve the preformance of the future tasks. 


## PROJECT05 - Reinforcement Learning
#### Reinforcement Learning Goal: Learn an optimal action policy; given an environemnt that provides states, affords actions and provides feedback as numerical rewards, maximize the expected futrue reward. Soar RL mechanism learns Q-values for state operator pairs. Q-values are stored as numeric indifferent preferences created by specially productions called "RL Rules". 

#### Type of Operator Preferences: First, acceptability (+): only acceptable operators are considered for application. Acceptable preferences must be further described as either relatively differentiated or indifferent.
* Differentiated: Differentiated preferences (such as > and <) establish a relative ordering from which Soar will choose the most preferred operator.
* Indifferent: If all preferences are labeled as indifferent (=), Soar’s random operator choice can be further affected by numerical indifferent parameters.

#### RL RULES : RL rules are identied by syntax. A production is a RL rule if and only if its left hand side tests for a proposed operator, its right hand side creates a single numeric-indifferent preference, and it is not a template rule. We define an RL operator as an operator with numeric-indiferent preferences created by RL rules.

```
#RL Need to be enabled before running the agent.
#rl -s learning on

sp {rl*3*12*left
   (state <s> ^name task-name
              ^x 3
              ^y 12
              ^operator <o> +)
   (<o> ^name move
        ^direction left)
   -->
    (<s> ^operator <o> = 1.5)
  }

```
#### Reqard Update Rules: Reward update rules are written as elaboration rules that change the reward link. By adding a 'reward.link' value, Soar will be able to determine whether the decision it has been is positive or negative. It is usually best to write these rules as elaboration rules (i-supported instead of o-supported).

#### CHUNKING : Chunking is an automatic process in Soar where rules are generated based on the knowledge obtained. When Soar is stuck when deciding, a substate is created. Once the impasse is resolved, the knowledge used to resolve it is lost. Chunking allow Soar to generate rules to 'remember' the knowledge used to resolve the impasse. Therefore, it is important to make decisions in substates, as it allows Soar to learn information.
* Chunking is SOAR's experience based mechanism for learning new procedural knowledge. Chunking utilizes SOAR's "impasse driven model" for problem decomposition into sub-goals to create new productions dynamically during task execution. These new Prodcutions are called CHUNKs, summarize the substate problem solving that 
occuered which led to new knowledge in a superstate. When new rule fires and creates such new superstate knowledge, which is called RESULTS. SOAR learns the new 
rule and immediately add to the production memory. In future similar situations, the new chunk will fire and create the appropriate results in a
single step, which eliminates the need to spawn another subgoal to perform similar problemsolving. In other words, rather than contemplating and figuring out what to do, the agent immediately knows what to do.
* CHUNKING can affect both speed-up and transfer learning. A chunk can effect speed-up learning because it compresses all of the problem-solving needed to produce 
result into a single step. For some real-world agents, hundreds of rule firings can be compressed into a single rule firing. 
* Chunks are created whenever one subgoal creates a result in a superstate; since most Soarprograms are continuously sub-goaling and returning results to higher-
level states, chunks are typically created continuously as Soar runs. Note that Soar builds the chunk as soon as the result is created, rather than waiting until 
the impasse is resolved.

```

#Reinforcement Learning Example. Agent move right-left. Moving right is preferrent over moving left.
#Moiving right will have a much higher rewars. 
# Goals would be to taing the agent to move right.
#RL Need to be enabled before running the agent.
rl -s learning on

# Initialization Code

sp{ propose*initialize-left-right
    (state <s> ^superstate nil)
               -^name)
-->
   (<s> ^operator <o> +)
   (<o> ^name initialize-left-right)
}

sp { apply*initalixe-left-right
     (state <s> ^operator <op>)
     (<op> ^name initialize-left-right)
--> 
     (<s> ^name left-right
          ^direction <d1> <d2>
          ^location start)
     (<d1> ^name left ^reward -1)
     (<d2> ^name right ^reward 1)
 }
 
 #Adding Agent Propose & Apply rules
 
sp { left-right*propose*move
     (state <s> ^name left-right
                ^direction <d>
                ^location start)
     (<d> ^name <dir>)
--> 
     (<s> ^operator <op> +)
     (<op> ^name move
           ^dir <dir>)
}

sp {apply*move
   (state <s> ^operator <op>
              ^location start)
   (<op> ^name move
         ^dir <dir>)
-->
   (<s> ^location start - <dir>)
   (write (clrf) |Moved:| <dir>)
}

sp { elaborate*done
   (state <s> ^name left-right
              ^location {<> start})
-->
   (halt)
}

## Add two RL Rules , which allow us to capture all of state/action pairs. These rules will test for operators and then apply and ind.

sp { left-right*rl*left
   (state <s> ^name left-right
              ^operator <op> +)
   (<op> ^name move 
         ^dir left)
--> 
   (<s> ^operator <op> = 0)
 }
 
 sp {left-right*rl*right
    (state <s> ^name left-right
               ^operator <op> +)
    (<op> ^name move
          ^dir right)
-->
    (<s> ^operator <op> = 0)
 }
 
 ## Finally we need rules for REWARD. After selecting an action, this rule will fetch the reward based on the choice and store it on the reward link. This reward 
 ## will influence the indifferent preferences we created earlier.
 
 sp { elaborate*reward
    (state <s> ^name left-right
               ^reward-link <r>
               ^location <d-name>
               ^direction <dir>)
    (<dir> ^name <d-name> ^reward <d-reward>)
-->
    (<r> ^reward <rr>)
    (<rr> ^value <d-reward>)
 }


```
#### REWARD REPRESENTATION
* Each state in the working memory has a reward-link structure.
* Reward is recognized by syntax

```
(<s> ^reward-link <r-link>)
(<r-link> ^reward <r>)
(<r> ^value [integer or float])

```
* The reward link is not directly modified by the enviroment or architecture.
* Reward is collected at the beginning of each decision phase.
* Reward on a state's reward-link pertains only to that state.
* Reward can come from multiple rules: reward values are summed by default.
* Reward rules examples

```
sp { left-right*reward*left
     (state <s> ^name left-right
                ^location left
                ^reward-link <rl>)
-->
     (<rl> ^reward <r>)
     (<r> ^value -1)}

sp { left-right*reward*right
     (state <s> ^name left-right
                ^location right
                ^reward-link <rl>)
-->
     (<rl> ^reward <r>)
     (<r> ^value 1)}

```
#### RL UPDATES
* Take place during decide phase , after operator selection.
* For all RL rule instantiations (n) that supported the last selected operator

```
           valued+1 = valued + ( δd / n )
  Where, roughly…
           δd = α[ rewardd+1 + ϒ(qd+1) ‐ valued ]

  Where…
  • α is a parameter (learning rate)
  • ϒ is a parameter (discount rate)
  • qd+1 is dictated by learning policy
  • On‐policy (SARSA): value of selected operator
  • Off‐policy (Q‐learning): value of operator with maximum selection probability

```
### STEPS TO SOLVE SOLVE PROBLEMS USING SOAR (Example Missionsaires and cannibals)

#### First decompose  it into the problem space (state representation and Operators) and the problem(Inital & Desired state).
* State Decomposition : This would incude positions of missionaries, cannibals and boat, relative to river. 
* Initial State: Include missionaries, cannibals and boat are on one bank of the rivewr.
* Operator Proposal rules: Operators move upto two of the missionaries and/or cannibals across the river with the boat.
* Operator Application rules.
* Operator and State Monitoring Rules.
* Goal recognization rules. The desired state is achieved when all missionaries and cannibals have crossed the river.
* Failure Recognization rules. These rules will identify and detect when a state is created in which goal cannot be achieved.Failure
states are whenever the cannibals outnumber the missionaries on one bank of the river.
* The search control rules. 

#### Building Learning agents to take advantage of the RL take three stages:
* use RL Rules
* Implement one or more reward rules
* Enable the reinforcement learning mechanism.




### Important Links
* http://www.matt-versaggi.com/mit_open_courseware/
* https://optum.percipio.com/library/95c04f04-8e82-4269-8fdb-2dc0beac97b3
* https://piazza.com/ocai/spring2020/ct100  
* https://github.com/OptumTechUniversity
* https://soar.eecs.umich.edu/workshop_registration/ 
* SOAR DOWNLOADS: https://soar.eecs.umich.edu/downloads
* Videos of VISCA Talks : https://visca.engin.umich.edu/
* [Reinforcement Leaerning] : https://www.freecodecamp.org/news/an-introduction-to-q-learning-reinforcement-learning-14ac0b4493cc/



