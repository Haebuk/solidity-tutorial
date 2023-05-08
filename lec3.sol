// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec3 {
    // 1 ether = 10^9 Gwei = 10^18 wei
    // 10^-18 ether = 1 wei
    // 0.01 ether = 10^16 wei
    // Gwei: 가스 지불 단위
    // 가스: 스마트컨트랙트를 이용할 때 지불하는 비용

    uint public value = 1 ether;
    uint public value2 = 1 gwei;
    uint public value3 = 1 wei;
}
