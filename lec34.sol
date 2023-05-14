// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
    payable을 생성자에 넣을 때
    특정 주소에만 권한 주기
*/

contract MobileBanking {
    address owner;

    constructor() payable {
        owner = msg.sender; // 배포한 주소를 owner에 넣는다.
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }
    event SendInfo(address _msgSender, uint _currentValue);
    event MyCurrentValue(address _msgSender, uint _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint _value);

    function sendEther(address payable _to) public payable onlyOwner {
        require(msg.sender.balance >= msg.value, "your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender, (msg.sender).balance);
    }

    function checkValueNow() public onlyOwner {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public onlyOwner {
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}
