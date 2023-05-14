// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 함수의 리턴명 명시

contract lec29 {
    // return에 변수명을 명시하지 않으면
    function add(uint _num1, uint _num2) public pure returns (uint) {
        uint total = _num1 + _num2; // total 변수 정의
        return total;
    }

    // return에 total 변수명을 정의하면
    function add2(uint _num1, uint _num2) public pure returns (uint total) {
        total = _num1 + _num2; // total 정의 x
        return total;
    } // + 리턴 값이 여러개면 더 명확해진다.
}
