// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// 오버라이딩

contract Father {
    string public familyName = "Kim";
    string public givenName = "hoon";
    uint public money = 100;

    constructor(string memory _givenName) public {
        givenName = _givenName;
    }

    function getFamilyName() view public returns (string memory) {
        return familyName;
    }

    function getGivenName() view public returns (string memory) {
        return givenName;
    } 
    // 오버라이딩할 함수 virtual
    function getMoney() view public virtual returns (uint) {
        return money;
    } 
}



contract Son is Father {
    
    constructor() Father("James"){} // 상속할 때 constructor를 지정하는 방법

    uint public earning = 0;
    function work() public {
        earning += 100;
    }
    // override 명시
    function getMoney() view public override returns (uint) {
        return money + earning;
    }
}