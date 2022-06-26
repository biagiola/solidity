
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    constructor() {
        // default user
        accounts.push(Account(0, "David"));
        accounts.push(Account(1, "Jules"));
        accounts.push(Account(2, "Stephen"));
        
        // default messages
        messages.push(Message(0, "User was added"));
        messages.push(Message(1, "User was updated"));
        messages.push(Message(2, "User was not updated"));
        messages.push(Message(3, "User was deleted"));
        messages.push(Message(4, "User was not deleted"));
    }

    struct Message {
        uint position;
        string text;
    }
    Message[] internal messages;

    struct Account {
        uint id;
        string name;
    }
    Account[] internal accounts;

    function createUser  (
        string memory name
    ) public payable returns(string memory) {
        accounts.push(Account(accounts.length, name));
        return messages[0].text;
    }

    function readAll() public view returns(Account[] memory) {
        return accounts;
    }

    function accountLengths() public view returns(uint256) {
        uint256 len = accounts.length;
        uint256 c;
        uint256 d = 0;
        for(c = 0; c < len; c++) {
            d++;
            if(keccak256(abi.encode(accounts[c].name)) == keccak256(abi.encode(""))) {
                d--;
            }
        }
        return d;
    }


    function readOneById(
        uint localId
    ) public view returns(Account memory) {
        uint c;
        for(c = 0; c < accounts.length; c++) {
            if(accounts[c].id == localId) {
                return accounts[c];
            } 
        }
        return accounts[0];
    }

    function readOneByName(
        string memory localName
    ) public view returns(Account memory) {
        uint c;
        for(c = 0; c < accounts.length; c++) {
            if(keccak256(abi.encode(accounts[c].name)) == keccak256(abi.encode(localName)) ) {  
                return accounts[c];
            } 
        }
        return accounts[0];
    }

    function updateUser(
        uint localId,
        string memory localName
    ) public payable returns(string memory) {
        uint c;
        for(c = 0; c < accounts.length; c++) {
            if(accounts[c].id == localId) {
                accounts[c].name = localName;
                return messages[1].text;
            } 
        }
        return messages[2].text;
    }

    function deleteUser(
        uint localId
    ) public payable returns (string memory) {
        delete accounts[localId];
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
