pragma solidity ^0.5.1;
pragma experimental ABIEncoderV2; // this allow us to return structs

contract MyContract01 {
    struct Accounts {
        string email;
        uint position;
    }
    
    struct Messages {
        string message;
        uint position;
    }
    
    Accounts[] public account;
    Messages[] public message;
    uint256 peopleCount;
    
    
    
    constructor() public {
        message.push( Messages("Error. User not found", 0) );
        message.push( Messages("User was updated", 1) );
        message.push( Messages("Error. User not updated", 2) );
    }
    
    function addAccount(
        string memory email  
    ) public {
        account.push( Accounts(email, peopleCount) );
        peopleCount += 1;
    }
    
    function findAccount(string memory a) public view returns (Accounts memory) {
        
        // set our initial position
        uint8 position = 0;
        
        bool wasFound = false;
        
        // loop all the values
        while (position < peopleCount) {
            
            // look if emails are equals
            if (keccak256(abi.encode(a)) == keccak256(abi.encode(account[position].email)) ) {            
                // end of the loop
                wasFound = true;
                return account[position];
            }
            
            position += 1;   
        }
        
        // not found user
        if(!wasFound) {
            return errorMessage();
        }
    }
    
    function errorMessage() private view returns (Messages memory) {
        return message[0];
    }
    
    function updateAccount(
        string memory currentEmail,
        string memory newEmail
    ) public payable returns (string memory) {
        
        // set our initial position
        uint256 position = 0;
        
        // loop all the values
        while (position < peopleCount) {
            
            // look for the specific email
            if (keccak256(abi.encode(currentEmail)) == keccak256(abi.encode(account[position].email)) ) {
                
                // modify the email 
                account[position].email = newEmail;

                // end of the loop
                return "Email was updated";
            }
            
            position += 1;
        }
        
        return "user not found";
    }
}


// abi.encode() -> convert string into bytes

// Keccak is a fundamental part of solidity. Is a Secure hash algorithm. Ethereum-SHA-3
/* tightly packed arguments, means that below exmaple are equals
keccak256("ab", "c")
keccak256("abc")
keccak256(0x616263)
keccak256(6382179)
keccak256(97, 98, 99)
*/

// bytes(a).length != bytes(people[0]._email).length  -> compare lengths

// constant was removed in version 0.5.0 insted we use "view" or "pure"
