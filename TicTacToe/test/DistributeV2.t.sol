// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/DistributeV2.sol";

contract DistributeV2Test is Test {
    DistributeV2 public distributeV2;
    ReluctantReceiver public reluctantReceiver;

    function setUp() public {
        distributeV2 = new DistributeV2{value: 4 ether}();
        reluctantReceiver = new ReluctantReceiver();
    }

    function testDistributeEther() public {
        assertEq(
            address(distributeV2).balance,
            4 ether,
            "balance of distributeV2 contract is not 4 ether"
        );

        address[] memory addresses = new address[](4);
        addresses[0] = address(0xBab);
        addresses[1] = address(0xBeb);
        addresses[2] = address(0xBed);
        addresses[3] = address(reluctantReceiver);

        distributeV2.distributeEther(addresses);

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
            0,
            "balance of address 0xBad is not 1 ether"
        );

        assertEq(
            address(distributeV2).balance,
            1 ether,
            "balance of distributeV2 contract is not 0 ether"
        );
    }
}

contract ReluctantReceiver {}
