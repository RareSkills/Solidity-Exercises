// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/CrossContract.sol";

contract CrossContractTest is Test {
    CrossContract public crossContract;
    PriceOracle1 public priceOracle1;
    PriceOracle2 public priceOracle2;

    function setUp() public {
        crossContract = new CrossContract();
        priceOracle1 = new PriceOracle1();
        priceOracle2 = new PriceOracle2();
    }

    function testGetLowerPrice() public {
        priceOracle1.setPrice(10);
        priceOracle2.setPrice(20);

        assertEq(
            crossContract.getLowerPrice(
                address(priceOracle1),
                address(priceOracle2)
            ),
            10,
            "Expected lower price to be 10"
        );

        priceOracle1.setPrice(12);
        priceOracle2.setPrice(12);

        assertEq(
            crossContract.getLowerPrice(
                address(priceOracle1),
                address(priceOracle2)
            ),
            12,
            "Expected lower price to be 12"
        );

        priceOracle1.setPrice(42);
        priceOracle2.setPrice(1);

        assertEq(
            crossContract.getLowerPrice(
                address(priceOracle1),
                address(priceOracle2)
            ),
            1,
            "Expected lower price to be 1"
        );

        priceOracle1.setPrice(type(uint256).max);
        priceOracle2.setPrice(type(uint256).max - 1);

        assertEq(
            crossContract.getLowerPrice(
                address(priceOracle1),
                address(priceOracle2)
            ),
            type(uint256).max - 1,
            "Expected lower price to be type(uint256).max - 1"
        );
    }
}
