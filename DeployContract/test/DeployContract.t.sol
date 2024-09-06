// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/DeployContract.sol";

contract DeployContractTest is Test {
    Deployer public deployer;

    function setUp() public {
        deployer = new Deployer();
    }

    function testDeployContract() external {
        vm.prank(address(0xb0b));
        address newContract = deployer.deployContract();

        require(newContract != address(deployer), "Cannot return `deployer` address");

        newContract.code.length > 0 ? assertFalse(false) : assertFalse(true, "newContract is not a contract");
    }
}
