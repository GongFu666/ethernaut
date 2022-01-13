Solution
========

1. instance --> the address of the contract on the rinkeby network
2. (await contract.consecutiveWins()).toString() --> the number of consecutive wins --> 0
2. solution idea: The guess can either be true or false --> P(win10x) = 0.5^10 = 0.000976562, wich is very low. Implement the flip fuctionality in another smart contract (see CoinFlipCaller.sol) and call the CoinFlip contract with the flip result.
3. Use remix ide: Compile the contract, for deployment use the "Injected Web3"-environment (metamask) and make sure you are deploying the CoinFlipCaller contract, execute the call() function of CoinFlipCaller. This needs to be done ten times in a row but only once for each block, otherwise the transcation will revert. metamask will warn you about this.
4. Check the number of consecutive wins: (await contract.consecutiveWins()).toString() until it is equal to 10