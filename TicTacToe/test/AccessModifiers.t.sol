// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/AccessModifiers.sol";

contract AccessModifiersTest is Test {
    Child public child;

    function setUp() public {
        child = new Child();
    }

    function testAccessModifiers() external {
        child.setValue(350);
        assertEq(child.getValue(), 350, "expected to be 350");

        child.setValue(878);
        assertEq(child.getValue(), 878, "expected to be 878");

        child.setValue(1_000);
        assertEq(child.getValue(), 1_000, "expected to be 1000");

        child.setValue(1);
        assertEq(child.getValue(), 1, "expected to be 1");
    }
}
