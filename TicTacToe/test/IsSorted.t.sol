// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/IsSorted.sol";

contract IsSortedTest is Test {
    IsSorted public isSorted;

    function setUp() public {
        isSorted = new IsSorted();
    }

    function testIsSorted() public {
        uint256[] memory x = new uint256[](5);
        x[0] = 1;
        x[1] = 2;
        x[2] = 13;
        x[3] = 23;
        x[4] = 123;

        uint256[] memory y = new uint256[](5);
        y[0] = 1;
        y[1] = 2;
        y[2] = 28;
        y[3] = 27;
        y[4] = 99;

        uint256[] memory z = new uint256[](5);
        z[0] = 0;
        z[1] = 0;
        z[2] = 0;
        z[3] = 0;
        z[4] = 0;

        assertEq(isSorted.isSorted(x), true, "x is sorted");
        assertEq(isSorted.isSorted(y), false, "y is not sorted");
        assertEq(isSorted.isSorted(z), true, "z is sorted");
    }
}
