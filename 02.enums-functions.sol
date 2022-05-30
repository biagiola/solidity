pragma solidity ^0.4.24;

contract MyContract {
    enum State { Waiting, Ready, Active }
    State public state;
    
    constructor() public {
        state = State.Waiting;
    }
    
    function active() public {
        state = State.Active;
    }
    
    function waiting() public {
        state = State.Waiting;
    }
    
    function ready() public {
        state = State.Ready;
    }
    
    function isActive() public view returns(bool) {
        return state == State.Active;
    }
    
    function isWaiting() public view returns(bool) {
        return state == State.Waiting;
    }
    
    function isReady() public view returns(bool) {
        return state == State.Ready;
    }
}
