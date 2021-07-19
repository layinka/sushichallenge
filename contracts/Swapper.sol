// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './interfaces/IUniswapV2Router02.sol';
import './interfaces/IUniswapV2ERC20.sol';

contract Swapper {
  IUniswapV2Router02 immutable  router;
  address public owner = msg.sender;
  uint public last_completed_migration;
  address sushiSwapV2RouterAddress = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506 ;

  constructor(/*address sushiSwapV2RouterAddress*/){
      router = IUniswapV2Router02(sushiSwapV2RouterAddress);
  }

  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  function swap(address tokenInAddress,address tokenOutAddress, uint amount,uint amountOutMin, address to) public  { // public restricted
    require(amount > 0, 'ZERO_AMOUNT');
    IUniswapV2ERC20 tokenIn = IUniswapV2ERC20(tokenInAddress);
    IUniswapV2ERC20 tokenOut = IUniswapV2ERC20(tokenOutAddress);
    // transfer tokenIn to smart Contract
    uint amountIn = amount * 10 ** tokenIn.decimals();

    
    require(tokenIn.transferFrom(msg.sender, address(this), amountIn), 'transferFrom failed.');

    //then approve
    require(tokenIn.approve(address(router), amountIn), 'approve router failed.');

    //Then swap
    address[] memory path = new address[](2);
    path[0] = tokenInAddress;
    path[1] = tokenOutAddress;
    
    router.swapExactTokensForTokens(
        amountIn,
        0, // amountOutMin
        path,
        to,
        block.timestamp + 15 // deadline
    );
    
    


  }


}