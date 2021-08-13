pragma solidity >=0.8.0;

contract SimpleCalculator {
  uint x;

  function setX(uint n) public payable {
    x = n;
  }
  
  function pow() public view returns (uint) {
      return x * x;
  }
}