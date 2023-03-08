// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Deployer.sol";

contract DeployerTest is Test {
    Deployer public deployer;

    function setUp() public {
        deployer = new Deployer("Hello Solidity");
    }

    function testGreeting() public {
        string memory greeting = deployer.greeting();
        assertEq(
            keccak256(abi.encode(greeting)),
            keccak256(abi.encode("Hello Solidity"))
        );
    }
}
