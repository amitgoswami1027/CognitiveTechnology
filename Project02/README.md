## COGNITIVE TECHNOLOGY- SOAR
### PROJECT02

For this project, you will encode many of pieces learned in this section. You will write a simple agent that examines a user's 
bank account and adds a value based on the amount. Once the account hits a specified amount, it prints a message. Start by 
adding the following two rules to a new Soar file: Specifications.

Specifications: • Use dot notation to reference the value at Bank.AccountBalance • If the AccountBalance >= 1000, add 4000 • If 
the AccountBalance < 1000, add 5000 • Once the AccountBalance >= 5000, print 'Balance over five thousand' Hints: • To 
accomplish the three initial comparisons, two operators will likely be necessary • Be sure to encode a variable for the rules 
to retract, or the selected operator (for any of the rules) will exist.

## SOAR CODE
```
visualize image-type jpg
visualize architectural-wmes on

#Check if the attribute of 'AccountBalance' does not exit for <s>.
sp {propose*initBank
   (state <s> ^superstate nil
               -^AccountBalance)
-->
#Create a New Operator
   (<s> ^operator <o> +)
   (<o> ^name Bank)
}

#Verify that Operator has an attribute of 'AccountBalance'
# On the mian state Create an attribute/value pair of name/AccountBalance
sp {apply*initBank
   (state <s> ^operator <o>)
   (<o> ^name Bank)
-->
   (<s> ^AccountBalance 900)
}

#Check if the value connected to attribute AccountBalance is greater than 1000
#Create a new Operator- AccountBalacegraterthan1000
sp {propose*AccountBalancegreaterthan1000
   (state <s> ^AccountBalance >= 1000)
-->
   (<s> ^operator <o> +)
   (<o> ^name AccountBalancegreaterthan1000)
}

sp {apply*AccountBalancegreaterthan1000
   (state <s> ^operator <o> 
              ^AccountBalance <AccountBalance>)
   (<o> ^name AccountBalancegreaterthan1000)
-->
   (<s> ^AccountBalance <AccountBalance> -
        ^AccountBalance (+ 4000 <AccountBalance>))
}

sp {propose*AccountBalancelesserthan1000
   (state <s> ^AccountBalance < 1000)
--> 
   (<s> ^operator <o> +)
   (<o> ^name AccountBalancelesserthan1000)
}

sp {apply*AccountBalancelesserthan1000
   (state <s> ^operator <o>
              ^AccountBalance <AccountBalance>)
   (<o> ^name AccountBalancelesserthan1000)
-->
   (<s> ^AccountBalance <AccountBalance> -
        ^AccountBalance (+ 5000 <AccountBalance>))
}


sp {detect*account5000
   (state <s> ^AccountBalance > 10000)
-->
    (write |Balance over five thousand|)  
 #(halt)
}

```


SNAPSHOTS OF THE SOARJAVEDEBUGGER 

![image](https://user-images.githubusercontent.com/13011167/84946273-0c26a200-b106-11ea-82b0-9493f87068fe.png)

![image](https://user-images.githubusercontent.com/13011167/84946446-5c056900-b106-11ea-8d1d-d1c9d9a9b579.png)

![image](https://user-images.githubusercontent.com/13011167/84946548-83f4cc80-b106-11ea-87e4-c0d686fc9022.png)



## Section 2: Self-Assessment 2 -Completed.


