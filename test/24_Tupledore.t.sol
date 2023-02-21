// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/24_Tupledore.sol";

contract TupledoreTest is Test {
    Tupledore public tupledore;

    function setUp() public {
        tupledore = new Tupledore();
    }

    function testEmitterEvent()
        public
        returns (string memory text, address addr, uint256 num)
    {
        (text, addr, num) = tupledore.returnTuple();
        emit log_named_uint(text, num);
        emit log_address(addr);
    }
}
