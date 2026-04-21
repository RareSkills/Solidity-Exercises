// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ReducingPayout.sol";

contract ReducingPayoutTest is Test {
    ReducingPayout public reducingPayout;
    uint256 constant INITIAL_BALANCE = 1 ether;
    uint256 constant TOTAL_DURATION = 1 days;
    address constant USER = address(0xbed);

    function setUp() public {
        vm.warp(0);
        reducingPayout = new ReducingPayout{value: INITIAL_BALANCE}();
    }

    function _verifyWithdrawAt(uint256 warpTime, uint256 expectedAmount) internal {
        // Prepare state
        vm.warp(warpTime);
        uint256 initialUserBalance = USER.balance;

        vm.startPrank(USER);
        reducingPayout.withdraw();
        vm.stopPrank();

        // Check whether balance matches within 1 wei tolerance due to integer division
        assertApproxEqAbs(
            USER.balance - initialUserBalance,
            expectedAmount,
            1,
            string.concat("Assertion failed at warpTime: ", vm.toString(warpTime))
        );
    }

    function testWithdraw_At10Minutes() external {
        _verifyWithdrawAt(10 minutes, 993055555555555555);
    }

    function testWithdraw_At2Hours() external {
        _verifyWithdrawAt(2 hours, 916666666666666666);
    }

    function testWithdraw_At6Hours() external {
        _verifyWithdrawAt(6 hours, 0.75 ether);
    }

    function testWithdraw_At24Hours() external {
        _verifyWithdrawAt(24 hours, 0);
    }

    function testWithdraw_At24Hours1Second() external {
        _verifyWithdrawAt(24 hours + 1 seconds, 0);
    }

}

