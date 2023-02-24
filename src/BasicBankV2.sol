// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBankV2 {
    mapping(address => uint256) public balances;

    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times
    function addEther() external payable {}

    /// @notice used to withdraw ether from the contract
    /// @param amount of ether to remove. Cannot execeed balance.
    /// user cannot withdraw more than they deposited
    function removeEther(uint256 amount) external payable {}
}
