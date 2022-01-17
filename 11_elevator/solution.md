Solution
========

1. Deploy the ```Player``` contract in Elevator.sol.
2. Call ```goToTop``` with your instance address as parameter.
3. Check the floor in the Ethernaut console with ```(await contract.floor()).toString()``` --> 69
4. Check if we are at the top with ```await contract.top()``` --> true

--> SOLVED

Explanation
===========

We need to make sure that the attacking contract is a Building. Therefore, we derive the Player contract from the Building interface and implement the ```isLastFloor``` function. However, our implementation has a twist: the first time it is called it will return false (irrespective of the value of the floor parameter). The second time the function is called it will return true. That is all we need to trick the elevator to reach the top.

Conclusion
==========

You can use the ```view``` function modifier on an interface in order to prevent state modifications. The ```pure``` modifier also prevents functions from modifying the state. Make sure you read [Solidity's documentation](https://docs.soliditylang.org/en/develop/contracts.html#view-functions) and learn its caveats.

An alternative way to solve this level is to build a view function which returns different results depends on input data but don't modify state, e.g. ```gasleft()```.

--> The isLastFloor of the Building interface should be declared as ```view``` or ```pure```. In both cases it cannot modify the state.