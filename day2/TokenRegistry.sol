// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenRegistry {

    // 1. Struct
    struct Token {
        string name;
        string symbol;
        address owner;
        bool isActive;
    }

    // 2. Mapping (ID => Token)
    mapping(uint256 => Token) public tokens;

    // 3. Array of IDs
    uint256[] public tokenIds;

    // Counter for IDs
    uint256 private nextId = 1;

    // Bonus: Event
    event TokenRegistered(uint256 id, string name, string symbol, address owner);

    // 4. Register Token
    function registerToken(string memory name, string memory symbol) public {

        // Bonus: validation
        require(bytes(name).length > 0, "Name cannot be empty");
        require(bytes(symbol).length > 0, "Symbol cannot be empty");

        uint256 id = nextId;

        tokens[id] = Token({
            name: name,
            symbol: symbol,
            owner: msg.sender,
            isActive: true
        });

        tokenIds.push(id);
        nextId++;

        emit TokenRegistered(id, name, symbol, msg.sender);
    }

    // Deactivate Token
    function deactivateToken(uint256 id) public {

        // Check if token exists
        require(tokens[id].owner != address(0), "Token does not exist");

        // Only owner can deactivate
        require(tokens[id].owner == msg.sender, "Not the owner");

        tokens[id].isActive = false;
    }

    // Get Token
    function getToken(uint256 id) public view returns (
        string memory,
        string memory,
        address,
        bool
    ) {
        Token memory t = tokens[id];
        return (t.name, t.symbol, t.owner, t.isActive);
    }

    // Get all IDs
    function getAllTokenIds() public view returns (uint256[] memory) {
        return tokenIds;
    }
}