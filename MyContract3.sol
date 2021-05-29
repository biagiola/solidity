pragma solidity ^0.5.1;

contract MyContract01 {
    Accounts[] public account;
    
    uint256 peopleCount;
    
    struct Accounts {
        string email;
    }
    
    function addAccount(
        string memory email  
    ) public {
        account.push( Accounts(email) );
        peopleCount += 1;
    }
    
    function findAccount(string memory a) public view returns (string memory) {
        
        // set our initial position
        uint256 position = 0;
        
        // loop all the values
        while (position < peopleCount) {
            
            // look if emails are equals
            if (keccak256(abi.encode(a)) == keccak256(abi.encode(account[0].email)) ) {
                
                // save the account found
                string memory result = account[position].email;

                // end of the loop
                return result;
            }
            
            position += 1;
        }
    }
}

// abi.encode() -> convert string into bytes

// bytes(a).length != bytes(people[0]._email).length  -> compare lengths

// constant was removed in version 0.5.0 insted we use "view" or "pure"