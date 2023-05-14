// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// modifier

contract lec30 {
    // modifier가 파라미터 없을 때
    modifier onlyAdults() {
        revert("You are not allowed");
        _; // modifier를 사용한 곳이 적용되는 위치이다. 여기서는 BuyCigarrete()이 들어간다.
    }

    function BuyCigarrete() public onlyAdults returns (string memory) {
        return "Succeded";
    }

    // modifier가 파라미터 있을 때
    modifier onlyAdults2(uint _age) {
        require(_age > 18, "You are not allowed");
        _; // modifier를 사용한 곳이 적용되는 위치이다. 여기서는 BuyCigarrete()이 들어간다.
    }

    function BuyCigarrete2(
        uint _age
    ) public pure onlyAdults2(_age) returns (string memory) {
        return "Succeded";
    }
}
