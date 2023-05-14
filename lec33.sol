// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
    주소.balance: 해당 주소의 현재 갖고 있는 이더의 잔액 (msg.value는 송금액)

    msg.sender: 스마트 컨트랙을 사용하는 주체
*/

contract MobileBanking {
    event SendInfo(address _msgSender, uint _currentValue);
    event MyCurrentValue(address _msgSender, uint _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint _value);

    function sendEther(address payable _to) public payable {
        require(msg.sender.balance >= msg.value, "your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender, (msg.sender).balance);
    }

    function checkValueNow() public {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public {
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}
