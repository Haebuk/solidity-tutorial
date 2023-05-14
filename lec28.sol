// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 외부 스마트 컨트랙을 생성할 때

contract character {
    string private name;
    uint private power;

    constructor(string memory _name, uint _power) {
        name = _name;
        power = _power;
    }
}

contract runner {
    event catchOnly(string _name, string _err);

    function playTryCatch(
        string memory _name,
        uint _power
    ) public returns (bool) {
        try new character(_name, _power) {
            return (true);
        } catch {
            emit catchOnly("catch", "Error");
            return (false);
        }
    }
}

// 스마트 컨트랙 내에서 함수를 부를 때
contract runner2 {
    event catchOnly(string _name, string _err);

    function simple() public returns (uint) {
        return 4;
    }

    function playTryCatch() public returns (uint, bool) {
        try this.simple() returns (uint _value) {
            return (_value, true);
        } catch {
            emit catchOnly("catch", "Error");
            return (0, false);
        }
    }
}
