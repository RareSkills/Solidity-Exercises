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

    // Test case when the array is already all even numbers
    function testAllEven() external {
        uint256[] memory evenArray = new uint256[](5);
        evenArray[0] = 2;
        evenArray[1] = 4;
        evenArray[2] = 6;
        evenArray[3] = 8;
        evenArray[4] = 10;

        uint256[] memory filteredArray = filterContract.filterOdd(evenArray);

        assertEq(filteredArray.length, 5, "expected length 5");
        assertEq(filteredArray[0], 2, "expected 2");
        assertEq(filteredArray[1], 4, "expected 4");
        assertEq(filteredArray[2], 6, "expected 6");
        assertEq(filteredArray[3], 8, "expected 8");
        assertEq(filteredArray[4], 10, "expected 10");
    }

    // Test case when the array has all odd numbers
    function testAllOdd() external {
        uint256[] memory oddArray = new uint256[](5);
        oddArray[0] = 1;
        oddArray[1] = 3;
        oddArray[2] = 5;
        oddArray[3] = 7;
        oddArray[4] = 9;

        uint256[] memory filteredArray = filterContract.filterOdd(oddArray);

        assertEq(filteredArray.length, 0, "expected length 0");
    }

    // Test case with an empty array
    function testEmptyArray() external {
        uint256[] memory emptyArray = new uint256[](0);
        uint256[] memory filteredArray = filterContract.filterOdd(emptyArray);

        assertEq(filteredArray.length, 0, "expected length 0");
    }

    // Test case with a single even number
    function testSingleEvenNumber() external {
        uint256[] memory singleEven = new uint256[](1);
        singleEven[0] = 2;

        uint256[] memory filteredArray = filterContract.filterOdd(singleEven);

        assertEq(filteredArray.length, 1, "expected length 1");
        assertEq(filteredArray[0], 2, "expected 2");
    }

    // Test case with a single odd number
    function testSingleOddNumber() external {
        uint256[] memory singleOdd = new uint256[](1);
        singleOdd[0] = 1;

        uint256[] memory filteredArray = filterContract.filterOdd(singleOdd);

        assertEq(filteredArray.length, 0, "expected length 0");
    }

    // Test case with a large array
    function testLargeArray() external {
        uint256[] memory largeArray = new uint256[](50);
        uint256 evenCount = 0;

        // Fill the array with numbers and count even numbers
        for (uint256 i = 0; i < largeArray.length; i++) {
            largeArray[i] = i;
            if (i % 2 == 0) {
                evenCount++;
            }
        }

        uint256[] memory filteredArray = filterContract.filterOdd(largeArray);

        assertEq(filteredArray.length, evenCount, "expected even count"); // Length should match even number count
    }
}
