// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Distribute.sol";

contract DistributeTest is Test {
    Distribute public distribute;

    function setUp() public {
        distribute = new Distribute{value: 4 ether}();
    }

    function testDistributeEther() public {
        assertEq(
            address(distribute).balance,
            4 ether,
            "balance of distribute contract is not 4 ether"
        );

        address[] memory addresses = new address[](4);
        addresses[0] = address(0xBab);
        addresses[1] = address(0xBeb);
        addresses[2] = address(0xBed);
        addresses[3] = address(0xBad);

        distribute.distributeEther(addresses);

        assertEq(
            addresses[0].balance,
            1 ether,
            "balance of address 0xBab is not 1 ether"
        );
        assertEq(
            addresses[1].balance,
            1 ether,
            "balance of address 0xBeb is not 1 ether"
        );
        assertEq(
            addresses[2].balance,
            1 ether,
            "balance of address 0xBed is not 1 ether"
        );
        assertEq(
            addresses[3].balance,
            1 ether,
            "balance of address 0xBad is not 1 ether"
        );

        assertEq(
            address(distribute).balance,
            0,
            "balance of distribute contract is not 0 ether"
        );
    }
}
