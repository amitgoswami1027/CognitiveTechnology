## COGNITIVE TECHNOLOGY- SOAR
### PROJECT01- Submission
#### Download the below code from the course repo and place it in your SOAR/Bin folder. You can load it in by typing 
source project1.SOAR' in your Soar debugger.

Within the file you find two '#TODO' comments, representing the two rules that you will need to write. It is required that the 
variable is passed within the operator itself. Avoid matching the input-link in the application rule to retrieve it.

####Project1.soar
wm add I2 ^ItsTimeToLearSoar true
visualize image-type jpg
visualize architectural-wmes on

```
#TODO: Create a proposal rule that proposes an operator if the attribute/value pair of name/<var> exists on the input-link
#With <var> equaling any string

wm add I2 ^ItsTimeToLearSoar true
visualize image-type jpg
visualize architectural-wmes on


#TODO: Create a proposal rule that proposes an operator if the attribute/value pair of name/<var> exists on the input-link
#With <var> equaling any string

sp {propose*ItsTimeToLearnSoar
 (state <s> ^type state)
 (<s> ^io <io>)
 (<io> ^input-link <input>)
 (<input> ^ItsTimeToLearnSoar true)

-->
 (<s> ^operator <o> + =)
 (<o> ^name TimeToLearnSoar)
}

sp { apply*ItsTimeToLearnSoar
   (state <s> ^operator <o>)
   (<o> ^TimeToLearnSoar true)
-->
   (write | It's Time To Learn Soar|)

}


```

### SNAPSHOTS
#### Input : "ItsTimeToLearnSoar=true"
![image](https://user-images.githubusercontent.com/13011167/84137780-c9602c80-aa6a-11ea-8dec-47da71dae2f4.png)

#### Operator Selection/Decision : "name=TimeToLearnSoar"
![image](https://user-images.githubusercontent.com/13011167/84137866-ef85cc80-aa6a-11ea-9e57-00e2a3faa814.png)

#### Output "Its Time To Learn Soar"

### Section 2: Self-Assessment 1 - Completed
![image](https://user-images.githubusercontent.com/13011167/84131509-42a75180-aa62-11ea-86a8-fa71624ec91f.png)


