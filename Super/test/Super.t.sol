// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Super.sol";

contract SuperTest is Test {
    Super public superr;

    function setUp() public {
        superr = new Super();
    }

    function testGetGreetings() external {
        string memory greetings = superr.getGreetings();

        assertEq(
            greetings,
            "Hello World",
            "expected greetings to be Hello World"
        );
    }
}
