// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/StudentDB.sol";

contract StudentDBTest is Test {
    StudentDB public studentDB;

    struct Student {
        string name;
        uint256 age;
    }

    function setUp() public {
        studentDB = new StudentDB();
    }

    function testGetEntireStruct() public {
        StudentDB.Student memory data = studentDB.getEntireStruct();
        assertEq(data.name, "John", "expected name to be John");
        assertEq(data.age, 12, "expected age to be 12");
    }
}
