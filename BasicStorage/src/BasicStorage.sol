// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicStorage {
    uint256 private x;

    function setX(uint256 newValue) public {
        // your code here
        x = newValue;
    }

    function getX() public view returns (uint256) {
        // your code here
        return x;
    }
}
