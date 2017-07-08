pragma solidity ^0.4.0;

contract HelloWorldContract {
  uint number;
  address public creator;
  uint public amount;

  function HelloWorldContract(uint _number) {
    number = _number;
    creator = msg.sender;
  }

  //constant keyword doesnt change the state of the contract
  function getNumber() constant returns(uint) {
    return number;
  }

  function getBalance() constant returns(uint) {
    return this.balance;
  }

  modifier ifCreator() {
    if (msg.sender == creator) {
      _;
    } else {
      revert();
    }
  }

  function withdraw() ifCreator {
    creator.transfer(this.balance);
  }

  function setNumber(uint _number) payable ifCreator {
    number = _number;
    amount = this.balance;
  }
}
