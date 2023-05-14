// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec32 {
    /*
        Payable: 이더/토큰과 상호작용시 필요한 키워드
                 send, transfer, call을 이용해 이더를 보낼 때 Payable이라는 키워드 필요
                 함수, 주소, 생성자에 붙여서 주로 사용
        
        msg.value: 송금을 보낼 코인의 값
        
        이더를 보낼 때 3가지
        1. send: 2300 gas를 소비, 성공 여부를 true 또는 false로 반환. 에러 값은 받지 못함
        2. transfer: 2300 gas 소비, 실패시 에러 발생
        3. call: 가변적인 gas 소비 (gas값 지정 가능). 성공 여부를 true or false 로 반환
                 재진입(re-entrancy) 공격 위험 존재, 2019년 12월 이후 call 사용 추천
    */

    event howMuch(uint _value);

    // _to: 이더를 받을 사람(스마트 컨트랙)
    // 이더를 받아야하니까 payable. 함수도 이더를 보내야 하니까 payable
    function sendNow(address payable _to) public payable {
        bool sent = _to.send(msg.value); // return true or false
        require(sent, "Falied to send ether");
        emit howMuch(msg.value);
    }

    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value); // transfer는 에러를 반환 가능하므로 굳이 에러체크x
        emit howMuch(msg.value);
    }

    function callNow(address payable _to) public payable {
        // 0.7~
        (bool sent, ) = _to.call{value: msg.value, gas: 1000}("");
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
    }
}
