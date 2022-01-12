Solution
========

1. instance --> the address of the contract on the rinkeby network
2. solution idea: The guess can either be true or false --> P(win10x) = 0.5^10 = 0.000976562, wich is very low. Assume guess = true. Implement the flip fuctionality in another smart contract (see CoinFlipCaller.sol) and call the CoinFlip contract with the flip result.
3. Use remix ide: Compile the contract, For deployment use the "Injected Web3"-environment (metamask), call winCoinFlip function of CoinFlipCaller with address of CoinFlip (use instance to get it) as parameter. Gas settings: Gas limit: 3 000 000 000. --> SOLVED
4. Check the number of consecutive wins: (await contract.consecutiveWins()).toString()

Open questions
==============

1. I am still unsure about the gas limit and the amount of gas passed to CoinFlip.flip(). How to calculate it upfront?

2. Sometimes, the transaction fails. Is this because of the blockhash check in CoinFlip?