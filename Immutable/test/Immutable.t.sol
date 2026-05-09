// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Immutable.sol";

contract ContractImmutableTest is Test {
    ContractImmutable public contractImmutable;

    function setUp() public {}

    function testContractImmutable() external {
        contractImmutable = new ContractImmutable(10);
        bytes32 slot0 = vm.load(address(contractImmutable), bytes32(uint256(0)));
        // since `value` is immutable, it won't be in storage
        assertEq(slot0, bytes32(0));
        assertEq(contractImmutable.value(), 10);
    }

    function testContractImmutable2() external {
        contractImmutable = new ContractImmutable(550);
        bytes32 slot0 = vm.load(address(contractImmutable), bytes32(uint256(0)));
        // since `value` is immutable, it won't be in storage
        assertEq(slot0, bytes32(0));
        assertEq(contractImmutable.value(), 550);
    }

        
    }

