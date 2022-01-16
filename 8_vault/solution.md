Solution
========

Access the value of the private variable password of the Vault contract. An explanation in which storage slot the password variable is stored can be found [here](https://medium.com/coinmonks/how-to-read-private-variables-in-contract-storage-with-truffle-ethernaut-lvl-8-walkthrough-b2382741da9f). --> slot 1

The script index.js uses ethers.js to read the storage data of the contract. This data is used to unlock the contract. The script also converts the password to ascii and logs it to the console. --> "A very strong secret password :)" Adjust address to you instance, the slot should be set to 1. 

1. run ```$ npm install```
2. run ```$ node index.js```
3. Copy the bytes32 from the terminal and execute ```await contract.unlock("bytes32")``` in the ethernaut console of your browser.
4. Check that the contract is unlocked with ```await contract.locked()```