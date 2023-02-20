// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/4_BasicStorage.sol";

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
        assertEq(x, 42);
    }

    function testGetX() external {
        basicStorage.setX(42);
        uint256 x = basicStorage.getX();
        assertEq(x, 42);
    }
}
