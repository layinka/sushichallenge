pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract TokenB is ERC20 {
  

  constructor() ERC20('TokenB1s', 'TKNB') {
    _mint(msg.sender, 1000000000000000000000000); //1million
  }

}
