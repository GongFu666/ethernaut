Solution
========

1. Deploy Attacker of Force.sol
2. Send ETH to Attacker
3. Call attack with the instance address as parameter --> This will selfdestruct the Attacker contract and send its remaining ETH balance to the Force contract. This can not be stopped.

--> SOLVED

There are 3 ways for a contract to receive ETH:
1. fallback functions
2. receive mining rewards
3. through selfdestruction of another contract

Conclusion
==========

In solidity, for a contract to be able to receive ether, the fallback function must be marked payable.

However, there is no way to stop an attacker from sending ether to a contract by self destroying. Hence, it is important not to count on the invariant address(this).balance == 0 for any contract logic.