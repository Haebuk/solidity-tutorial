// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec7 {
    /*
    storage: 대부분의 변수, 함수들이 저장. 영속적으로 저장되며 가스 비용 비쌈
    memory: 함수의 파라미터, 리턴값, 레퍼런스 타입에 주로 사용. 영속적이지 않고 스토리지보다 가스비 쌈
    Colldata: 주로 external function의 파라미터에서 사용
    stack: evm에서 스택 데이터를 관리할 때 사용
    */

    // string을 메모리로 지정
    function get_string(
        string memory _str
    ) public pure returns (string memory) {
        return _str;
    }

    // 기본 타입은 디폴트가 메모리
    function get_uint(uint _ui) public pure returns (uint) {
        return _ui;
    }
}
