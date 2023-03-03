// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Unchecked.sol";

contract UncheckedTest is Test {
    Unchecked public uncheckedContract;

    function setUp() public {
        uncheckedContract = new Unchecked();
    }

    function testUnchecked() external {
        uint256 res = uncheckedContract.getNumber(10);
        uint256 res1 = uncheckedContract.getNumber(0);
        uint256 res2 = uncheckedContract.getNumber(50);
        uint256 res3 = uncheckedContract.getNumber(20);
    }
}
