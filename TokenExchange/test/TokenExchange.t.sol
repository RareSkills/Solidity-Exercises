// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TokenExchange.sol";

contract TokenExchangeTest is Test {
    SkillsCoin public skillsCoin;
    RareCoin public rareCoin;

    address poorUser = address(0xBab);
    address avgUser = address(0xBeb);
    address richUser = address(0xBed);

    function setUp() public {
        skillsCoin = new SkillsCoin("SkillsCoin", "SKS");
        rareCoin = new RareCoin("RareCoin", "RARE", address(skillsCoin));
    }

    function testMintSkillsCoin() external {
        vm.prank(poorUser);
        skillsCoin.mint(address(0), 100);
        assertEq(
            skillsCoin.balanceOf(poorUser),
            100,
            "err: poorUser must have 100 SKS"
        );

        vm.prank(avgUser);
        skillsCoin.mint(address(0), 5000);
        assertEq(
            skillsCoin.balanceOf(avgUser),
            5000,
            "err: avgUser must have 5000 SKS"
        );

        vm.prank(richUser);
        skillsCoin.mint(address(0), 1 ether);
        assertEq(
            skillsCoin.balanceOf(richUser),
            1 ether,
            "err: richUser must have 1ether SKS"
        );
    }

    function testTradeRareCoin() external {
        vm.expectRevert();
        rareCoin.trade(5000);

        skillsCoin.mint(address(0), 5000);
        vm.expectRevert();
        rareCoin.trade(5000);

        skillsCoin.approve(address(rareCoin), 5000);
        rareCoin.trade(5000);

        assertEq(
            rareCoin.balanceOf(address(this)),
            5000,
            "err: avgUser must have 5000 RARE"
        );

        assertEq(
            skillsCoin.balanceOf(avgUser),
            0,
            "err: avgUser must have 0 SKS after trade"
        );
    }
}
