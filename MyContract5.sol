// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyContract {
    struct Person {
        uint id;
        string firstName;
        string lastName;
    }
    mapping(uint => Person) public list;

    address public owner;   
    uint256 public counter;
    
    constructor() { owner = msg.sender; }

    modifier onlyOwner() {
        require(msg.sender == owner); _;
    }
    
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
