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

    function addLiquidity(uint _tokenAmount) public payable {
        // transaction sender would have to call approve function on the token contract to allow our exchange contract to get their tokens.
        tokenContract.transferFrom(msg.sender, address(this), _tokenAmount);
        // Why can I use "transfer" ONLY when the recipient is an EOA ? Because an allowance is not required in that case.
        // tokenContract.transfer(address(this), _tokenAmount);   // Can I do this ?
        // return 2 ether;
    }

    // Helper function that returns token balance of an exchange
    function getReserve() public view returns (uint256) {
        return IERC20(tokenAddress).balanceOf(address(this));
    }

    function swapEthForTokens(uint reserve)
        public
        payable
        returns (uint tokenReserve)
    {
        // payable(msg.sender).call("", {"gas": "120"}); // {value: reserve};
        // return 2;
    }
}
