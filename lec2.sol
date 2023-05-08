// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec2 {
    // boolean true or false
    bool public b = false;

    // ! == || &&

    // bytes 1~32 바이트까지
    bytes4 public bt = 0x12345678; // 하나당 4비트 - 두개가 1비트.
    bytes public bt2 = "STRING"; // 스트링이 몇 바이트인지 모르므로 숫자빼고 bytes만 입력하면 솔리디티가 알아서 해석

    // address: 사용자, 스마트컨트랙트별 주소
    address public addr = 0xd9145CCE52D386f254917e481eB44e9943F39138;

    // int uint. 보통 uint 많이 쓴다.
    uint public uit = 256;
}
