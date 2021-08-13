pragma solidity >=0.8.0;

contract SimpleCalculator {
  uint a;
  uint b;

  function setA(uint x) public payable {
    a = x;
  }
  
  function setB(uint x) public payable {
    b = x;
  }
  
  function mul() public view returns (uint) {
      return a * b;
  }
}