// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec4 {
    uint public a = 3;

    // 1. 파라미터와 리턴값이 없는 함수
    function changeA1() public {
        a = 5;
    }

    // 2. 파라미터는 있고 리턴값이 없는 함수
    function changeA2(uint _value) public {
        a = _value;
    }

    // 3. 파라미터와 리턴값 둘 다 있는 함수
    function changeA3(uint _value) public returns (uint) {
        a = _value;
        return a;
    }
}
