// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BlockNumber.sol";

contract BlockNumberTest is Test {
    BlockNumber public blockNumber;

    function setUp() public {
        blockNumber = new BlockNumber();
    }

    function testCallMe() external {
        blockNumber.callMe();
        address lastCaller = blockNumber.lastCaller();
        assertEq(
            lastCaller,
            address(this),
            "expected last caller to be address(this)"
        );

        vm.expectRevert();
        blockNumber.callMe();

        vm.roll(block.number + 1);

        vm.prank(address(0xDEAD));
        blockNumber.callMe();

        lastCaller = blockNumber.lastCaller();
        assertEq(
            lastCaller,
            address(0xDEAD),
            "expected last caller to be address(0xDEAD)"
        );
    }
}
