pragma solidity ^0.5.1;

contract MyContract {
    uint256 public peopleCount;
    
    Person[] public people1;
    mapping(uint => Person) public people2;
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public {
        people1.push(Person(peopleCount,_firstName, _lastName));
        
        people2[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
        peopleCount += 1;
    }
    
}
