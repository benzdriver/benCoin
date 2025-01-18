// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BenCoin {
    string public name = "BenCoin";
    string public symbol = "Ben";
    uint8 public decimal = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    constructor(uint256 _totalSupply){
        totalSupply = _totalSupply * 10 ** decimal;
        balanceOf[msg.sender] = totalSupply;
    }

function transfer(address to, uint256 amount) public returns (bool) {
    uint256 senderBalance = balanceOf[msg.sender];
    require(senderBalance >= amount, "Insufficient balance");
    require(to != address(0), "Invalid recipient");
    unchecked {
        balanceOf[msg.sender] = senderBalance - amount;
    }
    balanceOf[to] += amount; 
    emit Transfer(msg.sender, to, amount);
    return true;
}

}