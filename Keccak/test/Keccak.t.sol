// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Keccak.sol";

contract KeccakTest is Test {
    Keccak public keccak;

    function setUp() public {
        keccak = new Keccak();
    }

    function testKeccak() public {
        bool hash1Correct;
        bool hash2Correct;
        bool hash3Correct;

        uint256 value1 = 55;
        uint256 value2 = 42;
        uint256 value3 = 6728927;

        address addr = address(keccak);

        bool success1;
        bool success2;
        bool success3;

        assembly {
            mstore(0x80, value1)
            let hash1 := keccak256(0x80, 0x20)

            mstore(0x80, value2)
            let hash2 := keccak256(0x80, 0x20)

            mstore(0x80, value3)
            let hash3 := keccak256(0x80, 0x20)

            mstore(0x00, hex"ba79920e")

            mstore(0x04, value1)
            success1 := call(gas(), addr, 0x00, 0x00, 0x24, 0x80, 0x20)
            hash1Correct := eq(hash1, mload(0x80))

            mstore(0x04, value2)
            success2 := call(gas(), addr, 0x00, 0x00, 0x24, 0x80, 0x20)
            hash1Correct := eq(hash2, mload(0x80))

            mstore(0x04, value3)
            success3 := call(gas(), addr, 0x00, 0x00, 0x24, 0x80, 0x20)
            hash1Correct := eq(hash3, mload(0x80))
        }

        assertEq(success1, true, "keccak.keccak(55) call reverted");
        assertEq(success2, true, "keccak.keccak(42) call reverted");
        assertEq(success3, true, "keccak.keccak(6728927) call reverted");

        assertEq(hash1Correct, true, "keccak256 of 55 is incorrect");
        assertEq(hash2Correct, true, "keccak256 of 42 is incorrect");
        assertEq(hash3Correct, true, "keccak256 of 6728927 is incorrect");
    }
}
