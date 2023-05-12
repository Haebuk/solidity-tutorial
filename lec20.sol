// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// 구조체

contract lec20 {
    struct Character {
        uint age;
        string name;
        string job;
    }

    mapping(uint => Character) public CharacterMapping;
    Character[] public CharacterArray;

    function createCharacter(
        uint _age,
        string memory _name,
        string memory _job
    ) public pure returns (Character memory) {
        return Character(_age, _name, _job);
    }

    function createCharacterMapping(
        uint _key,
        uint _age,
        string memory _name,
        string memory _job
    ) public {
        CharacterMapping[_key] = Character(_age, _name, _job);
    }

    function getCharacterMapping(
        uint _key
    ) public view returns (Character memory) {
        return CharacterMapping[_key];
    }

    function createCharacterArray(
        uint _age,
        string memory _name,
        string memory _job
    ) public {
        CharacterArray.push(Character(_age, _name, _job));
    }

    function getCharacterArray(
        uint _index
    ) public view returns (Character memory) {
        return CharacterArray[_index];
    }
}
