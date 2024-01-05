// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/DeployContract.sol";

contract DeployContractTest is Test {
    Deployer public deployer;

    function setUp() public {
        deployer = new Deployer();
    }

    function testGetGreetings() external {
        address newContract = deployer.deployContract();

        assertTrue(newContract.code.length > 0, "newContract is not a contract");
    }
}
