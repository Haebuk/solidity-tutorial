// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 스마트 컨트랙을 다른 컨트랙에 상속

contract Father {
    string public familyName = "Kim";
    string public givenName = "hoon";
    uint public money = 100;

    constructor(string memory _givenName) public {
        givenName = _givenName;
    }

    function getFamilyName() public view returns (string memory) {
        return familyName;
    }

    function getGivenName() public view returns (string memory) {
        return givenName;
    }

    function getMoney() public view returns (uint) {
        return money;
    }
}

// Father 상속 - Son의 이름은 James
contract Son is Father("James") {

}
