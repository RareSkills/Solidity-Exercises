// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/OneWeekLockup.sol";

contract OneWeekLockupTest is Test {
    OneWeekLockup public oneWeekLockup;

    function setUp() public {
        oneWeekLockup = new OneWeekLockup();
    }

    function testDepositEther() external {
        vm.deal(address(this), 1 ether);
        oneWeekLockup.depositEther{value: 1 ether}();
        assertEq(
            address(oneWeekLockup).balance,
            1 ether,
            "expected balance of oneWeekLockup contract to be 1 ether"
        );
        assertEq(oneWeekLockup.balanceOf(address(this)), 1 ether);
    }

    function testWithdrawEther() external {
        vm.deal(address(this), 1 ether);
        oneWeekLockup.depositEther{value: 1 ether}();

        hoax(address(0xDEAD));
        oneWeekLockup.depositEther{value: 1 ether}();

        vm.expectRevert();
        oneWeekLockup.withdrawEther(1 ether);

        vm.warp(7 days + 1);

        vm.expectRevert();
        oneWeekLockup.withdrawEther(2 ether);

        oneWeekLockup.withdrawEther(1 ether);
        assertEq(
            address(this).balance,
            1 ether,
            "expected balance of address(this) to be 1 ether"
        );
    }

    receive() external payable {}
}
