// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/NestedArray.sol";

contract NestedArrayTest is Test {
    NestedArray public nestedArray;
    uint256[][] newArr;

    function setUp() public {
        nestedArray = new NestedArray();
    }

    function testGetNestedSum() public {
        uint256[] memory _newArr = new uint256[](3);

        _newArr[0] = 1;
        _newArr[1] = 2;
        _newArr[2] = 3;
        newArr.push(_newArr);

        _newArr[0] = 4;
        _newArr[1] = 5;
        _newArr[2] = 6;
        newArr.push(_newArr);

        _newArr[0] = 7;
        _newArr[1] = 8;
        _newArr[2] = 9;
        newArr.push(_newArr);

        _newArr[0] = 10;
        _newArr[1] = 11;
        _newArr[2] = 12;
        newArr.push(_newArr);

        _newArr[0] = 13;
        _newArr[1] = 14;
        _newArr[2] = 15;
        newArr.push(_newArr);

        nestedArray.setArr(newArr);

        assertEq(nestedArray.getNestedSum(), 120, "expected sum to be 120");

        newArr[0] = new uint256[](3);
        newArr[1] = new uint256[](3);
        newArr[2] = new uint256[](3);
        newArr[3] = new uint256[](3);
        newArr[4] = new uint256[](3);

        _newArr[0] = 10;
        _newArr[1] = 20;
        _newArr[2] = 30;
        newArr.push(_newArr);

        _newArr[0] = 40;
        _newArr[1] = 50;
        _newArr[2] = 60;
        newArr.push(_newArr);

        _newArr[0] = 70;
        _newArr[1] = 80;
        _newArr[2] = 90;
        newArr.push(_newArr);

        _newArr[0] = 100;
        _newArr[1] = 110;
        _newArr[2] = 120;
        newArr.push(_newArr);

        _newArr[0] = 130;
        _newArr[1] = 140;
        _newArr[2] = 150;
        newArr.push(_newArr);

        nestedArray.setArr(newArr);

        assertEq(nestedArray.getNestedSum(), 1200, "expected sum to be 1200");
    }

    // Test case for empty array
    function testEmptyArray() external {
        uint256[] memory _newArr = new uint256[](0);
        newArr.push(_newArr);
        nestedArray.setArr(newArr);
        assertEq(
            nestedArray.getNestedSum(),
            0,
            "Expected sum to be 0 for an empty array"
        );
    }

    // Test case for empty inner arrays
    function testEmptyInnerArray() external {
        uint256[] memory _newArr = new uint256[](0);
        newArr.push(_newArr);
        newArr.push(_newArr);
        newArr.push(_newArr);

        nestedArray.setArr(newArr);
        assertEq(
            nestedArray.getNestedSum(),
            0,
            "Expected sum to be 0 when all inner arrays are empty"
        );
    }

    // Test case for one-dimensional array
    function test1DArray() external {
        uint256[] memory _newArr = new uint256[](3);
        _newArr[0] = 1;
        _newArr[1] = 2;
        _newArr[2] = 3;
        newArr.push(_newArr);

        nestedArray.setArr(newArr);
        assertEq(
            nestedArray.getNestedSum(),
            6,
            "Expected sum to be 6 for a one-dimensional array"
        );
    }

    // Test case for single value in the nested array
    function testSingleValue() external {
        uint256[] memory _newArr = new uint256[](1);
        _newArr[0] = 1;
        newArr.push(_newArr);

        nestedArray.setArr(newArr);
        assertEq(
            nestedArray.getNestedSum(),
            1,
            "Expected sum to be 1 for a single value in the nested array"
        );
    }

    // Test case for large numbers
    function testLargeNumbers() external {
        uint256[] memory _newArr = new uint256[](3);
        _newArr[0] = 1 << 250;
        _newArr[1] = 1 << 255;
        _newArr[2] = 1;

        newArr.push(_newArr);

        nestedArray.setArr(newArr);
        assertEq(
            nestedArray.getNestedSum(),
            2 ** 250 + 2 ** 255 + 1,
            "Expected sum to be 59705296012991163265278789145104702486842335843220915832845316754080207470593 for large numbers"
        );
    }
}
