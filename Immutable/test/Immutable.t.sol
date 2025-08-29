// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Immutable.sol";

contract ContractImmutableTest is Test {
    ContractImmutable public contractImmutable;

    function setUp() public {}

    // function testContractImmutable() external {
    //     uint256 startGas = gasleft();
    //     contractImmutable = new ContractImmutable(10);
    //     uint256 gasUsed = startGas - gasleft();

    //     assertEq(contractImmutable.value(), 10, "expected value to be 10");

    //     if (gasUsed < 90000) assertFalse(false);
    //     else assertFalse(true);
    // }

    // function testContractImmutable2() external {
    //     uint256 startGas = gasleft();
    //     contractImmutable = new ContractImmutable(550);
    //     uint256 gasUsed = startGas - gasleft();

    //     assertEq(contractImmutable.value(), 550, "expected value to be 550");

    //     if (gasUsed < 90000) assertFalse(false);
    //     else assertFalse(true);
    // }

    function testImmutableNotInStorage() external {
    contractImmutable = new ContractImmutable(99);

    // slot 0 would hold `value` if it were a normal state var
    bytes32 slot0 = vm.load(address(contractImmutable), bytes32(uint256(0)));

    // since `value` is immutable, it won't be in storage
    assertEq(slot0, bytes32(0));
    assertEq(contractImmutable.value(), 99);
}
}
