// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/TripleNestedMapping.sol";

contract TripleNestedMappingTest is Test {
    TripleNestedMapping public tripleNestedMapping;

    address caller = address(0xBed);

    function setUp() public {
        tripleNestedMapping = new TripleNestedMapping();
    }

    function testTripleNestedMapping() public {
        tripleNestedMapping.setLogin("John", 123456, 123);
        bool isLoggedIn = tripleNestedMapping.isLoggedIn("John", 123456, 123);
        assertEq(isLoggedIn, true, "expected isLoggedIn to be true");

        tripleNestedMapping.setLogin("Joe", 224422, 102);
        isLoggedIn = tripleNestedMapping.isLoggedIn("Joe", 224422, 102);
        assertEq(isLoggedIn, true, "expected isLoggedIn to be true");

        tripleNestedMapping.setLogin("Walter", 98765, 666);
        isLoggedIn = tripleNestedMapping.isLoggedIn("Walter", 98765, 666);
        assertEq(isLoggedIn, true, "expected isLoggedIn to be true");
    }
}
