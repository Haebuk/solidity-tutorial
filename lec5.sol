// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract lec5 {

    /*
    public: 모든 곳에서 접근 가능
    external: 정의된 자기자신 컨트랙 내에서 접근 불가
    private: 정의된 자기 컨트랙에서만 가능
    internal: 정의된 자기 컨트랙과 internal이 정의된 컨트랙을 상속하는 경우도 접근 가능
    */

    // 1. public
    uint public a = 5;
    
    // 2. private
    uint private a1 = 5; // 배포시 보이지 않음. 오직 lec5 컨트랙 내에서만
}

// 두 컨트랙 배포
contract Public_example {
    uint public a = 3;

    function changeA(uint _value) external {
        a = _value;
    }
    function get_a() view external returns (uint) { // view 는 다음에 설명
        return a;
    }
}

contract Public_example2 {
    Public_example instance = new Public_example(); // 컨트랙 인스턴스화. 다음에 설명

    function changeA_2(uint _value) public {
        instance.changeA(_value);
    }
    function use_public_example_a() view public returns (uint) {
        return instance.get_a();
    }
}