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

        assertEq(result, 121, "expected result to be 121");
    }
}
