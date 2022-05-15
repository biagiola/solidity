// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyContract {
    mapping(address => uint256) public balances;
    
    address payable wallet;
    
    constructor(address payable _wallet) {
        wallet = _wallet;
    }
    
    function buyToken() public payable {
        // buy a token
        balances[msg.sender] += 1;
        
        // send ether to a wallet 
        wallet.transfer(msg.value);
    }
}

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
