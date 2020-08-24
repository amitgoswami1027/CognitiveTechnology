## COGNITIVE TECHNOLOGY - Project05 (Reinforcement Learning)

## Classic riddle: the rabbit, wolf, and lettuce riddle. 
* Problem Statement : A man comes to a river with a boat. He has with him a wolf, a rabbit and a head of lettuce. The man can only carry one single passenger besides himself in the boat. How can he get them all to the other side without the rabbit eating the lettuce, or the wolf eating the rabbit?
* Solution: 1. Man take rabbit to other side of river and come back.
* 2. Man takes lettuce to other side and while coming back takes rabbit with him.
* 3. Man takes wolf to other side of river and comes back with empty boat.
* 4. Man takes rabbit to other side of river.
* 5. Desired state is reached. Solved.

## Solve using the SOAR (Create the following rules for implementation)
* Have a rule that proposes/applies moving across the river with an item.
* Have a rule that proposes/applies moving across the river without an item.
* Add a rule that checks if the rabbit has been eaten, and halts if it does.
* Add a rule that checks if the lettuce has been eaten, and halts if it does.
* Add a rule that checks for the goal, and halts if it has been satisfied
* (The last three rules should fire when the boat is on one side of the river, and the condition (ex. rabbit + lettuce, rabbit and fox) exist on the other side

```
visualize image-type jpg
visualize architectural-wmes on


rl --set learning on
#indifferent-selection –-epsilon-greedy

# Initialization Code

sp { propose*addAnimals
    (state <s> ^type state
              -^name)
-->
   (<s> ^operator <o> + =)
   (<o> ^name addAnimals)
}

sp { apply*addAnimals
     (state <s> ^operator <o>)
     (<o> ^name addAnimals)
--> 
     (<s> ^name rlw
          ^side1 <l>
          ^side2 <r>
          ^desired <d>)
     (<r> ^rabbit 0
          ^lettuce 0
          ^wolf 0
          ^boat 0
          ^other-bank <l>)
     (<l> ^rabbit 1
          ^lettuce 1
          ^wolf 1
          ^boat 1
          ^other-bank <r>)
      (<d> ^side2 <dr>)
      (<dr> ^rabbit 1
            ^lettuce 1
            ^wolf 1)
}

## Operator Proposal
## 1. Move rabbit or lettuce or fox to the other side.
## 2. Move across the river without an item.

sp { propose*move-item-rabbit
     (state <s> ^name rlw
                ^<< side1 side2 >> <bank> )
     (<bank> ^rabbit > 0)
    #         ^boat > 0)
-->
     (<s> ^operator <o> +  = )
     (<o> ^name move-rabbit-boat 
          ^bank <bank>
          ^rabbit 1
          ^boat 0)
}

sp { propose*move-item-lettuce
     (state <s> ^name rlw
                ^<< side1 side2 >> <bank> )
     (<bank> ^lettuce > 0)
           #  ^boat > 0)
-->
     (<s> ^operator <o>  + = )
     (<o> ^name move-lettuce-boat
          ^bank <bank>
          ^lettuce 1
          ^boat 0)
}

sp { propose*move-item-wolf
     (state <s> ^name rlw
                ^<< side1 side2 >> <bank> )
     (<bank> ^wolf > 0)
          #   ^boat > 0)
-->
     (<s> ^operator <o>  + = )
     (<o> ^name move-wolf-boat
          ^bank <bank>
          ^wolf 1
          ^boat 0)
}

sp { propose*move-item-none
     (state <s> ^name rlw
                ^ << side1 side2 >> <bank>)
     (<bank> ^boat)
-->
     (<s> ^operator <o>  + = )
     (<o> ^name move-boat
          ^bank <bank>
          ^boat 1) 
}

sp { apply*move-rlw-boat*rabbit
     (state <s> ^operator <o>)
     (<o> ^name move-rabbit-boat
          ^rabbit > 0
          ^bank <bank>)
     (<bank> ^rabbit  <bank-num>
             ^other-bank <obank>)
     (<obank> ^rabbit <obank-num>)
-->
     (<bank> ^rabbit  <bank-num> -
                        (- <bank-num> 1))
     (<obank> ^rabbit <obank-num> -
                        ( + <obank-num> 1))
}

sp { apply*move-rlw-boat*lettuce
     (state <s> ^operator <o>)
     (<o> ^name move-lettuce-boat
          ^lettuce > 0
          ^bank <bank>)
     (<bank> ^lettuce  <bank-num>
             ^other-bank <obank>)
     (<obank> ^lettuce <obank-num>)
-->
     (<bank> ^lettuce  <bank-num> -
                        (- <bank-num> 1))
     (<obank> ^lettuce <obank-num> -
                        ( + <obank-num> 1))
}

sp { apply*move-rlw-boat*wolf
     (state <s> ^operator <o>)
     (<o> ^name move-wolf-boat
          ^wolf > 0
          ^bank <bank>)
     (<bank> ^wolf  <bank-num>
             ^other-bank <obank>)
     (<obank> ^wolf <obank-num>)
-->
     (<bank> ^wolf  <bank-num> -
                        (- <bank-num> 1))
     (<obank> ^wolf <obank-num> -
                        ( + <obank-num> 1))
}

sp { apply*move-rlw-boat*none
     (state <s> ^operator <o>)
     (<o> ^name move-boat
          ^boat > 0
          ^bank <bank>)
     (<bank> ^boat  <bank-num>
             ^other-bank <obank>)
     (<obank> ^boat <obank-num>)
-->
     (<bank> ^boat  <bank-num> -
                        (- <bank-num> 1))
     (<obank> ^boat <obank-num> -
                        ( + <obank-num> 1))
}


## RL GP Rules
gp {rl*propose*move-item-rabbit
       (state <s> ^name rlw
                  ^operator <o> +
                  ^<< side1 side2 >> <bank>)
       (<o> ^name move-rabbit-boat)
       (<bank> ^rabbit [0 1]
               ^boat [0 1])
  -->
       (<s> ^operator <o> = 0)
}

gp {rl*propose*move-item-lettuce
        (state <s> ^name rlw
                   ^operator <o> +
                   ^<< side1 side2 >> <bank>)
        (<o> ^name move-lettuce-boat)
        (<bank> ^lettuce [0 1]
                ^boat [0 1])
   -->          
        (<s> ^operator <o> = 0)
 }           

gp {rl*propose*move-item-wolf
         (state <s> ^name rlw
                    ^operator <o> +
                    ^<< side1 side2 >> <bank>)
         (<o> ^name move-wolf-boat)
         (<bank> ^lettuce [0 1]
                 ^boat [0 1])
    -->   
         (<s> ^operator <o> = 0)
  }


## State and Opertaot Monitoting

sp { monitor*move-rlw-boat
   (state <s> ^operator <o>)
   (<o> ^name rlw
        ^{ << rabbit lettuce wolf >> <type> } <number> )
-->
   (write | Move | <number>| | <type> )
}

sp { monitor*state
   (state <s> ^name rlw
              ^side1 <l>
              ^side2 <r>)
   (<l> ^rabbit <rl>
        ^lettuce <ll>
        ^wolf <wl>
        ^boat <bl>)
   (<r> ^rabbit <rr>
        ^lettuce <lr>
        ^wolf <wr>
        ^boat <br>)
-->
   (write (crlf) | R: | <rl> |, L: | <ll> |, W: | <wl> |B ~~~ |
                 | R: | <rr> |, L: | <lr> |, W: | <wr> | |)
}


## Desired State Recognition

sp {mac*detect*state*success
     (state <s> ^desired <d>
                ^<side> <ls>
                ^reward-link <rl>)
     (<ls> ^rabbit <r>
           ^lettuce <l>
           ^wolf <w>
           )
     (<d> ^{ << side1 side2 >> <side> } <dls>)
     (<dls> ^rabbit <r>
            ^lettuce <l>
            ^wolf <w>
            )
-->
     (write (crlf) | The problem has been solved. |)
     (<rl> ^reward.value 10
           ^final-update true)
     (halt)
}

## Detect Failure state

sp {rlw*evaluate*state*failure*rule1
    (state <s> ^desired <d>
               ^side1 <s1>
               ^side2 <s2>
               ^reward-link <rl>)
   (<s1> ^rabbit > 0
         ^wolf > 0
         ^lettuce = 0)
   (<s2> ^boat > 0)
-->
   (write (crlf) |The Problem has failed - RABBIT EATEN|)
   (<rl> ^reward.value -20)
   (halt)
}

sp {rlw*evaluate*state*failure*rule2
    (state <s> ^desired <d>
               ^side1 <s1>
               ^side2 <s2>
               ^reward-link <rl>)
   (<s2> ^rabbit > 0
         ^wolf > 0
         ^lettuce = 0)
   (<s1> ^boat > 0)
-->
   (write (crlf) |The Problem has failed - RABBIT EATEN|)
   (<rl> ^reward.value -20)
   (halt)
}

sp { rlw*evaluate*state*failure*rule3
    (state <s> ^desired <d>
               ^side1 <s1>
               ^side2 <s2>
               ^reward-link <rl>)
   (<s1> ^rabbit  > 0
         ^lettuce > 0
         ^wolf = 0)
   (<s2> ^boat > 0)
-->
   (write (crlf) |The Problem has failed - LETTUCE  EATEN|)
   (<rl> ^reward.value -20)
   (halt)
}

sp { rlw*evaluate*state*failure*rule4
    (state <s> ^desired <d>
               ^side1 <s1>
               ^side2 <s2>
               ^reward-link <rl>)
   (<s2> ^rabbit > 0
         ^lettuce > 0
         ^wolf = 0)
   (<s1> ^boat > 0)
-->
   (write (crlf) |The Problem has failed - LETTUCE  EATEN|)
   (<rl> ^reward.value -20)
   (halt)
}


```
