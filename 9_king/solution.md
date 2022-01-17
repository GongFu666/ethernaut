Solution
========

1. (await contract.prize()).toString() --> It takes 0.001 ETH to become the King
2. Deploy the BadKing contract and send 0.002 ETH during the deployment. This is the only way to send funds to BadKing, since it has no ```fallback()``` function and the ```receive()``` function will always revert the transaction.
3. Execute ```becomeKing()``` of BadKing with you instance address as parameter. In this function 0.001 ETH is sent to the King contract and the BadKing claims the throne.
4. Submit the instance. The level will try to reclaim the throne by sending some ETH to King which will trigger the receive function. In the receive function, the King tries ```king.transfer(msg.value);```. However, this transfer will fail since the ```receive()``` function of the BadKing will always revert.
--> SOLVED

Conclusion
==========

Most of Ethernaut's levels try to expose (in an oversimpliefied form of course) something that actually happend. A real hack or a real bug.

In this case, see: [King of the Ether](https://www.kingoftheether.com/thrones/kingoftheether/index.html) and [King of the Ether Postmortem](http://www.kingoftheether.com/postmortem.html).