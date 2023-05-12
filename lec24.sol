// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec24 {
    event CountryIndexName(uint indexed _index, string _name);
    string[] private countryList = [
        "South Korea",
        "North Korea",
        "USA",
        "China",
        "Japan"
    ];

    function linearSearch(
        string memory _search
    ) public view returns (uint, string memory) {
        for (uint i = 0; i < countryList.length; i++) {
            // string 솔리디티 내에서 비교
            // string -> byte -> 내장함수로 해시화 -> 비교
            if (keccak256(bytes(countryList[i])) == keccak256(bytes(_search))) {
                return (i, countryList[i]);
            }
        }

        return (0, "Nothing");
    }
}
