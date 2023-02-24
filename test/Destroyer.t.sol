// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Destroyer.sol";

contract DestroyerTest is Test {
    Destroyer public destroyer;

    function setUp() public {
        destroyer = new Destroyer{value: 10 ether}();
    }

    function testDestroyer() public {
        emit log_named_uint(
            "Destroyer balance before",
            address(destroyer).balance
        );

        destroyer.destroy(address(this));

        uint256 bal = destroyer.getBalance();
        emit log_named_uint("Destroyer balance after", bal);
        assertEq(bal, 0);
    }
}
