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
  SAMPLE Production : sp { helloworld ( state <s> superstate nil)  (write |I'm sorry Dave.|) (write |I'm afraid I can't do that.|)(halt) }
 
* Step-09: RUNNING SOAR PROJECT: 
  

