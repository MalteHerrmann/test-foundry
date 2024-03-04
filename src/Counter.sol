// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    address public owner;
    uint256 public number;

    constructor() {
        owner = msg.sender;
        number = 0;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function incrementOwner() public {
        require(msg.sender == owner, "only owner can do this");
        number++;
    }

    function subtract() public {
        number--;
    }
}
