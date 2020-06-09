## COGNITIVE TECHNOLOGY
* What is SOAR ( State, Operator And Result)
* WHAT IS SOAR : Unified Architecture for building the intelligent systems.


### COGNITIVE TECHNOLOGY COURSE SETUP 
Supported Development Tools/Libraries and Required Downloads 
* Computer with Java installed (1.8.0_144 required) - Mac highly recommended 
* VS Code (App Store) or Install Eclipse
* Graphviz
### STEPS:
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
#### Section-02: Soar Introduction,The Decision Cycle, Working memory, Procedural Memory, Example 1 Weather, Guided Example 1-1 Weather revised, Guided Example 1-2 Debugger set up, Self-assessment 1 AND Project 1 Echo.

#### SOAR DECISION CYCLE
* PROPOSE => DECISION => APPLICATION
#### EXAMPLE: 
* Proposal - 'What are all the things that I could do right now'
* Decision - 'I can only do one thing at once, which one should I pick?'
* Application - 'Now that I picked one thing to do, I can now actually do it'
* Multitasking is an illusion.

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
#### Application Rules :Check if the situation is correct and do the action. Checking the situation' in this case has three 
requirements: The operator is in the working memory, it was selected in the 'Operator Decision Phase', and any other working memory elements match (like proposal rules).
* Conditions: Check the working memory to see if a certain operator exists and has a preference (More on this in later 
sections) and to check that other Working Memory Elements Exist (if needed).
* Actions: By referencing the variables in the 'Conditions' Section, code in this section performs the action by adding modifying/adding working elements.







### A GENTLE INTRODUCTION TO SOAR - AN ARCHITECTURE FOR HUMAN COGNITION

1. INTRODUCTION : Many Disciplines contribute to the field of Cognitive Science that include psychology, linguistics,anthropology, and artificial intelligence.

#### COGNITIVE PHENOMENA - phenomena like problem solving, decision making,language, memory, and learning.

2. IDEA OF ARCHITECTURE
Unified theories of cognition (UTCs) - unified theory of cognition means trying to find a set of computationally-realizable mechanisms and structures that can answer all the questions we might want to ask about cognitive behavior. A key piece of the puzzle, we believe, lies in the idea of architecture.

BEHAVIOR = ARCHITECTURE + CONTENT Using this idea, we can define a cognitive architecture as a theory of the fixed mechanisms and structures that underlie human cognition. Factoring out what is common across cognitive behaviors across the phenomena explained by microtheories, seems to us to be a significant step toward producing a unified theory of cognition.

3. WHAT COGNITIVE BEHAVIORS HAVE IN COMMON
What sort of behaviour should we model in SOAR Architecutre. A cognitive architecture must help produce cognitive behavior. Reading certainly requires cognitive ability. So does solving equations, cooking dinner, driving a car,telling a joke, or playing baseball. In fact, most of our everyday behavior seems to require some degree of thinking to mediate our perceptions and actions. Because every architecture is a theory about what is common to the content it processes, Soar is a theory of what cognitive behaviors have in common. In particular SOAR theory posits that cognitive behaviour has at least the following characteristics:

* 1. It is Goal Oriented.
* 2. It takes place in a rich, complex, detailed environment
* 3. It requires a large amount of knowledge
* 4. It requires the use of symbols and abstraction
* 5. It is flexible, and a function of the environment
* 6. It requires learning from the environment and experience

#### BEHAVIOR = ARCHITECTURE + CONTENT

How can we express the different kinds of knowledge the model must have so that it acts in a goal oriented way?representing the knowledge in terms of goals, states, and operators and guiding the choice of which operator to apply by the principle of rationality.

4. BEHAVIOUR AS A MOVEMENT THROUGH PROBLEM SPACES
What knowledge becomes part of the state and what knowledge becomes part of the operators? How do we know what an operator application will do? How do we know when the goal has been achieved? To answer these questions, the next section describes how Soar supports goals, problem spaces, states and operators.

5. TYING THE CONTENT TO THE ARCHITECTURE
Architecture must support what is common across many domains, its mechanisms must process a domain-independent level of description. What is common across all domains and problems? In Soar, it is the decomposition of knowledge into goals, problem spaces, states, and operators that is common across all problems. h

### Important Links
* http://www.matt-versaggi.com/mit_open_courseware/
* https://optum.percipio.com/library/95c04f04-8e82-4269-8fdb-2dc0beac97b3
* https://piazza.com/ocai/spring2020/ct100  
* https://github.com/OptumTechUniversity
* https://soar.eecs.umich.edu/workshop_registration/ 
* SOAR DOWNLOADS: https://soar.eecs.umich.edu/downloads



### License

Copyright (c) 2015, Soar Technology, Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

    Neither the name of Soar Technology, Inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY *EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED *WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. *IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, *INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT *NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR *PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, *WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) *ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE *POSSIBILITY OF SUCH *DAMAGE.
