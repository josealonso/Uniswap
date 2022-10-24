// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Exchange {
    address public tokenAddress;
    IERC20 tokenContract;
    IERC20 WetherContract;

    constructor(address _token) {
        require(_token != address(0), "Invalid token address");
        IERC20 tokenAddress = IERC20(_token);
    }

    function swapTokensForEth(uint tokenReserve) public returns (uint reserve) {
        tokenContract.transfer(tokenAddress, tokenReserve);
        return 2 ether;
    }

    function swapEthForTokens(uint reserve)
        public
        payable
        returns (uint tokenReserve)
    {
        payable(msg.sender).call("", {"gas": "120"}); // {value: reserve};
        return 2;
    }
}
