pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract MyContract {
    struct Account {
        uint id;
        string name;
    }

    Account[] internal accounts;
    uint id = 0;

    struct Messages {
        string text;
        uint position;
    }

    function createUser(
        string memory name
    ) public {
        accounts.push(Account(id, name));
        id++;
    }

    function readAll() public view returns(Account[]){
        return accounts;        
    }

    function readOneById(
        uint localId
    ) public view returns(Account) {
        uint c;
        for(c=0; c<accounts.length; c++) {
            if(accounts[c].id == localId) {
                return accounts[c];
                c++;
            } 
        }
    }

    function readOneByName(
        string localName
    ) public view returns(Account) {
        uint c;
        for(c=0; c<accounts.length; c++) {
            if(keccak256(abi.encode(accounts[c].name)) == keccak256(abi.encode(localName)) ) {  
                return accounts[c];
                c++;
            } 
        }
    }

    function updateUser(
        uint localId,
        string localName
    ) public payable returns(bool) {
        uint c;
        for(c=0; c<accounts.length; c++) {
            if(accounts[c].id == localId) {
                accounts[c].name = localName;
                return true;
            } 
        }
        return false;
    }

    function deleteUser(
        uint localId
    ) public returns (bool) {
        delete accounts[localId];
        id--;
        return true;
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
