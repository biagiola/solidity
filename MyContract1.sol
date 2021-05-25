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
}
