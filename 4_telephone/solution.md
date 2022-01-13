Theory
======

1. Difference between tx.origin and msg.sender: see [ethereum.stackexchange](https://ethereum.stackexchange.com/questions/1891/whats-the-difference-between-msg-sender-and-tx-origin). In a simple call chain A->B->C->D, inside D msg.sender will be C, and tx.origin will be A.

Solution
========

Idea: Deploy intermediate contract which calls the Telephone contract --> tx.origin != msg.sender

1. Deploy TelephoneCaller in Remix IDE.
2. Execute the callTelephone function with your player address as parameter.
3. Check your ownership with await contract.owner()

--> SOLVED

