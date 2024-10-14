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
        uint256[] memory sortedArray = new uint256[](5);
        sortedArray[0] = 1;
        sortedArray[1] = 2;
        sortedArray[2] = 13;
        sortedArray[3] = 23;
        sortedArray[4] = 123;

        assertEq(
            isSorted.isSorted(sortedArray),
            true,
            "input array is sorted. Expected: true"
        );
    }

    function testIsNotSorted() public {
        uint256[] memory unsorted = new uint256[](5);

        unsorted[0] = 1;
        unsorted[1] = 2;
        unsorted[2] = 28;
        unsorted[3] = 27;
        unsorted[4] = 99;

        assertEq(
            isSorted.isSorted(unsorted),
            false,
            "input array is not sorted. Expected: false"
        );
    }

    function testEmptyArray() public {
        uint256[] memory empty = new uint256[](0);
        assertEq(
            isSorted.isSorted(empty),
            true,
            "input empty array. Expected: true"
        );
    }

    function testAllZeroArray() public {
        uint256[] memory allZeros = new uint256[](5);
        allZeros[0] = 0;
        allZeros[1] = 0;
        allZeros[2] = 0;
        allZeros[3] = 0;
        allZeros[4] = 0;
        assertEq(
            isSorted.isSorted(allZeros),
            true,
            "input all zero array. Expected: true"
        );
    }

    function testSingleElementArray() public {
        uint256[] memory singleElement = new uint256[](1);
        singleElement[0] = 42;
        assertEq(
            isSorted.isSorted(singleElement),
            true,
            "input single element array. Expected: true"
        );
    }

    function testTwoElementArray() public {
        uint256[] memory sortedTwoElement = new uint256[](2);
        uint256[] memory unSortedTwoElement = new uint256[](2);
        uint256[] memory equalTwoElement = new uint256[](2);

        sortedTwoElement[0] = 1;
        sortedTwoElement[1] = 2;

        assertEq(
            isSorted.isSorted(sortedTwoElement),
            true,
            "input sorted two-element array. Expected: true"
        );

        unSortedTwoElement[0] = 2;
        unSortedTwoElement[1] = 1;

        assertEq(
            isSorted.isSorted(unSortedTwoElement),
            false,
            "input unsorted two-element array. Expected: false"
        );

        equalTwoElement[0] = 1;
        equalTwoElement[1] = 1;

        assertEq(
            isSorted.isSorted(equalTwoElement),
            true,
            "input two-element array with equal values. Expected: true"
        );
    }
}
