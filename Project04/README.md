## COGNITIVE TECHNOLOGY - Project04 (Semantic & Episodic Memory)
For this project, we will utilize both semantic and episodic memories. You will be printing a series of food items in order, ascending by calorie count. Then, you will use episodic memory to print the lowest calorie item again.

#### Your task: Print the items in order of calorie count. The Semantic Memory contains food and calorie information. The working memory contains the items you have in your fridge. Your task is to propose an operator for each item in the fridge and 'apply' it by printing 'Eating *food-Name-here*'. Break impasses in the substate that is created, utilizing the Semantic Memory to pick the item with the lowest calorie count. 
#### Also be sure to remove and update selected


```
  visualize image-type jpg
visualize architectural-wmes on

# SOAR COURSE PROJECT04 Started 20th July,2020
# AMIT GOSWAMI

smem --set learning on

sp { propose*init
   (state <s> ^type state)
   (<s> ^superstate nil)
   (<s> -^init) 
   (<s> -^selected)
-->
   (<s> ^operator <o> + !)
   (<o> ^name init)
}

sp {apply*init
   (state <s> ^operator <o>)
   (<o> ^name init)
   (<s> ^smem.command <cmd>)
-->
   (<cmd> ^store <food>)
   (<food> ^type food)
   (<food> ^cake 500)
   (<food> ^banana 50)
   (<food> ^soda 200)
   (<food> ^chicken 300)
   (<s> ^fridge <fri>)
   (<fri> ^food soda)
   (<fri> ^food cake)
   (<fri> ^food banana)
   (<s> ^init true)
   (<s> ^selected blank)
} 

sp { propose*cake
   (state <s> ^smem.command <cmd>)
   (<s> ^selected <setval>) 
   (<cmd> ^store <food>)
   (<s> ^fridge <fri>)
   (<fri> ^food cake)
   (<food> ^type food)
   (<food> ^cake 500)
#  (<food> ^banana 50)
#  (<food> ^soda 200)
   (<food> ^chicken 300)
-->
   (<s> ^operator <op> + >)
   (<op> ^namec cake)
}

sp {apply*cake
   (state <s> ^operator.namec cake
              ^smem.command <cmd>)
   (<s> ^fridge <fri>)
   (<fri> ^food cake)
   (<cmd> ^store <food>)
   (<food> ^type food)
   (<food> ^cake 500)
 #  (<food> ^banana 50)
 #  (<food> ^soda 200)
   (<food> ^chicken 300)
   (<s> ^selected <selval>)
-->
   (<food> ^cake 500 -)
   (<food> ^banana 50 -)
   (<food> ^soda 200 -)
   (<food> ^chicken 300 )
   (<s> ^selected <selval> -)
   (<s> ^selected cake)
   (<fri> ^food cake - )
   (write |Eating cake..|)
}

sp { propose*soda
   (state <s> ^smem.command <cmd>)
   (<s> ^selected <setval>)
   (<s> ^fridge <fri>)
   (<fri> ^food soda)
   (<cmd> ^store <food>)
   (<food> ^type food)
   (<food> ^cake 500)
 #  (<food> ^banana 50)
   (<food> ^soda 200)
   (<food> ^chicken 300)
-->
   (<s> ^operator <op> + > )
   (<op> ^names soda)
}

sp {apply*soda
   (state <s> ^operator.names soda
              ^smem.command <cmd>)
   (<s> ^fridge <fri>)
   (<fri> ^food soda)
   (<cmd> ^store <food>)
   (<food> ^type food)
   (<food> ^cake 500)
 #  (<food> ^banana 50)
   (<food> ^soda 200)
   (<food> ^chicken 300)
   (<s> ^selected <selval>)
-->
   (<food> ^cake 500 )
   (<food> ^banana 50 -)
   (<food> ^soda 200 -)
   (<food> ^chicken 300 )
   (<s> ^selected <selval> -)
   (<s> ^selected soda)
   (<fri> ^food soda - )
   (write |Drinking soda..|)
}

sp { propose*banana
   (state <s> ^smem.command <cmd>)
   (<s> ^selected <setval>)
   (<s> ^fridge <fri>)
   (<fri> ^food banana)
   (<cmd> ^store <food>)
   (<food> ^type food)
   (<food> ^cake 500)
   (<food> ^banana 50)
   (<food> ^soda 200)
   (<food> ^chicken 300) 
-->
   (<s> ^operator <op> + > )
   (<op> ^nameb banana)
}
   
sp {apply*banana
   (state <s> ^operator.nameb banana
              ^smem.command <cmd>)
   (<s> ^fridge <fri>)
   (<fri> ^food banana)
   (<cmd> ^store <food>)
   (<food> ^type food)
   (<food> ^cake 500)
   (<food> ^banana 50)
   (<food> ^soda 200)
   (<food> ^chicken 300)
   (<s> ^selected <selval>) 
-->
   (<food> ^cake 500 )
   (<food> ^banana 50 -) 
   (<food> ^soda 200 )
   (<food> ^chicken 300 )
   (<s> ^selected <selval> -)
   (<s> ^selected banana)
   (<fri> ^food banana - )
   (write |Eating banana..|)
}  

#Break impasses in the substate that is created, utilizing the Semantic Memory 
#to pick the item with the lowest calorie count. 
#Also be sure to remove and update <s> ^selected each time.

sp {propose*Substate*breakImpasse1
   (state <s> ^impasse tie)
   (<s> ^item <o1>)
   (<s> ^item <o2>)
   (<s> ^item <o3>)
   (<o1> ^namec <val1>)
   (<o2> ^names <val2>)
   (<o3> ^nameb <val3>)
-->
   (<s> ^operator <o> + =)
   (<o> ^impasseops breakImpasse1)
   (<o> ^namec <val1>)
   (<o> ^names <val2>)
   (<o> ^nameb <val3>)
}

sp { apply*Substate*breakImpasse1
     (state <s> ^operator <o>)
     (<o> ^impasseops breakImpasse1)
     (<o> ^namec <val1>)
     (<o> ^names <val2>)
     (<o> ^nameb <val3>)      
     
     (<s> ^superstate <ss>)
     (<ss> ^operator <o1> +)
     (<o1> ^namec <val1>)

     (<ss> ^operator <o2> +)
     (<o2> ^names <val2>)

     (<ss> ^operator <o3> +)
     (<o3> ^nameb  <val3>)
-->
      (<ss> ^operator <o3> > <o2> > <o1> )
}

#Break impasses in the substate that is created, utilizing the Semantic Memory
#to pick the item with the lowest calorie count.
#Also be sure to remove and update <s> ^selected each time.

sp {propose*Substate*breakImpassetwo
   (state <s> ^impasse tie)
  # (<s> ^superstate S1)
   (<s> ^item <o2>)
   (<s> ^item <o3>)
   (<s> ^item-count 2)
#   (state <s> ^superstate nil)
#   (<s> ^operator <o>)
   (<o2> ^namec <val1>)
   (<o3> ^names <val2>)
-->
   (<s> ^operator <o> + =)
   (<o> ^impasseops breakImpasse2)
   (<o> ^namec <val1>)
   (<o> ^names <val2>)
}

sp { apply*Substate*breakImpassetwo
     (state <s> ^operator <o>)
     (<o> ^impasseops breakImpasse2)
     (<o> ^namec <val1>)
     (<o> ^names <val2>)

     (<s> ^superstate <ss>)
     (<ss> ^operator <o2> +)
     (<o2> ^namec <val1>)

     (<ss> ^operator <o3> +)
     (<o3> ^names <val2>)

-->
      (<ss> ^operator <o3> > <o2> )
}
```
### SNAPSHOTS
### 1: O: O1 (init)
![image](https://user-images.githubusercontent.com/13011167/88841077-0b038d00-d1fb-11ea-8c81-1d80a9b9b5eb.png)

### 2: ==>S: S2 (operator tie)
![image](https://user-images.githubusercontent.com/13011167/88841319-6cc3f700-d1fb-11ea-96eb-8a8d66f66f62.png)

### 4: O: O4
### Eating banana..
![image](https://user-images.githubusercontent.com/13011167/88841536-b7de0a00-d1fb-11ea-9f80-8c3dba4e1f88.png)

### 5: ==>S: S3 (operator tie)
![image](https://user-images.githubusercontent.com/13011167/88841725-fa074b80-d1fb-11ea-8800-b1a9abe6d257.png)

### 7: O: O6
### Drinking soda.
![image](https://user-images.githubusercontent.com/13011167/88841885-376bd900-d1fc-11ea-9520-6c9fefaf0f1e.png)

### 8: O: O9
### Eating cake.
![image](https://user-images.githubusercontent.com/13011167/88842008-70a44900-d1fc-11ea-80ee-88c49f51c5bf.png)

