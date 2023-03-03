// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ReducingPayout.sol";

contract ReducingPayoutTest is Test {
    ReducingPayout public reducingPayout;

    function setUp() public {
        vm.warp(0);
        reducingPayout = new ReducingPayout{value: 1 ether}();
    }

    function testWithdraw() external {
        vm.startPrank(address(0xbed));

        vm.warp(7200);
        // At 2 hours
        uint256 amountExpected = block.timestamp >= 86400
            ? 0
            : 1 ether - ((block.timestamp * 0.0011574 ether) / 100);

        reducingPayout.withdraw();

        if (
            address(0xbed).balance <= amountExpected &&
            address(0xbed).balance > amountExpected - 0.000001 ether
        ) {
            assertFalse(false);
        } else {
            assertFalse(true);
        }

        vm.stopPrank();
    }

    function testWithdraw1() external {
        vm.startPrank(address(0xbed));

        vm.warp(600);
        // At 10 minutes
        uint256 amountExpected = block.timestamp >= 86400
            ? 0
            : 1 ether - ((block.timestamp * 0.0011574 ether) / 100);

        reducingPayout.withdraw();

        if (
            address(0xbed).balance <= amountExpected &&
            address(0xbed).balance > amountExpected - 0.000001 ether
        ) {
            assertFalse(false);
        } else {
            assertFalse(true);
        }

        vm.stopPrank();
    }

    function testWithdraw2() external {
        vm.startPrank(address(0xbed));

        vm.warp(21600);
        // At 6 hours
        uint256 amountExpected = block.timestamp >= 86400
            ? 0
            : 1 ether - ((block.timestamp * 0.0011574 ether) / 100);

        reducingPayout.withdraw();

        if (
            address(0xbed).balance <= amountExpected &&
            address(0xbed).balance > amountExpected - 0.000001 ether
        ) {
            assertFalse(false);
        } else {
            assertFalse(true);
        }

        vm.stopPrank();
    }

    function testWithdraw3() external {
        vm.startPrank(address(0xbed));

        vm.warp(86400);
        // At 24 hours
        uint256 amountExpected = block.timestamp >= 86400
            ? 0
            : 1 ether - ((block.timestamp * 0.0011574 ether) / 100);

        reducingPayout.withdraw();

        if (address(0xbed).balance <= amountExpected) {
            assertFalse(false);
        } else {
            assertFalse(true);
        }

        vm.stopPrank();
    }
}
