pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract TokenA is ERC20 {
  

  constructor() ERC20('TokenA1', 'TKNA') {
    _mint(msg.sender, 1000000000000000000000000);
  }

}
