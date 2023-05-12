// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;  

// 에러핸들러: require, revert, assert, try/catch

contract lec25 {
    /*
        0.4.22 ~ 0.7.x
        assert: 가스를 다 소비하고(환불X), 특정 조건에 부합하지 않으면 에러를 발생시킨다.
        revert: 조건없이 에러를 발생시키고 가스를 환불 시켜준다.
        require: 특정 조건에 부합하지 않으면 에러를 발생시키고, 가스를 환불 시켜준다.
    */

    function assertNow() public pure {
        assert(false);
    } // 보통 테스트용으로 쓴다. 컨트랙이 잘 돌아가는지 테스트할 때 쓴다.

    function revertNow() public pure {
        revert("error message");
    } // if 문을 줘서 조건을 주거나 require를 쓴다.

    function requireNow() public pure {
        require(false, "occured");
    }    

    function onlyAdults(uint _age) public pure  returns (string memory) {
        if (_age < 19) {
            revert("You are not allowed"); // if 가 true일 때 revert 발생
        }
        return "Your payment is succeed";
    }

    function onlyAdults2(uint _age) public pure returns (string memory) {
        require(_age>19, "You are not allowed"); // 조건문이 false 일 때 require 발생
        return "Your payment is succeed";
    }
}