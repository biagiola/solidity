pragma solidity ^0.5.1;

contract MyContract {
    uint256 public peopleCount;
    mapping(uint => Person) public people2;
    
    uint256 openingTime = 1619376672;
    
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }
    
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(
        string memory _firstName, 
        string memory _lastName
    ) 
        public 
        onlyWhileOpen
    {
        people2[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
        incrementCount();
    }
    
    function incrementCount() internal {
        peopleCount += 1;
    }
    
    
}
