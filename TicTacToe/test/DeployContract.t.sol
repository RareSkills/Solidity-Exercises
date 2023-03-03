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

        newContract.code.length > 0
            ? assertFalse(false)
            : assertFalse(true, "newContract is not a contract");
    }
}
