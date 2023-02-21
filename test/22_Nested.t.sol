// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/22_Nested.sol";

contract NestedTest is Test {
    Nested public nested;

    function setUp() public {
        nested = new Nested();

        nested.setNestedDetails(msg.sender, 10);
    }

    function testNestedDetails() public returns (bool) {
        bool val = nested.returnNestedDetails(msg.sender, 10);
        assertEq(val, true);
        return val;
    }
}
