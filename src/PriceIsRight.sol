// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract PriceIsRight {
    /// @notice this doesn't revert when you send the correct amount of ether
    /// @dev correct amount = 1 ether
    function buy() public payable {}
}
