// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/IdiotBetting.sol";

contract IdiotBettingTest is Test {
    IdiotBettingGame public idiotBetting;

    address player1 = address(0xBab);
    address player2 = address(0xBeb);
    address player3 = address(0xBed);
    address player4 = address(0xBad);

    function setUp() public {
        idiotBetting = new IdiotBettingGame();
    }

    function testBetAndClaim() external {
        // player1 bet 2 eth
        vm.warp(0);
        vm.prank(player1);
        vm.deal(player1, 2 ether);
        idiotBetting.bet{value: 2 ether}();

        // player2 tries to claim, should revert
        vm.prank(player2);
        vm.expectRevert();
        idiotBetting.claimPrize();
        assertEq(
            player2.balance,
            0,
            "err: Player2 can claim without being the winner."
        );

        // player2 bet 4 eth at 30 minutes
        vm.warp(1800);
        vm.prank(player2);
        vm.deal(player2, 4 ether);
        idiotBetting.bet{value: 4 ether}();

        // player1 tries to claim, should revert because player2 deposited higher ether
        vm.prank(player1);
        vm.expectRevert();
        idiotBetting.claimPrize();
        assertEq(
            player1.balance,
            0,
            "err: Player1 can claim without being the winner."
        );

        // player2 tries to claim after 1 hour passed, should not revert
        vm.warp(7200);
        vm.prank(player2);
        idiotBetting.claimPrize();
        assertEq(player2.balance, 6 ether, "err: Winner can not claim.");
    }

    function testBetAndClaim1() external {
        /////// BET ///////
        // player1 bet 2 eth at 1 second
        vm.warp(1);
        vm.prank(player1);
        vm.deal(player1, 2 ether);
        idiotBetting.bet{value: 2 ether}();

        // player2 bet 1 eth at 30 minutes
        vm.warp(1800);
        vm.prank(player2);
        vm.deal(player2, 1 ether);
        idiotBetting.bet{value: 1 ether}();

        // player3 bet 8 eth at 1 hour
        vm.warp(3600);
        vm.prank(player3);
        vm.deal(player3, 8 ether);
        idiotBetting.bet{value: 8 ether}();

        // player4 bet 5 eth at 1:40 hour
        vm.warp(6000);
        vm.prank(player4);
        vm.deal(player4, 5 ether);
        idiotBetting.bet{value: 5 ether}();

        /////// CLAIM ///////
        vm.warp(7500);
        // player1 tries to claim, should revert because not winner
        vm.prank(player1);
        vm.expectRevert();
        idiotBetting.claimPrize();
        assertEq(player1.balance, 0, "err: Player1 balance should be 0.");

        // player2 tries to claim, should revert because not winner
        vm.prank(player2);
        vm.expectRevert();
        idiotBetting.claimPrize();
        assertEq(player2.balance, 0, "err: Player2 balance should be 0.");

        // player2 tries to claim, should not revert
        vm.prank(player3);
        idiotBetting.claimPrize();
        assertEq(
            player3.balance,
            16 ether,
            "err: expect winner balance to be 16 ether."
        );

        // player4 tries to claim, should revert because not winner
        vm.prank(player4);
        vm.expectRevert();
        idiotBetting.claimPrize();
        assertEq(player4.balance, 0, "err: Player2 balance should be 0.");
    }
}
