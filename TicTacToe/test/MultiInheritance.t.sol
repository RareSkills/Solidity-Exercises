// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/MultiInheritance.sol";

contract MultiInheritanceTest is Test {
    MultiInheritance public multiInheritance;

    function setUp() public {
        multiInheritance = new MultiInheritance();
    }

    function testMultiInheritance() public {
        assertEq(multiInheritance.x(), 42, "x must return 42");
        assertEq(multiInheritance.y(), 24, "y must return 24");
    }
}
