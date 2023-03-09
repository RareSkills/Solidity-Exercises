
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../src/Encoder.sol";

contract EncoderTest is Test {
    Encoder public encoder;
    bytes data =
        hex"000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000007e7000000000000000000000000000000000000000000000000000000000000000e68656c6c6f20736f6c6964697479000000000000000000000000000000000000";

    function setUp() public {
        encoder = new Encoder();
    }

    function testEncodedData() public {
        bytes memory __data = encoder.createEncodedData("hello solidity", 2023);
        assertEq(data, __data, "Encoded data does not match, try again!");
    }
}
