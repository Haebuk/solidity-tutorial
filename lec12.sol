// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// 두 개 이상 상속

contract Father {
    uint public fatherMoney = 100;
    
    function getFatherName() public pure returns (string memory) {
        return "KimJung";
    }
    
    function getMoney() public view virtual returns (uint) {
        return fatherMoney;
    }
    
}

contract Mother {
    uint public motherMoney = 500;
    
    function getMotherName() public pure returns (string memory) {
        return "LeeSol";
    }
    
    function getMoney() public view virtual returns (uint) {
        return motherMoney;
    }
}
/*
Father와 Mother 둘 다 getMoney() 메서드가 있기 때문에 반드시 Son에서 오버라이딩을 해야함.
*/
contract Son is Father, Mother {
    function getMoney() public view override(Father, Mother)  returns (uint) {
        return fatherMoney + motherMoney;
    }
}