// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Add.sol";

contract AddTest is Test {
    Add public add;

    function setUp() public {
        add = new Add();
    }

    // a + b == b + a
    function testAddOne() public {
        assertEq(add.add(1, 2), add.add(2, 1), "expected a + b to equal b + a");
    }

    // a + 0 == a
    function testAddTwo() public {
        assertEq(add.add(4, 0), 4, "expected a + 0 to equal a");
    }

    // a + b == c
    function testAddThree() public {
        assertEq(add.add(4, 2), 6, "expected a + b to equal c");
    }
}
