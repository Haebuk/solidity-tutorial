// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract lec21 {
    string private outcome = "";

    function isIt5(uint _number) public returns (string memory) {
        if (_number == 5) {
            outcome = "Yes, it is 5";
            return outcome;
        }
        // return 하니까 else 안 써도 되긴 함
        else {
            outcome = "No, it is not 5";
            return outcome;
        }
    }

    function isIt5or3or1(uint _number) public returns (string memory) {
        if (_number == 5) {
            outcome = "Yes, it is 5";
            return outcome;
        } else if (_number == 3) {
            outcome = "Yes, it is 3";
            return outcome;
        } else if (_number == 1) {
            outcome = "Yes, it is 1";
            return outcome;
        }
        // return 하니까 else 안 써도 되긴 함
        else {
            outcome = "No, it is not 5, 3 or 1";
            return outcome;
        }
    }
}
