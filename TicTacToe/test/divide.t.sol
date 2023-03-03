// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Divide.sol";

contract DivideTest is Test {
    Divide public divide;

    function setUp() public {
        divide = new Divide();
    }

    function testDivide() public {
        assertEq(
            divide.PERCENTAGE_INTEREST(),
            3,
            "percentage interst must equal 3 and shouldn;t be changed"
        );

        assertEq(
            divide.calculateInterest(1_000_000),
            30_000,
            "3% of 1_000_000 should return 30_000 in solidity"
        );
        assertEq(
            divide.calculateInterest(10_000_000),
            300_000,
            "3% of 10_000_000 should return 300_000 in solidity"
        );
        assertEq(
            divide.calculateInterest(100_000_000),
            3_000_000,
            "3% of 100_000_000 should return 3_000_000 in solidity"
        );
    }
}
