// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBank {
    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times
    function addEther() external payable {}

    /// @notice used to withdraw ether from the contract (No restriction on withdrawals)
    function removeEther(uint256 amount) external payable {}
}
