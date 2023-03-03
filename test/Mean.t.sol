// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Mean.sol";

contract MeanTest is Test {
    Mean public mean;

    function setUp() public {
        mean = new Mean();
    }

    function testMean() public {
        uint256[] memory x = new uint256[](5);
        x[0] = 5;
        x[1] = 10;
        x[2] = 15;
        x[3] = 20;
        x[4] = 25;

        uint256[] memory y = new uint256[](5);
        y[0] = 5;
        y[1] = 10;
        y[2] = 15;
        y[3] = 19;
        y[4] = 25;

        uint256[] memory z = new uint256[](5);
        z[0] = 0;
        z[1] = 0;
        z[2] = 1;
        z[3] = 0;
        z[4] = 0;

        assertEq(mean.mean(x), 15, "mean of arr 'x' is 15");
        assertEq(mean.mean(y), 14, "mean of arr 'y' is 14");
        assertEq(mean.mean(z), 0, "mean of arr 'z' is 0");
    }
}
