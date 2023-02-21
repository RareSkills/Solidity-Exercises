// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/2_IfStatement.sol";

contract IfStatementTest is Test {
    IfStatement public ifStatement;

    function setUp() public {
        ifStatement = new IfStatement();
    }

    function testMax() external {
        uint256 max = ifStatement.max(24, 42);
        assertEq(max, 42, "expected max to be 42");
    }

    function testMin() external {
        uint256 min = ifStatement.min(24, 42);
        assertEq(min, 24, "expected min to be 24");
    }
}
