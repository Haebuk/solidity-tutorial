# Solidity Example

## [Lec1](./lec1.sol)
[Remix](https://remix.ethereum.org/#optimize=f  alse&evmVersion=null&version=builtin&lang=en&runs=200) 사용
- 컴파일러 버전 선택, 솔리디티 버전과 라이센스 명시해야 함
- contract를 작성하면 deploy에서 자동으로 contract가 잡힌다.

## [Lec2](./lec2.sol)
- boolean: `true` or `false`
- bytes: 1~32바이트
  - `bytes public bt = "STRING"`
- `bytes4`: 4바이트
  - `bytes4 public bt = 0x12345678;`
- address: 사용자나 스마트 컨트랙별 주소
  - `address public addr = 0xd9145CCE52D386f254917e481eB44e9943F39138;`

## [Lec3](./lec3.sol)
- 1ether = 10^9Gwei = 10^18wei
- Gwei: 가스 지불 단위

## [Lec4](./lec4.sol)
- 함수 기본 포맷

```solidity
function FUNCTION_NAME(TYPE PARAMETER_NAME) public[external, private, external] returns (TYPE) {
    ...
}
```

- 예시

```solidity
function changeA(uint _value) public returns (uint) {
    a = _value;
    return a;
}

```

## [Lec5](./lec5.sol)
- public: 모든 곳에서 접근 가능
- external: public처럼 외부에서 접근 가능하나 정의된 자기자신의 컨트랙 내에서는 접근 불가
- private: 정의된 자기 컨트랙내에서만 접근 가능
- internal: private과는 다르게 internal이 정의된 컨트랙을 상속하는 경우도 접근 가능

## [Lec6](./lec6.sol)
- view: function 밖의 변수를 읽을 수는 있으나 변경 **불가**

```solidity
uint public a = 1;
function read_a() public view returns (uint) {
    return a + 2; // a를 변경하지 않음에 유의
}
```
- pure: function 밖의 변수를 읽지도 못하고 변경도 불가능

```solidity
function read_b() public pure returns (uint) {
    uint b = 2;
    return 4 + b;
}
```
- 둘 다 명시하지 않는 경우 function 밖의 변수를 읽고 변경해야 함
```solidity
function read_a2() public returns (uint) {
    a = 13;
    return a;
}

```
## [Lec7](./lec7.sol)
- storage: 대부분의 변수와 함수. 영속적으로 저장되며 가스 비용이 높음
- memory: 함수의 파라미터, 리턴값, 레퍼런스 타입에 주로 사용. 영속적이지 않고 storage보다 가스비가 저렴. 기본 타입은 디폴트가 memory임

```solidity
function get_string(string memory _str) public pure returns (string memory) {
    return _str
}
```
