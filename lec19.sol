// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 배열 매핑 주의점
// 값을 저장할 때 카피해서 저장하므로 num이 변경되도 불변

contract lec19 {
    uint num = 89;
    mapping(uint => uint) numMap;
    uint[] numArray;

    function changeNum(uint _num) public {
        num = _num;
    }

    function showNum() public view returns (uint) {
        return num;
    }

    function numMapAdd() public {
        numMap[0] = num;
    }

    function showNumMap() public view returns (uint) {
        return numMap[0];
    }

    function numArrayAdd() public {
        numArray.push(num);
    }

    function showNumArray() public view returns (uint) {
        return numArray[0];
    }

    // 이런 식으로 업데이트 함수를 호출해 값을 변경시켜줘야 함
    function updateArray() public {
        numArray[0] = num;
    }
}
