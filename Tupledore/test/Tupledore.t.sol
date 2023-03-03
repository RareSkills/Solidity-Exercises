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

    function testTupledore() public {
        tupledore.setTuple(address(0xDEAD), 42);
        bool success;
        address tupledoreAddress = address(tupledore);
        address addr;
        uint256 num;
        assembly {
            let fmp := mload(0x40)
            mstore(fmp, hex"39009482")
            success := call(
                gas(),
                tupledoreAddress,
                0x00,
                fmp,
                0x04,
                add(0x20, fmp),
                0x40
            )
            addr := mload(add(0x20, fmp))
            num := mload(add(0x40, fmp))
        }

        assertEq(addr, address(0xDEAD));
        assertEq(num, 42);

        tupledore.setTuple(address(0xCAFE), 24);
        assembly {
            let fmp := mload(0x40)
            mstore(fmp, hex"39009482")
            success := call(
                gas(),
                tupledoreAddress,
                0x00,
                fmp,
                0x04,
                add(0x20, fmp),
                0x40
            )
            addr := mload(add(0x20, fmp))
            num := mload(add(0x40, fmp))
        }

        assertEq(addr, address(0xCAFE));
        assertEq(num, 24);
    }
}
