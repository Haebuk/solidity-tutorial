// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// super - 오버라이딩할 때 사용.

contract Father {
    event FatherName(string name);  
    function who() public virtual {
        emit FatherName("KimDaeho");
    }
}

contract Son is Father {
    event sonName(string name);
    function who() public override {
        super.who();
        emit sonName("KimJin"); // KimDaeho와 KimJin 모두 출력
    }
}
