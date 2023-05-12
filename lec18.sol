// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 배열
// solidity에서는 매핑을 선호한다. 값을 순환하는 것이 D dos 공격에 취약하기 때문에
// 배열의 길이를 50으로 제한하는 것이 좋다고 한다.

contract lec18 {
    uint[] public ageArray;
    uint[10] public ageFixedSizeArray; // 길이 제한
    string[] public nameArray = ["a", "b"]; // 기본 값 주면서 시작

    function AgeLength() public view returns (uint) {
        return ageArray.length;
    }

    // index 0부터 시작
    function AgePush(uint _age) public {
        ageArray.push(_age);
    }

    function AgeGet(uint _index) public view returns (uint) {
        return ageArray[_index];
    }

    // 배열의 길이가 줄어듦
    function AgePop() public {
        ageArray.pop();
    }

    // 지우려는 인덱스의 값이 기본값(0)으로 바뀜. 길이 불변
    function AgeDelete(uint _index) public {
        delete ageArray[_index];
    }

    // 배열 밖 접근하면 에러
    function AgeChange(uint _index, uint _age) public {
        ageArray[_index] = _age;
    }
}
