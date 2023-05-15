// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

/*
    fallback: 대비책 함수
    특징:
        1. 무기명 함수, 이름이 없다.
        2. external, payable 필수

    왜 쓰는가?
        1. 컨트랙이 이더를 받을 수 있게 한다.
        2. 이더를 받고 어떤 행동을 취하게 할 수 있다.
        3. call 함수로 없는 함수가 불려질 때, 특정 행동을 취하게 할 수 있다.

    0.6 이전
        function() external payable {}

    0.6 이후
        fallback은 receive와 fallback 두가지로 나뉘어짐
        receive: 순수하게 이더만 받을 때 작동
        fallback: 함수를 실행하면서 이더를 보낼 때, 불려진 함수가 없을 시 작동 

        기본형: 불려진 함수가 특정 컨트랙이 없을 때 Fallback 함수 발동
            fallback() external {}
        payable 적용시: 이더 받고난 후 fallback 함수 발동
            fallback() external payable {}
        
            receieve() external payalble {}
*/

// 0.6 이전
// contract Bank {
//     event JustFallbackWithFunds(address _from, uint _value, string message);
//     function() external payable {
//         emit JustFallbackWithFunds(msg.sender, msg.value, "Just Event");
//     }
// }

// contract You {
//     function DepositWithSend(address payable _to) public payable {
//         bool success = _to.send(msg.value);
//         require(success, "failed");
//     }

//     function DepositWithTransfer(address payable _to) public payable {
//         _to.transfer(msg.value);
//     }

//     function DepositWithCall(address payable _to) public payable {
//         // ~0.7
//         (bool sent, ) = _to.call.value(msg.value)("");
//         require(sent, "failed to send ether");
//     }

//     function JustGiveMessage(address _to) public {
//         (bool sent, ) = _to.call("HI");
//         require(sent, "failed to send ether");
//     }

//     function JustGiveMessageWithFunds(address payable _to) public payable {
//         (bool sent, ) = _to.call.value(msg.value)("HI");
//         require(sent, "failed to send ether");
//     }
// }

contract Bank {
    event JustFallback(address _from, string message);
    event ReceiveFallback(address _from, uint _value, string message);
    event JustFallbackWithFunds(address _from, uint _value, string message);

    // fallback() external {
    //     emit JustFallback(msg.sender, "JustFallback is called");
    // }
    receive() external payable {
        emit ReceiveFallback(
            msg.sender,
            msg.value,
            "ReceiveFallback is called"
        );
    }

    fallback() external payable {
        emit JustFallbackWithFunds(
            msg.sender,
            msg.value,
            "ReceiveFallbackWithFunds is called"
        );
    }
}

// 0.6 이후
contract You {
    function DepositWithSend(address payable _to) public payable {
        bool success = _to.send(msg.value);
        require(success, "failed");
    }

    function DepositWithTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function DepositWithCall(address payable _to) public payable {
        // ~0.7
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "failed to send ether");
    }

    function JustGiveMessage(address _to) public {
        (bool sent, ) = _to.call("HI");
        require(sent, "failed to send ether");
    }

    function JustGiveMessageWithFunds(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("HI");
        require(sent, "failed to send ether");
    }
}
