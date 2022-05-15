// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyContract {
    struct Person {
        uint id;
        string firstName;
        string lastName;
    }
    mapping(uint => Person) public people2;

    uint256 public peopleCount;
    uint256 openingTime = 1652591160;
    
    modifier onlyWhileOpen() {
        require(block.timestamp <= openingTime); _;
    }
    
    function addPerson(
        string memory firstName, 
        string memory lastName
    ) 
        public 
        onlyWhileOpen
    {
        people2[peopleCount] = Person(peopleCount, firstName, lastName);
        peopleCount += 1;
    }
}
