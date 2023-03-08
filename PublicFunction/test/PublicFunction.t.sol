// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PublicFunction.sol";

contract PublicFunctionTest is Test {
    PublicFunction public publicFunction;

    function setUp() public {
        publicFunction = new PublicFunction();
    }

    function testMagicNumber() external {
        assertEq(
            publicFunction.magicNumber(),
            42,
            "expected publicFunction.magicNumber() to return 42"
        );
    }
}
