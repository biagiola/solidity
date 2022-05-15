// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyContract {
    struct Person {
        uint id;
        string firstName;
        string lastName;
    }

    Person[] public list1;

    mapping(uint => Person) public list2;
    
    uint256 public counter;
    
    function addPerson(string memory _firstName, string memory _lastName) public {
        list1.push(Person(counter,_firstName, _lastName));
        
        list2[counter] = Person(counter, _firstName, _lastName);
        
        counter++;
    }
}
