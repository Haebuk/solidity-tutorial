// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Father {
    event FatherName(string name);

    function who() public virtual {
        emit FatherName("KimDaeho");
    }
}

contract Mother {
    event MotherName(string name);

    function who() public virtual {
        emit MotherName("KimDaeho");
    }
}

contract Son is
    Father,
    Mother // 맨 오른쪽것이 super로 반영된다
{
    function who() public override(Father, Mother) {
        super.who;
    }
}
