// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
  REQUIREMENTS
  1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
  2. Your contract will have a mapping of addresses to balances (address => uint)
  3. You will have a mint function that takes two parameters: an address and a value. 
     The function then increases the total supply by that number and increases the balance 
     of the "sender" address by that amount.
  4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
     It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
     and from the balance of the "sender".
  5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
     to the amount that is supposed to be burned.
*/

contract MyAssessmentToken {

  // Public variables for token details
  string public name = "PhilToken";
  string public symbol = "PHT";
  uint public totalSupply = 0;

  // Mapping to store balances
  mapping(address => uint) public balances;

  // Mint function to create new tokens for a recipient
  function mintToken(address recipient, uint value) public {
    totalSupply += value;  // Increase total supply
    balances[recipient] += value;  // Increase recipient's balance
  }

  // Burn function to destroy tokens held by the sender with safety check
  function burnToken(uint value) public {
    require(balances[msg.sender] >= value, "Insufficient balance to burn");  // Check sender's balance before burning
    totalSupply -= value;  // Decrease total supply
    balances[msg.sender] -= value;  // Decrease sender's balance
  }
}
