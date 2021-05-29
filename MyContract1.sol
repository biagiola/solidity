pragma solidity ^0.4.24;

contract MyContract {
    string public constant welcomeMessage = "Welcome to my contract";

    bool public booleanValue = true;

    int8 public integerValue = 127;

    uint8 public unsignedIntegerValue = 33;

    uint16 public bigNumber = 65535; // [0, 2^16 - 1]       65.535

    uint32 public bigNumber2 = 4294967295; // [0, 2^32 - 1] 4.294.967.295

    int public bool1 = ~int256(0); 

    int public bool2 = int256(-1);


    // 1 - fixed-size types
    bool public booleans = true;
    uint public number = 15;
    address public addressExample = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 public data = 0x6162636400000000000000000000000000000000000000000000000000000000; // 64 digits

    // 2 - variable-size types
    string public name = "david";
    bytes _dat = 1;
    uint[] amounts;
    mapping(uint => string) users;
    
    // 3 - user-defined data
    struct User {
        uint id;
        string name;
        uint[] friendIds;
    }
    enum Color {
        RED,
        GREE,
        BLUE
    }

}
