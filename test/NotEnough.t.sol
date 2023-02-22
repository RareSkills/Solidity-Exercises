// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../src/NotEnough.sol";

contract NotEnoughTest is Test {
    NotEnough public notEnough;

    function setUp() public {
        notEnough = new NotEnough();
    }

    function testPrintNumWithFive() public {
        vm.expectRevert();
        notEnough.printNumber(5);
    }
}
