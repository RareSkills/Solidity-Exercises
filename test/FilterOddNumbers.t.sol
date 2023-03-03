// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/FilterOddNumbers.sol";

contract FilterOddNumbersTest is Test {
    FilterOddNumbers public filterContract;

    function setUp() public {
        filterContract = new FilterOddNumbers();
    }

    function testFilterOddNumbers() external {
        uint256[] memory arr1 = new uint256[](7);
        arr1[0] = 3;
        arr1[1] = 2;
        arr1[2] = 5;
        arr1[3] = 9;
        arr1[4] = 4;
        arr1[5] = 30;
        arr1[6] = 1;

        uint256[] memory filter1 = filterContract.filterOdd(arr1);

        assertEq(filter1[0], 2, "expected 2");
        assertEq(filter1[1], 4, "expected 4");
        assertEq(filter1[2], 30, "expected 30");

        uint256[] memory arr2 = new uint256[](10);
        arr2[0] = 36;
        arr2[1] = 10;
        arr2[2] = 5;
        arr2[3] = 9;
        arr2[4] = 4;
        arr2[5] = 19;
        arr2[6] = 11;
        arr2[7] = 12;
        arr2[8] = 2;
        arr2[9] = 20;

        uint256[] memory filter2 = filterContract.filterOdd(arr2);

        assertEq(filter2[0], 36, "expected 36");
        assertEq(filter2[1], 10, "expected 10");
        assertEq(filter2[2], 4, "expected 4");
        assertEq(filter2[3], 12, "expected 12");
        assertEq(filter2[4], 2, "expected 2");
        assertEq(filter2[5], 20, "expected 20");
    }
}
