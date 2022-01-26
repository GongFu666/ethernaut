Solution
========

1. Get the nonce of your instance with ```await web3.eth.getTransactionCount(instance)``` --> this is the nonce AFTER the token contract was created --> use nonce = 1 to calculate the address of the token contract.
2. In NodeJS with ethers:
```const from = 'YOUR_INSTACNCE_ADDRESS';```
```const nonce = 1;```
```console.log(ethers.utils.getContractAddress({from, nonce}));```
ALTERNATIVELY: check the internal transactions of your instance on the [rinkeby testnet explorer](https://rinkeby.etherscan.io/) to get the contract address. How can we assume the contract address to be lost if it can be found there???
3. Paste the calculated contract address in the ```recoverFunds``` function of the ```Player``` contract.
4. Deploy ```Player```
5. Call ```recoverFunds``` with your player address as input --> SOLVED

Conclusion
==========

Contract addresses are deterministic and are calculated by ```keccack256(address, nonce)``` where the ```address``` is the address of the contract (or ethereum address that created the transaction) and ```nonce``` is the number of contracts the spawning contract has created (or the transaction nonce, for regular transactions).

Because of this, one can send ether to a pre-determined address (which has no private key) and later create a contract at that address which recovers the ether. This is a non-intuitive and somewhat secretive way to (dangerously) store ether without holding a private key.

An interesting [blog post](https://swende.se/blog/Ethereum_quirks_and_vulns.html) by Martin Swende details potential use cases of this.

If you're going to implement this technique, make sure you don't miss the nonce, or your funds will be lost forever.