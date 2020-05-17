## COGNITIVE TECHNOLOGY

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

Eclipse should now ask you to restart in order to complete the installation
#### Important Links
* 1. Project Setup Instructions : https://github.com/soartech/soaride
* 2. Percipio (contains the course material):
     * https://optum.percipio.com/library/95c04f04-8e82-4269-8fdb-2dc0beac97b3
     * Contact Nicolle Swanson if you’re having trouble accessing this.
* 3. Piazza (our forum, ask questions here):
     * https://piazza.com/ocai/spring2020/ct100  
     * access code: ct100
* 4. GitHub (contains project codes & more): https://github.com/OptumTechUniversity
* 5.  

-----------------------------------------------------------------------------------------------------------------------------

## A GENTLE INTRODUCTION TO SOAR - AN ARCHITECTURE FOR HUMAN COGNITION

### 1. INTRODUCTION 
Many Disciplines contribute to the field of Cognitive Science that include psychology, linguistics,anthropology, and artificial intelligence.

COGNITIVE PHENOMENA - phenomena like problem solving, decision making,language, memory, and learning.

### 2. IDEA OF ARCHITECTURE
Unified theories of cognition (UTCs) - unified theory of cognition means trying to find a set of computationally-realizable mechanisms and structures that can answer all the questions we might want to ask about cognitive behavior. A key piece of
the puzzle, we believe, lies in the idea of architecture.
* BEHAVIOR = ARCHITECTURE + CONTENT
Using this idea, we can define a cognitive architecture as a theory of the fixed mechanisms and structures that underlie
human cognition. Factoring out what is common across cognitive behaviors across the phenomena explained by microtheories, seems to us to be a significant step toward producing a unified theory of cognition.

### 3. WHAT COGNITIVE BEHAVIORS HAVE IN COMMON
What sort of behaviour should we model in SOAR Architecutre. A cognitive architecture must help produce cognitive behavior. Reading certainly requires cognitive ability. So does solving equations, cooking dinner, driving a car,telling a joke, or playing baseball. In fact, most of our everyday behavior seems to require some degree of thinking to mediate our perceptions and actions. 
Because every architecture is a theory about what is common to the content it processes, Soar is a theory of what cognitive behaviors have in common. In particular SOAR theory posits that cognitive behaviour has at least the following characteristics:

#### 1. It is Goal Oriented. 
#### 2. It takes place in a rich, complex, detailed environment
#### 3. It requires a large amount of knowledge
#### 4. It requires the use of symbols and abstractions
#### 5. It is flexible, and a function of the environment
#### 6. It requires learning from the environment and experience

# BEHAVIOR = ARCHITECTURE + CONTENT

How can we express the different kinds of knowledge the model must have so that it acts in a goal oriented way?representing the knowledge in terms of goals, states, and operators and guiding the choice of which operator to apply by the principle of rationality. 

### 4. BEHAVIOUR AS A MOVEMENT THROUGH PROBLEM SPACES
What knowledge becomes part of the state and what knowledge becomes part of the operators? How do we know what an operator application will do? How do we know when the goal has been achieved? To answer these questions, the next section describes how Soar supports goals, problem spaces, states and operators.
 
### 5. TYING THE CONTENT TO THE ARCHITECTURE
Architecture must support what is common across many domains, its mechanisms must process a domain-independent level of
description. What is common across all domains and problems? In Soar, it is the decomposition of knowledge into goals, problem spaces, states, and operators that is common across all problems.
