## COGNITIVE TECHNOLOGY - Project03 - Submitted

```
### Requirements: 
#### Write an elaboration rule that adds both values and places it into the working memory. 
   * The attribute should be named 'combinedVals'. 
   * Example: <s> ^combinedVals 20 
#### Operator 'decrease2' (preference of >) 
   * Only propose the operator if combinedVals is greater than 20. 
   * To apply the operator, decrease val1 by 2 o Both rules should only fire in S1 
#### Operator 'decrease1' (preference of >) 
   * Only propose the operator if combinedVals is greater than 0.
   * To apply the operator, decrease val1 by 1 o Both rules should only fire in S1 
#### Operator breakImpasse 
   * Prefer decrease2 
   * Only propose this operator in the substate.
```
```
visualize image-type jpg
visualize architectural-wmes on

sp {propose*init
   (state <s> ^type state)
   (<s> ^superstate nil)
   (<s> -^agent) 
-->
   #Create a New Operator
   (<s> ^operator <o> + !)
   (<o> ^name init)
}

sp {apply*init
   (state <s> ^operator <o>)
   (<o> ^name init)
-->
   # Add an attribute value of agent/account, so the rule retracts
   (<s> ^agent number)
   (<s> ^value1 25)
   (<s> ^value2 10)
}

# Write an elaboration rule that add both values and place it into the working memory. 
# The attribute should be named 'combinedVals'
# Example: <s> ^combinedVals 20

sp {elaborate*combinedVals
   (state <s> ^value1 <val1>)
   (<s> ^value2 <val2>)
-->
   (<s> ^combinedVals (+ <val1> <val2>) )

}

# Operator 'decrease2' (preference of >)
# Only Propose the Operator if the combinedVals is greater than 20
# To apply the operator , decrease val1 by 2
# both rules should only fire in S1

sp {propose*process2
   (state <s> ^combinedVals <calval> > 20) 
-->
   (<s> ^operator <o> + >)
   (<o> ^oper2 decrease2)
  
}

sp { apply*process2
   ( state <s> ^operator <o> )
   ( <o> ^oper2 decrease2)
   ( <s> ^combinedVals <calval> )

-->
   (<s> ^combinedVals <calval> -)
   (<s> ^combinedVals (- <calval> 2))
   (write |Processing the decrease2...| <calval>)
}

# Operator 'decrease1' (preference of >)
# only propose the operator if combinedVals if greater than 0
# To apply the operator, decrease val1 by 1
# both rules should only fire in S1

sp {propose*process1
   (state <s> ^combinedVals <calval> > 0)
-->
   (<s> ^operator <o> +  >)
   (<o> ^oper1 decrease1)
}

sp { apply*process1
   (state <s> ^operator <o>)
   (<o> ^oper1 decrease1)
   (<s> ^combinedVals <calval>)

-->
   (<s> ^combinedVals <calval> -)
   (<s> ^comninedVals (- <calval> 1))
}

#Operator breakImpasse
# prefer decrease2
# Only propose this operator in the substate

sp {propose*Substate*breakImpasse
   (state <s> ^impasse tie)
   (<s> ^item <o1>)
   (<s> ^item <o2>)
   (<o1> ^oper1 <val1>)
   (<o2> ^oper2  <val2>)
-->
   (<s> ^operator <o> + =)
   (<o> ^impasseoperator breakImpasse)
   (<o> ^oper1  <val1>)
   (<o> ^oper2  <val2>)
}

sp {apply*Substate*breakImpasse
   (state <s> ^operator <o>)
   (<o> ^impasseoperator breakImpasse)
   (<o> ^oper1 <val1>)
   (<o> ^oper2 <val2>)   

   (<s> ^superstate <ss>)
   (<ss> ^operator <o1> + )
   (<o1> ^oper1 <val1>)

   (<ss> ^operator <o2> + )
   (<o2> ^oper2 <val2>)   
-->

   (<ss> ^operator <o2> > <o1>)

}
   
```
### SNAPSHOTS

### 1: O: O1 (init)
![image](https://user-images.githubusercontent.com/13011167/87226304-87e7d780-c3b0-11ea-882f-66d067e45de1.png)

### 2: ==>S: S2 (operator tie)
![image](https://user-images.githubusercontent.com/13011167/87226339-ae0d7780-c3b0-11ea-90e0-afd17ba5adb8.png)

### 4: O: O3
![image](https://user-images.githubusercontent.com/13011167/87226413-325ffa80-c3b1-11ea-87b0-84eaec2b5918.png)

### Flow of the Program and decremented value of combinedVals from 35..33..31..29..27.. etc
![image](https://user-images.githubusercontent.com/13011167/87226457-7226e200-c3b1-11ea-8ab5-a36e7350be2f.png)

### Final State of Program
![image](https://user-images.githubusercontent.com/13011167/87226484-a9958e80-c3b1-11ea-9bb1-9d95308401b9.png)
