// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TimelockEscrow.sol";

contract TimelockEscrowTest is Test {
    TimelockEscrow public timelockEscrow;
    address constant SELLER = address(0x5E11E7);

    function setUp() public {
        vm.prank(SELLER);
        timelockEscrow = new TimelockEscrow();
    }

    function testTimelock() public {
        vm.deal(address(this), 1 ether);
        vm.deal(SELLER, 1 ether);
        timelockEscrow.createBuyOrder{value: 1 ether}();
        assertEq(
            timelockEscrow.buyerDeposit(address(this)),
            1 ether,
            "buyer deposit should return 1 ether"
        );

        // seller attempt to withdraw before 3 days
        vm.startPrank(SELLER);
        vm.expectRevert();
        timelockEscrow.sellerWithdraw(address(this));
        vm.stopPrank();

        vm.warp(block.timestamp + 3 days + 1);

        uint256 timelockEscrowBalanceBefore = address(timelockEscrow).balance;
        uint256 sellerBefore = address(timelockEscrow).balance;

        vm.prank(SELLER);
        timelockEscrow.sellerWithdraw(address(this));

        uint256 timelockEscrowBalanceAfter = address(timelockEscrow).balance;
        uint256 sellerAfter = address(SELLER).balance;

        assertEq(
            timelockEscrowBalanceBefore - timelockEscrowBalanceAfter,
            1 ether,
            "expected 1 ether as balance change of the escrow contract after seller withdraws"
        );
        assertEq(
            sellerAfter - sellerBefore,
            1 ether,
            "expected 1 ether as balance change of the seller after seller withdraws"
        );
    }

    function testTimelockBuyerWithdraws() public {
        vm.deal(address(this), 1 ether);
        timelockEscrow.createBuyOrder{value: 1 ether}();
        assertEq(
            timelockEscrow.buyerDeposit(address(this)),
            1 ether,
            "buyer deposit should return 1 ether"
        );

        uint256 timeStamp = block.timestamp;

        vm.warp(timeStamp + 3 days + 1);

        vm.expectRevert();
        timelockEscrow.buyerWithdraw();

        vm.warp(timeStamp);

        uint256 timelockEscrowBalanceBefore = address(timelockEscrow).balance;
        uint256 buyerBefore = address(this).balance;

        timelockEscrow.buyerWithdraw();

        uint256 timelockEscrowBalanceAfter = address(timelockEscrow).balance;
        uint256 buyerAfter = address(this).balance;

        assertEq(
            timelockEscrowBalanceBefore - timelockEscrowBalanceAfter,
            1 ether,
            "expected 1 ether as balance change of the escrow contract after seller withdraws"
        );
        assertEq(
            buyerAfter - buyerBefore,
            1 ether,
            "expected 1 ether as balance change of the seller after seller withdraws"
        );
    }

    receive() external payable {}
}
