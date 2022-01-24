Solution
========

Gate 1:
-------
An intermediate contract is required to interact with ```GatekeeperTwo```. --> ```msg.sender != tx.origin```

Gate 2:
-------
We need to call ```enter``` of ```GatekeeperTwo``` during the construction of the attacking contract. During initialization code execution, EXTCODESIZE on the address should return zero. --> When called from the constructor, ```extcodesize(caller()) == 0```

Gate 3:
-------
If ```A xor B = C```, then ```A xor C = B``` --> we directly calculate the key as ```bytes8 key = bytes8( uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1) );```

1. Deploy the ```Player``` contract of GatekeeperTwo.sol with the instance address as parameter.
2. Check that you were successful with ```await contract.entrant()```.

--> SOLVED

Conclusion
==========

Way to go! Now that you can get past the gatekeeper, you have what it takes to join theCyber, a decentralized club on the Ethereum mainnet. Get a passphrase by contacting the creator on reddit or via email and use it to register with the contract at gatekeepertwo.thecyber.eth (be aware that only the first 128 entrants will be accepted by the contract).
--> Sorry, you are too late to join the club...