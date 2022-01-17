Solution
========

1. Check on etherscan how much ETH is stored in the contract --> 0.001 ETH
2. Change the instance address to your current instance and deploy the Attacker contract. Send along 0.001 ETH during the deployment. Note that the amount to be donated and withdrawn is 0.0002 ETH. Therefore, when the contract is drained, the returned ETH is five times the donation --> MONEY!!!
3. Call ```donate()```.
4. Call ```drain()```.
5. The drained funds will be sent automatically to the player's address.
--> SOLVED

Conclusion
==========

In order to prevent re-entrancy attacks when moving funds out of your contract, use the [Checks-Effects-Interactions pattern](https://docs.soliditylang.org/en/develop/security-considerations.html#use-the-checks-effects-interactions-pattern) being aware that call will only return false without interrupting the execution flow. Solutions such as [ReentrancyGuard](https://docs.openzeppelin.com/contracts/2.x/api/utils#ReentrancyGuard) or [PullPayment](https://docs.openzeppelin.com/contracts/2.x/api/payment#PullPayment) can also be used.

transfer and send are no longer recommended solutions as they can potentially break contracts after the Istanbul hard fork [Source 1](https://consensys.net/diligence/blog/2019/09/stop-using-soliditys-transfer-now/) [Source 2](https://forum.openzeppelin.com/t/reentrancy-after-istanbul/1742).

Always assume that the receiver of the funds you are sending can be another contract, not just a regular address. Hence, it can execute code in its payable fallback method and re-enter your contract, possibly messing up your state/logic.

Re-entrancy is a common attack. You should always be prepared for it!

 

The DAO Hack
The famous DAO hack used reentrancy to extract a huge amount of ether from the victim contract. See [15 lines of code that could have prevented TheDAO Hack](https://blog.openzeppelin.com/15-lines-of-code-that-could-have-prevented-thedao-hack-782499e00942/).