// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PureVsView {
    uint256 private x;

    // this code does not compile. Change it so
    // that it compiles.
    function getX() public pure returns (uint256) {
        return x;
    }

    function getY() public view returns (uint256) {
        return 21;
    }
}
