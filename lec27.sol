// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// try/catch

/*
    0.6 버전 이후
    1. try/catch 문 안에서 assert/revert/require 통해 에러 난다면, catch는 에러를 잡지 못함
    2. 밖에서 assert/revert/require 통해 에러 난다면 catch로 에러가 들어간다.
    3. 3가지 종류가 있다.
        catch Error(string memory reason) { ... } : revert or require 통해 생성된 에러에 적합
        catch Panic(uint errorCode) { ... }: assert 통한 생성된 에러에 사용
            errorCode는 솔리디티 문서 참고
            0.8.1 버전 부터 있음
        catch: 로우 레벨 에러
    4. 주로 외부 컨트랙 함수를 부를 때나 외부 컨트랙을 생성할 때 사용한다.
    5. 내부에서 쓰고 싶을 때는 this를 통해 사용한다.
*/

contract math {
    function division(uint _num1, uint _num2) public pure returns (uint) {
        require(_num1 < 10, "num1 should not be more than 10");
        return _num1 / _num2;
    }
}

contract runner {
    event catchErr(string _name, string _err);
    event catchPanic(string _name, uint _err);
    event catchLowLevelErr(string _name, bytes _err);

    math public mathInstance = new math();

    function playTryCatch(uint _num1, uint _num2) public returns (uint, bool) {
        try mathInstance.division(_num1, _num2) returns (uint value) {
            // 잘 수행되면 value를 반환한다.
            return (value, true);
        } catch Error(string memory _err) {
            emit catchErr("revert/require", _err);
            return (0, false);
        } catch Panic(uint _errorCode) {
            emit catchPanic("assertError/Panic", _errorCode);
            return (0, false);
        } catch (bytes memory _errorCode) {
            emit catchLowLevelErr("LowlevelErr", _errorCode);
            return (0, false);
        }
    }
}
