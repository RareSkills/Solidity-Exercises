// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/InsertInArray.sol";

contract InsertInArrayTest is Test {
    InsertInArray public insertInArray;

    function setUp() public {
        insertInArray = new InsertInArray();
    }

    function testReplaceAtIndex() public {
        insertInArray.replaceAtIndex(2, 42);
        assertEq(
            insertInArray.arr(2),
            42,
            "expected array at index 2 to be 42"
        );

        insertInArray.replaceAtIndex(4, 200);
        assertEq(
            insertInArray.arr(4),
            200,
            "expected array at index 4 to be 200"
        );

        insertInArray.replaceAtIndex(9, 100);
        assertEq(
            insertInArray.arr(9),
            100,
            "expected array at index 9 to be 100"
        );
    }
}
