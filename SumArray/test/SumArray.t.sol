// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SumArray.sol";

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
        assertEq(x, 67252106, "expected sum of arr to be 67252106");

        uint256[] memory arr2 = new uint256[](0);
        uint256 x2 = sumArray.sumArray(arr2);
        assertEq(x2, 0, "expected empty array to return 0");
    }
}
