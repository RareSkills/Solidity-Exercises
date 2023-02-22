// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/StudentDB.sol";

contract StudentDBTest is Test {
    StudentDB public studentDB;

    function setUp() public {
        studentDB = new StudentDB();
    }

    function testGetJohnsAge() public {
        uint32 johnsAge = studentDB.getJohnsAge();
        assertEq(johnsAge, 12);
    }
}
