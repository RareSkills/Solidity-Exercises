// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/NestedMapping.sol";

contract NestedMappingTest is Test {
    NestedMapping public nestedMapping;

    function setUp() public {
        nestedMapping = new NestedMapping();
        nestedMapping.setNestedDetails(msg.sender, 10);
    }

    function testNestedDetails() public returns (bool) {
        bool val = nestedMapping.returnNestedDetails(msg.sender, 10);
        assertEq(val, true, "expected val to be true");
    }
}
