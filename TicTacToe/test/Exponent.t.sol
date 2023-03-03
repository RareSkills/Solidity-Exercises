// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Exponent.sol";

contract ExponentTest is Test {
    Exponent public exponent;

    function setUp() public {
        exponent = new Exponent();
    }

    function testGetExpResult() external {
        uint256 result = exponent.getResult(11, 2);
        uint256 result1 = exponent.getResult(26, 5);
        uint256 result2 = exponent.getResult(5, 2);
        uint256 result3 = exponent.getResult(2, 20);

        assertEq(result, 121, "expected result to be 121");
        assertEq(result1, 11881376, "expected result to be 11881376");
        assertEq(result2, 25, "expected result to be 25");
        assertEq(result3, 1048576, "expected result to be 1048576");
    }
}
