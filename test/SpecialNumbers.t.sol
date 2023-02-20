// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/SpecialNumbers.sol";

contract SpecialNumbersTest is Test {
    SpecialNumbers public specialNumbers;

    function setUp() public {
        specialNumbers = new SpecialNumbers();
    }

    function testMakeNumberSpecial() external {
        specialNumbers.makeNumberNotSpecial(42);
        assert(specialNumbers.isSpecial(42));
    }

    function testMakeNumberNotSpecial() external {
        specialNumbers.makeNumberNotSpecial(42);
        specialNumbers.makeNumberNotSpecial(42);
        assert(!specialNumbers.isSpecial(42));
    }

    function testIsNumberSpecial() external {
        specialNumbers.makeNumberNotSpecial(42);
        assert(specialNumbers.isNumberSpecial(42));
        specialNumbers.makeNumberNotSpecial(42);
        assert(!specialNumbers.isNumberSpecial(42));
    }
}
