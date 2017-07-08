pragma solidity ^0.4.0;

contract CharityContract {

  struct Charity {
    address id;
    string name;
    string registration;
    bool operational;
    address creator;
  }
  mapping(address => Charity) charities;
  mapping (address => uint) fund;
  event Status(string msg, address caller);

  modifier ifCreator(address id) {
    if (charities[id].creator == msg.sender) {
      _;
    } else {
      Status('not registrar of charity', msg.sender);
      throw;
    }
  }

  function registerCharity (address id, string name, string registration, bool operational) {
    Charity charity = charities[id];
    charity.id = id;
    charity.name = name;
    charity.registration = registration;
    charity.creator = msg.sender;
    charity.operational = operational;
    Status('new charity registered', msg.sender);
  }

  function deregister (address id) ifCreator(id) {
    charities[id].operational == false;
    Status('charity de-registered', msg.sender);
  }

  function donate() payable {
    fund[msg.sender] = msg.value;
    Status('new donation', msg.sender);
  }

}
