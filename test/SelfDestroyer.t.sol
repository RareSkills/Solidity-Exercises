// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/SelfDestroyer.sol";

contract SelfDestroyerTest is Test {
    SelfDestroyer public selfDestroyer;

    function setUp() public {
        selfDestroyer = new SelfDestroyer{value: 10 ether}();
    }

    function testSelfDestroyer() public {
        emit log_named_uint(
            "Self Destroyer balance before",
            address(selfDestroyer).balance
        );

        selfDestroyer.destroy(address(this));

        uint256 bal = selfDestroyer.getBalance();
        emit log_named_uint("Self Destroyer balance after", bal);
        assertEq(bal, 0);
    }
}
