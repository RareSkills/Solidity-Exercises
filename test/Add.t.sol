// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Add.sol";

contract AddTest is Test {
    Add public add;

    function setUp() public {
        add = new Add();
    }

    function testAdd() public {
        uint256 sum = add.add(1, 2);
        assertEq(sum, 3, "expected sum to return 3");
    }
}
