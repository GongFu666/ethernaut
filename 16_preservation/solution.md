Solution
========

1. Deploy the ```Player``` contract in Remix.
2. Call ```calculateInput``` of ```Player``` --> YOUR_INPUT
3. In the Ethernaut dev console: ```contract.setFirstTime(BigInt('YOUR_INPUT'))```. With this call, we manipulate the ```storedTime``` variable of the ```Library``` contract. Since the library is called with ```delegatecall```, the storage of ```Preservation``` at slot 0 is set to the address of the ```Player``` contract.
4. In the Ethernaut dev console: ```contract.setFirstTime(0)```. We call the same function again with an arbitrary input of 0. However, this time, the ```setTime``` function of Player is executed wich sets the owner address to the player address. Since this is again done via ```delegatecall```, we change the owner variable of ```Preservation``` since the storage layout of both contracts is identical.
5. check that you own the contract with ```await contract.owner()``` --> SOLVED

Conclusion
==========
As the previous level, ```delegate``` mentions, the use of ```delegatecall``` to call libraries can be risky. This is particularly true for contract libraries that have their own state. This example demonstrates why the ```library``` keyword should be used for building libraries, as it prevents the libraries from storing and accessing state variables.
