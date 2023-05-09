// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 변수의 값을 초기화할 때 사용

contract A {
    string public name;
    uint public age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }

    function change(string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }
}

contract B {
    A my_instance = new A("Alice", 52);

    function get() public view returns (string memory, uint) {
        return (my_instance.name(), my_instance.age()); // multiple return
    }

    function change(string memory _name, uint _age) public {
        my_instance.change(_name, _age);
    }
}

// 인스턴스는 가스가 많이든다 - B에서 A의 모든 것을 들고 오기 때문에
