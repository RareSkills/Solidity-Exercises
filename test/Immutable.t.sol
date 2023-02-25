// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Immutable.sol";

contract ContractImmutableTest is Test {
    ContractImmutable public contractImmutable;

    function setUp() public {}

    function testContractImmutable() external {
        uint256 startGas = gasleft();
        address(new ContractImmutable(10));
        uint256 gasUsed = startGas - gasleft();

        if (gasUsed < 50000) assertFalse(false);
        else assertFalse(true);
    }
}
