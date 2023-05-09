// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 컨트랙을 잇는다
contract A {
    uint public a = 5;

    function change(uint _value) public {
        a = _value;
    }
}

contract B {
    A my_instance = new A();

    function get_A() public view returns (uint) {
        return my_instance.a(); // 괄호를 반드시 붙여야함
    }

    function change_A(uint _value) public {
        my_instance.change(_value);
    }
}
