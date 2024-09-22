// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Unchecked.sol";

contract UncheckedTest is Test {
    Unchecked public uncheckedContract;

    function setUp() public {
        uncheckedContract = new Unchecked();
    }

    function testUnchecked() public {
        uint256 result = uncheckedContract.getNumber(10);
        uint256 expected = type(uint256).max - 100 + 1 + 10;
        assertEq(result, expected, "unchecked should return underflow value");
    }

    function testUnchecked2() public {
        uint256 result = uncheckedContract.getNumber(100);
        uint256 expected = 0;
        assertEq(result, expected, "unchecked should return underflow value");
    }

    function testUnchecked3() public {
        uint256 result = uncheckedContract.getNumber(0);
        uint256 expected = type(uint256).max - 100 + 1;
        assertEq(result, expected, "unchecked should return underflow value");
    }

    function testUnchecked4() public {
        uint256 result = uncheckedContract.getNumber(type(uint256).max);
        uint256 expected = type(uint256).max - 100;
        assertEq(result, expected, "unchecked should return underflow value");
    }
}
