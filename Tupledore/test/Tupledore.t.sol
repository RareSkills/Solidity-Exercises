// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Tupledore.sol";

contract TupledoreTest is Test {
    Tupledore public tupledore;

    function setUp() public {
        tupledore = new Tupledore();
    }

    function testSetAndReturnTuple() public {
        // Initial state check: ensure userInfo is uninitialized.
        (address addr, uint256 num) = tupledore.returnTuple();
        assertEq(addr, address(0), "Initial address should be address(0)");
        assertEq(num, 0, "Initial ID should be 0");

        tupledore.setTuple(address(0xDEAD), 42);
        (addr, num) = tupledore.returnTuple();
        assertEq(addr, address(0xDEAD), "Address should be 0xDEAD");
        assertEq(num, 42, "ID should be 42");

        tupledore.setTuple(address(0xCAFE), 24);
        (addr, num) = tupledore.returnTuple();
        assertEq(addr, address(0xCAFE), "Address should be 0xCAFE");
        assertEq(num, 24, "ID should be 24");
    }

    function testSetTupleWithZeroAddress() public {
        // Test edge case with address(0)
        tupledore.setTuple(address(0), 123);
        (address addr, uint256 num) = tupledore.returnTuple();
        assertEq(addr, address(0), "Address should be address(0)");
        assertEq(num, 123, "ID should be 123");
    }

    function testSetTupleWithLargeUint() public {
        // Test edge case with maximum uint256 value
        tupledore.setTuple(address(0xDEAD), type(uint256).max);
        (address addr, uint256 num) = tupledore.returnTuple();
        assertEq(addr, address(0xDEAD), "Address should be 0xDEAD");
        assertEq(num, type(uint256).max, "ID should be max uint256 value");
    }

    function testSetTupleWithDifferentValues() public {
        // Test multiple calls with different values in a row
        tupledore.setTuple(address(0xAAAA), 1);
        tupledore.setTuple(address(0xBBBB), 2);
        tupledore.setTuple(address(0xCCCC), 3);

        (address addr, uint256 num) = tupledore.returnTuple();
        assertEq(addr, address(0xCCCC), "Address should be 0xCCCC");
        assertEq(num, 3, "ID should be 3");
    }
}
