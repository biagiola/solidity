// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyContract {
    struct Person {
        uint id;
        string firstName;
        string lastName;
    }
    mapping(uint => Person) public list;

    uint256 public counter;
    address public owner;   

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() { owner = msg.sender; }
    
    function addPerson(
        string memory firstName, 
        string memory lastName
    ) 
        public onlyOwner
    {
        list[counter] = Person(counter, firstName, lastName);
        
        counter += 1;
    }
}

