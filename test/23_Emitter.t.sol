// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../src/23_Emitter.sol";

contract EmitterTest is Test {
    Emitter public emitter;
    event Trigger(address, uint256);

    function setUp() public {
        emitter = new Emitter();
    }

    function testEmitterEvent() public {
        vm.expectEmit(true, true, false, false);
        emit Trigger(msg.sender, 20);
        emitter.emitEvent(msg.sender, 20);
    }
}
