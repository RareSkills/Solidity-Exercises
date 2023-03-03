// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BasicStorage.sol";

contract BasicStorageTest is Test {
    BasicStorage public basicStorage;

    function setUp() public {
        basicStorage = new BasicStorage();
    }

    function testSetX() external {
        basicStorage.setX(42);
        uint256 x = uint256(
            vm.load(address(basicStorage), bytes32(uint256(0)))
        );
        assertEq(x, 42, "expected x in storage to be 42 after setX(42)");
    }

    function testGetX() external {
        basicStorage.setX(42);
        uint256 x = basicStorage.getX();
        assertEq(x, 42, "getX() to return 42 after setX(42)");
    }
}
