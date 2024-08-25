// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(string memory tokenName, string memory symbol)
        ERC20(tokenName, symbol)
            Ownable(msg.sender) // Pass the owner address to Ownable constructor
    {}

    // Mint tokens
    function mintToken(address _sendto, uint256 _amount) public onlyOwner {
        require(_sendto != address(0), "Cannot mint to the zero address");
        require(_amount > 0, "Amount should be greater than zero");
        _mint(_sendto, _amount);
    }

    // Burn tokens
    function burnToken(uint256 _amount) public {
        require(_amount > 0, "Amount to burn should be greater than zero");
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance to burn");
        _burn(msg.sender, _amount);
    }

    // Transfer tokens
    function transferToken(address _toanother, uint256 _amounttransfer) public returns (bool) {
        require(_toanother != address(0), "Cannot transfer to the zero address");
        require(_amounttransfer > 0, "Amount should be greater than zero");
        return super.transfer(_toanother, _amounttransfer);
    }
}
