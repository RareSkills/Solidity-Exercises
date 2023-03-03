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

    function testTripleNestedMapping() public returns (bool) {
        vm.startPrank(caller);
        tripleNestedMapping.setLogin("John", 123456);
        bool isLoggedIn = tripleNestedMapping.checkLogin("John", 123456);
        vm.stopPrank();

        assertEq(isLoggedIn, true, "expected isLoggedIn to be true");
    }
}
