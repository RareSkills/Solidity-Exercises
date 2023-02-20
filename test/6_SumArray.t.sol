// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/6_SumArray.sol";

contract SumArrayTest is Test {
    SumArray public sumArray;

    function setUp() public {
        sumArray = new SumArray();
    }

    function testSumArray() external {
        uint256[] memory arr = new uint256[](10);
        arr[0] = 2;
        arr[1] = 4;
        arr[2] = 262;
        arr[3] = 8;
        arr[4] = 4;
        arr[5] = 1;
        arr[6] = 0;
        arr[7] = 17;
        arr[8] = 67251781;
        arr[9] = 27;

        uint256 x = sumArray.sumArray(arr);
        assertEq(x, 67252142);
    }
}
