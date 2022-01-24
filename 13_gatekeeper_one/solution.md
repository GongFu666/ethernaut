Solution
========

Gate 1:
-------
An intermediate contract is required to interact with ```GatekeeperOne```. --> ```msg.sender != tx.origin```

Gate 2:
-------
We need to make sure that ```gasleft().mod(8191) == 0```. The gas that is left will vary depending on the compiler version and optimization settings used to deploy the factory contract. Therefore, we use a brute-force approach to meet the condition. Since we will be making multiple calls to the ```enter``` function of ```GatekeeperOne``` we have to use ```call``` instead of an abstract interface to avoid reverts from propagating.

Gate 3:
-------
see [this link](https://medium.com/coinmonks/ethernaut-lvl-13-gatekeeper-1-walkthrough-how-to-calculate-smart-contract-gas-consumption-and-eb4b042d3009)

1. Deploy the ```Player``` contract of GatekeeperOne.sol.
2. Call its ```enterTheGates``` function with your instance as parameter.
3. Check that you were successful with ```await contract.entrant()```.

--> SOLVED

Troubleshooting
===============

Adjust ```gasOffset``` and ```bufferSize``` of ```Player```if ```enterTheGates``` is not successful.