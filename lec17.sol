// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 맵핑 - 키, 밸류 - 길이를 구할 수 없다.
// 없는 인덱스에 접근하면 기본값을 반환한다.
contract lec17 {
    mapping (uint => uint) private ageList;
    mapping (string => uint) private priceList;
    mapping (uint => string) private nameList;

    function setAgeList(uint _index, uint _age) public {
        ageList[_index] = _age;
    }

    function getAge(uint _index) public view returns (uint) {
        return ageList[_index];
    }

    function setNameList(uint _index, string memory _name) public {
        nameList[_index] = _name;
    }

    function getName(uint _index) public view returns (string memory) {
        return nameList[_index];
    }

    function setPriceList(string memory _itemName, uint _price) public {
        priceList[_itemName] = _price;
    }

    function getPrice(string memory _itemName) public view returns (uint) {
        return priceList[_itemName];
    }
}