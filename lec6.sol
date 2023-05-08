// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract lec6 {
    /*
    view: function 밖의 변수를 읽을 수는 있으나 변경 불가
    pure: function 밖의 변수를 읽지 못하고 변경도 불가능
    둘다 명시하지 않을 때: function 밖의 변수를 읽어서 변경 해야함.
    */

    // 1. view
    uint public a = 1;

    function read_a() public view returns (uint) {
        return a + 2; // a를 변경하지 않음.
    }

    // 2. pure
    function read_a2() public pure returns (uint) {
        uint b = 2;
        return 4 + b;
    }

    // 3. 둘다X. 값이 나오지 않는다.
    function read_a3() public returns (uint) {
        a = 13;
        return a;
    }

}