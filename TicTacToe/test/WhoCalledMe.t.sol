// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/WhoCalledMe.sol";

contract SumArrayTest is Test {
    WhoCalledMe public whoCalledMe;

    function setUp() public {
        whoCalledMe = new WhoCalledMe();
    }

    function testCallMe() external {
        whoCalledMe.callMe();
        address lastCaller = whoCalledMe.caller();
        assertEq(
            lastCaller,
            address(this),
            "expected last caller to be address(this)"
        );
    }
}
