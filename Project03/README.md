## COGNITIVE TECHNOLOGY - Project03 - Submitted

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

sp {propose*process1
   (state <s> ^type state)
  # (<s> ^combinedVals <cval>)
  # (<s> ^superstate nil)
   (<s> ^combinedVals <cval> > 20) 
-->
   (<s> ^operator <o> +  >)
   (<o> ^name decrease2)
}

sp { apply*process1
   (state <s> ^operator <o>)
   ( <s> ^combinedVals <cval>)
   ( <o> ^name decrease2)
-->
   (<s> ^combinedVals <cval> -
         ^combinedVals (- <cval> 2))
}

# Operator 'decrease1' (preference of >)
# only propose the operator if combinedVals if greater than 0
# To apply the operator, decrease val1 by 1
# both rules should only fire in S1

sp {propose*process2
   (state <s> ^type state)
  # (<s> ^combinedVals <cval>)
  # (<s> ^superstate nil)
   (<s> ^combinedVals <cval> >0)
-->
   (<s> ^operator <o> + >)
   (<o> ^name decrease1)
}

sp { apply*process2
   (state <s> ^operator <o>)
   (<s> ^combinedVals <cval>)
   (<o> ^name decrease1)
-->
   (<s> ^combinedVals <cval> -
         ^combinedVals (- <cval> 1)) 
}

#Operator breakImpasse
# prefer decrease2
# Only propose this operator in the substate

sp {propose*Substate*breakImpasse
   (state <s> ^impasse tie )
   (<s> ^superstate S2)
-->
   (<s> ^operator <o> + =)
   (<o> ^name breakImpasse)
}

sp {apply*Substate*breakImpasse
   (state <s> ^operator <o>)
   (<o> ^name breakImpasse)
   
   (<s> ^superstate <ss>)
   (<ss> ^operator <o1> +)
   (<ss> ^operator <o2> +)
-->
   (<ss> ^operator <o2> > <o1>)

}
   
```





