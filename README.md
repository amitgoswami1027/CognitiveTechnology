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

#### STEPS:
* Step-01: Install Eclipse : Soar IDE is built as a plug-in to Eclipse, you need to download Eclipse (version 4.5.2 or higher) and install it. http://www.eclipse.org/documentation/
* Step-02: JAVA : The plugin requires the Java Runtime Environment (JRE) 6.0 or greater, if you do not have it installed.
* Step-03: Install the Soar IDE Eclipse Plugin - Once Eclipse is installed, you need to download the Soar IDE plug-in
     1. From the Help menu in Eclipse, select Install New Software... to open the Install dialog.
     2. Now add a new remote site to download the Soar IDE plug-in:
        * Click the Add... button to open the Add Repository dialog.
        * Type Soar IDE into the Name text field in the dialog.
        * Type https://github.com/soartech/soaride/raw/master/com.soartech.soar.ide.update in the URL text field and click OK.
     4. A new site should now be displayed in the Install dialog. Make sure the box next to the Soar IDE site is checked, and     
        click Finish to move on.
     5. The Updates dialog should now be displayed. Check the box next to the Soar IDE feature, and click Finish.
     6. Accept the license agreement on the this screen, and click Next.
     7. Now click Finish to begin installing the plug-in.
     8. You will be asked to verify the plug-in that is being installed. Click Install All to proceed.
     9. Eclipse should now ask you to restart in order to complete the installation.
* Step-04: SOAR PRESPECTIVE: To view the list of available perspectives, from the Window menu choose Open Perspective -> 
Other, select SOAR and click "Open".
* Step-05: CREATE SOAR PROJECT: Click "Create a Project" >> General>> Select Project >> Enter Project Name "HelloWorld" >> 
Finish. Click   right on the Project Name and select "Include Soar Project Support. We would be to see "S" symbol to confirm 
this step.
* Step-06: SOAR FILES: Add New SOAR File to the Project. Let its name be Enigma.soar. 
* Step-07: SOAR AGENT: In order to process the SOAR files, we need to add the SOAR agent. SOAR files can be part of multiple 
agentt but there can be only one SOAR Agent in the Project. SOAR Agent exists as the text file.
* Step-08: SOAR PRODUCTIONS: Use sp - Soar Production template built in to the Soar IDE. Type sp and press ctl-space. 

### SOAR COURSE INTRODUCTION
### Section-02: Soar Introduction,The Decision Cycle, Working memory, Procedural Memory, Example 1 Weather, Guided Example 1-1 
Weather revised, Guided Example 1-2 Debugger set up, Self-assessment 1 AND Project 1 Echo. - *MY NOTES*

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

### Important Links
* http://www.matt-versaggi.com/mit_open_courseware/
* https://optum.percipio.com/library/95c04f04-8e82-4269-8fdb-2dc0beac97b3
* https://piazza.com/ocai/spring2020/ct100  
* https://github.com/OptumTechUniversity
* https://soar.eecs.umich.edu/workshop_registration/ 
* SOAR DOWNLOADS: https://soar.eecs.umich.edu/downloads
* Videos of VISCA Talks : https://visca.engin.umich.edu/


### License

Copyright (c) 2015, Soar Technology, Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

    Neither the name of Soar Technology, Inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY *EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED *WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. *IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, *INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT *NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR *PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, *WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) *ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE *POSSIBILITY OF SUCH *DAMAGE.
