// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BasicBankV2.sol";

contract BasicBankV2Test is Test {
    BasicBankV2 public basicBankV2;

    function setUp() public {
        basicBankV2 = new BasicBankV2();
    }

    function testAddEther() external {
        vm.deal(address(this), 1 ether);
        basicBankV2.addEther{value: 1 ether}();
        assertEq(
            address(basicBankV2).balance,
            1 ether,
            "expected balance of basic bank contract to be 1 ether"
        );
    }

    function testRemoveEther() external {
        vm.deal(address(this), 1 ether);
        basicBankV2.addEther{value: 1 ether}();

        vm.expectRevert();
        basicBankV2.removeEther(2 ether);

        basicBankV2.removeEther(1 ether);
        assertEq(
            address(this).balance,
            1 ether,
            "expected balance of address(this) to be 1 ether"
        );
    }

    receive() external payable {}
}
