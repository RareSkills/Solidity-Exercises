// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Enum.sol";

contract EnumTest is Test {
    ExampleEnum public exampleEnum;

    function setUp() public {
        exampleEnum = new ExampleEnum();
    }

    function testIsWeekend() public {
        // Monday
        assertEq(exampleEnum.isWeekend(0), false, "expected to be false");
        // Tuesday
        assertEq(exampleEnum.isWeekend(1), false, "expected to be false");
        // Wednesday
        assertEq(exampleEnum.isWeekend(2), false, "expected to be false");
        // Thursday
        assertEq(exampleEnum.isWeekend(3), false, "expected to be false");
        // Friday
        assertEq(exampleEnum.isWeekend(4), false, "expected to be false");
        // Saturday
        assertEq(exampleEnum.isWeekend(5), true, "expected to be true");
        // Sunday
        assertEq(exampleEnum.isWeekend(6), true, "expected to be true");
    }
}
