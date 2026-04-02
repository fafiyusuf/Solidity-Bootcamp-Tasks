// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ========== INHERITANCE PART ==========
contract Animal {
    function speak() public pure virtual returns (string memory) {
        return "Some sound";
    }
}

contract Dog is Animal {
    function speak() public pure override returns (string memory) {
        return "Bark";
    }
}

contract Cat is Animal {
    function speak() public pure override returns (string memory) {
        return "Meow";
    }
}

// ========== LIBRARY PART ==========
library MathLib {
    function sub(uint a, uint b) internal pure returns (uint) {
        require(b <= a, "Underflow not allowed");
        return a - b;
    }

    function multiply(uint a, uint b) internal pure returns (uint) {
        return a * b;
    }
}

contract Calculator {
    using MathLib for uint;

    function subtract(uint a, uint b) public pure returns (uint) {
        return a.sub(b);
    }

    function multiply(uint a, uint b) public pure returns (uint) {
        return a.multiply(b);
    }
}