## COGNITIVE TECHNOLOGY
* What is SOAR ( State, Operator And Result)
### COGNITIVE TECHNOLOGY COURSE SETUP 
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
* Step-04: SOAR PRESPECTIVE: To view the list of available perspectives, from the Window menu choose Open Perspective -> Other, select 
  SOAR and click "Open".
* Step-05: CREATE SOAR PROJECT: Click "Create a Project" >> General>> Select Project >> Enter Project Name "HelloWorld" >> Finish. Click   right on the Project Name and select "Include Soar Project Support. We would be to see "S" symbol to confirm this step.
* Step-06: SOAR FILES: Add New SOAR File to the Project. Let its name be Enigma.soar. 
* Step-07: SOAR AGENT: In order to process the SOAR files, we need to add the SOAR agent. SOAR files can be part of multiple agentt but 
  there can be only one SOAR Agent in the Project. SOAR Agent exists as the text file.
* Step-08: SOAR PRODUCTIONS: Use sp - Soar Production template built in to the Soar IDE. Type sp and press ctl-space. 
* Step-09: RUNNING SOAR PROJECT: 
export JAVA_HOME=Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

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

  
### License

Copyright (c) 2015, Soar Technology, Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

    Neither the name of Soar Technology, Inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY *EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED *WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. *IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, *INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT *NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR *PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, *WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) *ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE *POSSIBILITY OF SUCH *DAMAGE.
