// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SpecialNumbers.sol";

contract SpecialNumbersTest is Test {
    SpecialNumbers public specialNumbers;

    function setUp() public {
        specialNumbers = new SpecialNumbers();
    }

    function testMakeNumberSpecial() external {
        specialNumbers.makeNumberSpecial(42);
        assertEq(
            specialNumbers.isSpecial(42),
            true,
            "expected specialNumbers.isSpecial(42) to be true"
        );
    }

    function testMakeNumberNotSpecial() external {
        specialNumbers.makeNumberSpecial(42);
        specialNumbers.makeNumberNotSpecial(42);
        assertEq(
            specialNumbers.isSpecial(42),
            false,
            "expected specialNumbers.isSpecial(42) to be false"
        );
    }

    function testIsNumberSpecial() external {
        specialNumbers.makeNumberSpecial(42);
        assertEq(
            specialNumbers.isNumberSpecial(42),
            true,
            "expected specialNumbers.isNumberSpecial(42) to be true"
        );
        specialNumbers.makeNumberNotSpecial(42);
        assertEq(
            specialNumbers.isNumberSpecial(42),
            false,
            "expected specialNumbers.isNumberSpecial(42) to be false"
        );
    }
}
