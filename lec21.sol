// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec22 {
    event CountryIndexName(uint indexed _index, string _name);
    string[] private countryList = [
        "South Korea",
        "North Korea",
        "USA",
        "China",
        "Japan"
    ];

    // for loop
    function forLoopEvents() public {
        for (uint i = 0; i < countryList.length; i++) {
            emit CountryIndexName(i, countryList[i]);
        }
    }

    // while loop
    function whileLoopEvents() public {
        uint i = 0;
        while (i < countryList.length) {
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
    }

    // do while
    function doWhileLoopEvents() public {
        uint i = 0;
        do {
            emit CountryIndexName(i, countryList[i]);
            i++;
        } while (i < countryList.length);
    }
}
