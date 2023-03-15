// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Withdraw.sol";

contract WithdrawTest is Test {
    Withdraw public withdraw;

    function setUp() public {
        withdraw = new Withdraw();
    }

    function testWithdraw() external {
        vm.deal(address(this), 1 ether);
        (bool success, ) = address(withdraw).call{value: 1 ether}("");
        require(success, "send ether failed");
        withdraw.withdraw();
        assertEq(
            address(this).balance,
            1 ether,
            "expected address(this).balance to be 1 ether"
        );
    }

    receive() external payable {}
}
