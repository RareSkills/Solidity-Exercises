// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/OriginVsSender.sol";

contract originVsSenderTest is Test {
    OriginVsSender public originVsSender;

    function setUp() public {
        originVsSender = new OriginVsSender();
    }

    function testSetNumber() external {
        vm.prank(address(this), address(this));
        originVsSender.setNumber(42);
        assertEq(originVsSender.number(), 42, "expected number to be 42");
    }

    function testSetNumber_OriginNotSender() external {
        vm.startPrank(address(this), address(0xCAFE));
        vm.expectRevert();
        originVsSender.setNumber(42);
    }
}
