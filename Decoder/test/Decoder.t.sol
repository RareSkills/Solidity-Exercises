
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../src/Decoder.sol";

contract DecoderTest is Test {
    Decoder public decoder;
    bytes data =
        hex"000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000007e7000000000000000000000000000000000000000000000000000000000000000e68656c6c6f20736f6c6964697479000000000000000000000000000000000000";

    function setUp() public {
        decoder = new Decoder();
    }

    function testDecodedData() public returns (string memory word, uint num) {
        (word, num) = decoder.decodeData(data);
        assertEq(word, "hello solidity", "Decoding failed");
        assertEq(num, 2023, "Decoding failed");
    }
}

