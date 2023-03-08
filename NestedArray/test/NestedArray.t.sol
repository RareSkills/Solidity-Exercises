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
}
