// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PublicVariable.sol";

contract PublicVariableTest is Test {
    PublicVariable public publicVariable;

    function setUp() public {
        publicVariable = new PublicVariable();
    }

    function testMagicNumber() external {
        assertEq(
            publicVariable.number(),
            42,
            "expected publicVariable.magicNumber() to return 42"
        );
    }
}
