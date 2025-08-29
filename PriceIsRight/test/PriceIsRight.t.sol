// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PriceIsRight.sol";

contract PriceIsRightTest is Test {
    PriceIsRight public priceIsRight;

    function setUp() public {
        priceIsRight = new PriceIsRight();
    }

   function testBuy(uint256 amount) public {
    // give the test contract plenty of ETH to cover any fuzz input
        // vm.assume(amount <= 10 ether);
        vm.assume(amount <= 10 ether);
        vm.deal(address(this), amount +1e18);

        // success case
        priceIsRight.buy{value: 1 ether}();

        // failure case
        if (amount != 1 ether) {
            vm.expectRevert();
            priceIsRight.buy{value: amount}();
        }
}

}
