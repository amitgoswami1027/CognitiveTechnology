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
