// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 솔리디티는 프린트가 없음
// 이벤트를 통해 값 출력 - 블록 안에 저장되는 값들 - 꺼내서 쓸 수 있음

contract lec13 {
    // event명, 보내고자 하는 정보
    event info(string name, uint money);

    function sendMoney() public {
        emit info("KimDaeJin", 1000);
    }
}

// 배포 후 sendMoney() 실행 시 logs 항목에 정보가 남는다.
