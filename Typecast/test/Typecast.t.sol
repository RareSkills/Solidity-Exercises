// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Typecast.sol";

contract TypecastTest is Test {
    Typecast public typecast;

    function setUp() public {
        typecast = new Typecast();
    }

    function testTypecast() public {
        vm.expectRevert();
        typecast.typeCast{value: 1 ether}();

        bool success;
        vm.deal(address(this), 0x3fe8e3f000000000000000000000000000000000000000000000000000000000);

        assembly {
            mstore(0x00, hex"12e9b56d")
            let addr := sload(typecast.slot)
            success := call(gas(), addr, addr, 0x00, 0x04, 0x00, 0x00)
        }

        assertEq(success, true, "Expected call with value == address to pass");
    }
}
