// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Owner.sol";

contract OwnerTest is Test {
    OnlyOwner public owner;

    address deployer = address(0xBed);
    address user1 = address(0xBad);

    function setUp() public {
        owner = new OnlyOwner(deployer, 3);
    }

    function testUpdateMagicNumber() external {
        vm.prank(user1);
        vm.expectRevert();
        owner.updateMagicNumber(5);
        uint256 magicNumber = owner.magicNumber();
        assertEq(
            magicNumber,
            3,
            "Anybody can call function `updateMagicNumber`"
        );

        vm.prank(deployer);
        owner.updateMagicNumber(10);
        magicNumber = owner.magicNumber();
        assertEq(
            magicNumber,
            10,
            "Anybody can call function `updateMagicNumber`"
        );
    }
}
