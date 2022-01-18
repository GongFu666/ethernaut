// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/math/SafeMath.sol";

contract GatekeeperOne {

  using SafeMath for uint256;
  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(gasleft().mod(8191) == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract Player {

  function enterTheGates(address gatekeeper) public {

    bytes8 key = bytes8(uint64(uint16(tx.origin)) + 2 ** 32);

    bytes memory encodedParams = abi.encodeWithSignature(("enter(bytes8)"), key);

    // NOTE: the proper gas offset to use will vary depending on the compiler
    // version and optimization settings used to deploy the factory contract.
    // To migitage, brute-force a range of possible values of gas to forward.
    // Using call (vs. an abstract interface) prevents reverts from propagating.
    // gas offset usually comes in around 210, give a buffer of 80 on each side
    uint gasOffset = 210;
    uint bufferSize = 80;
    for (uint256 i = 0; i < 2*bufferSize; i++) {
      (bool success,) = gatekeeper.call{gas: i + (gasOffset-bufferSize) + 8191 * 3}(encodedParams);

      if(success){
        break;
      }
    }
  }
}