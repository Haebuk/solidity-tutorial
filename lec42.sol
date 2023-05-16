// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
1. 1이더만 내야함
2. 중복해서 참여 불가 (단, 누군가 적립금 받으면 초기화)
3. 관리자만 적립된 이더 조회 가능
4. 3의 배수 번째 사람에게만 적립된 이더를 모두 준다.
*/

contract MoneyBox {
    event whoPaid(address indexed sender, uint payment);
    address owner;

    // mapping(address => bool) 만 쓰면 초기화시 모든 주소(키) 알아야 함
    // 키가 round값
    mapping (uint => mapping (address => bool)) paidMemberList;

    /*
    1 round: a, b, c(winner)
    2 round: e, r, d(winner)
    3 round: a, r, b(winner)
    */
    uint round = 1;

    constructor() {
        owner = msg.sender; // 초기 moneyBox 생성한 사람을 owner로 지정
    }

    receive() external payable {
        require(msg.value == 1 ether, "Must be 1 ether");
        require(paidMemberList[round][msg.sender] == false, "Must be a new player in each game");

        paidMemberList[round][msg.sender] = true;
        emit whoPaid(msg.sender, msg.value);

        // 스마트 컨트랙의 balance 체크 후 3번째 사람에게 모두 전송
        if (address(this).balance == 3 ether) {
            // ether를 받으려면 주소를 payable로 변경
            (bool sent,) = payable(msg.sender).call{value:address(this).balance}("");
            require(sent, "failed to pay");
            round++;
        }
    }

    function checkRound() public view returns(uint) {
        return round;
    }

    function checkValue() public view returns (uint) {
        require(owner==msg.sender, "only owner can check the value");
        return address(this).balance;
    }
}