pragma solidity ^0.4.0;

contract HelloWorldUser {
  struct User {
      string name;
      uint age;
      bool isAdult;
  }

  event Status(string msg, address caller);

  mapping (uint => User) userAt;

  function createUser (uint id, string name, uint age, bool isAdult) {
    // userAt[id] = User({
    //     name: name,
    //     age: age,
    //     isAdult: isAdult
    // });

    //userAt[id] = User(name, age, isAdult);

    User user = userAt[id];
    user.name = name;
    user.age = age;
    user.isAdult = isAdult;

    Status('new user registered', msg.sender);
  }

  function getUser(uint id) constant returns(string, uint, bool) {
    string name = userAt[id].name;
    uint age = userAt[id].age;
    bool isAdult = userAt[id].isAdult;

    return (name, age, isAdult);
  }

}
