// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/CodeSize.sol";

contract CodeSizeTest is Test {
    CodeSize public codeSize;

    function setUp() public {
        codeSize = new CodeSize();
    }

    function testCodeSize() public {
        assertEq(
            address(codeSize).code.length > 1024,
            true,
            "Contract must be greater than 1kb"
        );
        assertEq(
            address(codeSize).code.length < 4096,
            true,
            "Contract must be less than 4kb"
        );
    }
}
