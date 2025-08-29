// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract PureVsView {
    uint256 private x = 24;
    uint256 private y = 42;

    // this code does not compile. Change it so
    // that it compiles.
    function getX() public view returns (uint256) {
        return x;
    }

    function getY() public view returns (uint256) {
        return y;
    }
}
