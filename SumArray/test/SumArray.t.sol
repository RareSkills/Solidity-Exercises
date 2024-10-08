// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SumArray.sol";

contract SumArrayTest is Test {
    SumArray public sumArray;

    function setUp() public {
        sumArray = new SumArray();
    }

    function testSumArrayMultipleElements() external {
        // Allocate arr with a length of 10
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
        assertEq(
            x,
            67252106,
            "expected sum of arr with multiple elements to be 67252106"
        );
    }

    function testSumArrayEmptyArray() external {
        // Define arr as an empty array
        uint256[] memory arr = new uint256[](1);
        uint256 x = sumArray.sumArray(arr);
        assertEq(x, 0, "expected empty array to return 0");
    }

    function testSumArraySingleElement() external {
        // Allocate arr with a length of 1
        uint256[] memory arr = new uint256[](1);
        arr[0] = 42;
        uint256 x = sumArray.sumArray(arr);
        assertEq(x, 42, "expected sum of single-element array to be 42");
    }

    function testSumArrayAllZeroes() external {
        // Allocate arr with a length of 5
        uint256[] memory arr = new uint256[](5);
        for (uint256 i = 0; i < arr.length; i++) {
            arr[i] = 0;
        }
        uint256 x = sumArray.sumArray(arr);
        assertEq(x, 0, "expected sum of all-zero array to be 0");
    }

    function testSumArrayLargeNumbers() external {
        // Allocate arr with a length of 3
        uint256[] memory arr = new uint256[](3);
        arr[0] = 2 ** 128; // Large number
        arr[1] = 2 ** 42; // Large number
        arr[2] = 2 ** 200; // Large number
        uint256 x = sumArray.sumArray(arr);
        assertEq(
            x,
            (2 ** 128) + (2 ** 42) + (2 ** 200),
            "expected sum of large numbers to match 1606938044258990275542302374708083540985666368394622650023936"
        );
    }

    function testSumArrayRandomNumbers() external {
        // Allocate arr with a length of 5
        uint256[] memory arr = new uint256[](5);
        arr[0] =
            uint256(
                keccak256(abi.encodePacked(block.timestamp, block.prevrandao))
            ) %
            10000;
        arr[1] =
            uint256(
                keccak256(abi.encodePacked(block.timestamp, block.number))
            ) %
            10000;
        arr[2] =
            uint256(
                keccak256(abi.encodePacked(block.timestamp, block.coinbase))
            ) %
            10000;
        arr[3] =
            uint256(
                keccak256(abi.encodePacked(block.timestamp, block.gaslimit))
            ) %
            10000;
        arr[4] =
            uint256(
                keccak256(abi.encodePacked(block.timestamp, block.chainid))
            ) %
            10000;

        uint256 expectedSum = arr[0] + arr[1] + arr[2] + arr[3] + arr[4];
        uint256 x = sumArray.sumArray(arr);
        assertEq(
            x,
            expectedSum,
            "expected sum to match calculated sum of random elements"
        );
    }
}
