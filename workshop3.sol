pragma solidity ^0.4.0;

contract HelloWorldContract {
  mapping (address => uint) coinsOf;

  function buyToken() payable {
    coinsOf[msg.sender] = msg.value;
  }

  function getTokens() constant returns(uint) {
    return coinsOf[msg.sender];
  }

}
