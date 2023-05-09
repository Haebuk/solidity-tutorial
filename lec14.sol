// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 인덱스 - 특정 이벤트의 값을 가져올 때 사용

contract lec14 {
    event numberTracker(uint num, string str);
    event numberTracker2(uint indexed num, string str);

    uint num = 0;

    function PushEvent(string memory _str) public {
        emit numberTracker(num, _str);
        emit numberTracker2(num, _str);
        num++;
    }
}
