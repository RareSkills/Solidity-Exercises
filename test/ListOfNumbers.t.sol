// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/ListOfNumbers.sol";

contract ListOfNumbersTest is Test {
    ListOfNumbers public listOfNumbers;

    function setUp() public {
        listOfNumbers = new ListOfNumbers();
    }

    function testListOfNumbers() external {
        listOfNumbers.appendToArray(11);
        listOfNumbers.appendToArray(22);
        listOfNumbers.appendToArray(33);

        uint256[] memory arr = listOfNumbers.getArray();

        assertEq(arr[0], 11);
        assertEq(arr[1], 22);
        assertEq(arr[2], 33);
    }
}
