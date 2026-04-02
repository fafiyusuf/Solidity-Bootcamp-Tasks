// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {

    uint public storedNumber;

    // Store a number
    function store(uint _number) public {
        storedNumber = _number;
    }

    // Retrieve the number
    function retrieve() public view returns (uint) {
        return storedNumber;
    }

    // Bonus: Increment the number
    function increment() public {
        storedNumber += 1;
    }
}