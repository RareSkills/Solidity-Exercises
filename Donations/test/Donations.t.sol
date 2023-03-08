// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Donations.sol";

contract DonationsTest is Test {
    Donations public donations;

    function setUp() public {
        donations = new Donations();
    }

    function testDonate() external {
        vm.deal(address(this), 1 ether);
        (bool success, ) = address(donations).call{value: 1 ether}("");
        require(success, "Send ether failed");
        assertEq(
            donations.amountDonated(address(this)),
            1 ether,
            "expected amountDonated by address(this) to be 1 ether"
        );

        vm.deal(address(0xBEEF), 1 ether);
        vm.prank(address(0xBEEF));
        (success, ) = address(donations).call{value: 1 ether}("");
        require(success, "Send ether failed");
        assertEq(
            donations.amountDonated(address(0xBEEF)),
            1 ether,
            "expected amountDonated by address(BEEF) to be 1 ether"
        );

        vm.deal(address(0xCAFE), 1 ether);
        vm.prank(address(0xCAFE));
        (success, ) = address(donations).call{value: 1 ether}("");
        require(success, "Send ether failed");
        assertEq(
            donations.amountDonated(address(0xCAFE)),
            1 ether,
            "expected amountDonated by address(0xCAFE) to be 1 ether"
        );
    }
}
