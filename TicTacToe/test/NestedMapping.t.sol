// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/NestedMapping.sol";

contract NestedMappingTest is Test {
    NestedMapping public nestedMapping;

    function setUp() public {
        nestedMapping = new NestedMapping();
    }

    function testNestedDetails() public {
        nestedMapping.setNestedDetails(address(this), 10);
        bool val = nestedMapping.returnNestedDetails(address(this), 10);
        assertEq(
            val,
            true,
            "expected address(this) and 10 pair to return true"
        );

        nestedMapping.setNestedDetails(address(0xCAFE), 12);
        val = nestedMapping.returnNestedDetails(address(0xCAFE), 12);
        assertEq(
            val,
            true,
            "expected address(0xCAFE) and 12 pair to return true"
        );

        nestedMapping.setNestedDetails(address(0xBEAD), 42);
        val = nestedMapping.returnNestedDetails(address(0xBEAD), 42);
        assertEq(
            val,
            true,
            "expected address(0xBEAD) and 42 pair to return true"
        );
    }
}
