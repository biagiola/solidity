pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract MyContract {
    constructor() public {
        messages.push(Message("User was added", 0));
        messages.push(Message("User was updated", 1));
        messages.push(Message("User was not updated", 2));
        messages.push(Message("User was deleted", 3));
        messages.push(Message("User was not deleted", 4));
    }

    struct Message {
        string text;
        uint position;
    }
    Message[] internal messages;

    struct Account {
        uint id;
        string name;
    }
    Account[] internal accounts;
    uint id = 0;     

    function createUser(
        string memory name
    ) public returns(string memory) {
        accounts.push(Account(id, name));
        id++;
        return messages[0].text;
    }

    function readAll() public view returns(Account[]) {
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
    ) public payable returns(string memory) {
        uint c;
        for(c=0; c<accounts.length; c++) {
            if(accounts[c].id == localId) {
                accounts[c].name = localName;
                return messages[1].text;
            } 
        }
        return messages[2].text;
    }

    function deleteUser(
        uint localId
    ) public returns (string memory) {
        delete accounts[localId];
        id--;
        return messages[3].text;
    }
}

// abi.encode() -> convert string into bytes

// Keccak is a fundamental part of solidity. Is a Secure hash algorithm. Ethereum-SHA-3
/* tightly packed arguments: means that, below examples, are equals.
keccak256("ab", "c")
keccak256("abc")
keccak256(0x616263)
keccak256(6382179)
keccak256(97, 98, 99)
*/

// bytes(a).length != bytes(people[0]._email).length  -> compare lengths

// constant was removed in version 0.5.0 insted we use "view" or "pure"
