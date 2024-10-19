// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Mean.sol";

contract MeanTest is Test {
    Mean public mean;

    function setUp() public {
        mean = new Mean();
    }

    function testMeanx() external {
        uint256[] memory x = new uint256[](5);
        x[0] = 5;
        x[1] = 10;
        x[2] = 15;
        x[3] = 20;
        x[4] = 25;

        assertEq(mean.mean(x), 15, "expected mean of arr 'x' is 15");
    }

    function testMeany() external {
        uint256[] memory y = new uint256[](5);
        y[0] = 5;
        y[1] = 10;
        y[2] = 15;
        y[3] = 19;
        y[4] = 25;

        assertEq(mean.mean(y), 14, "expected mean of array 'y' is 14");
    }

    function testMeanMostlyZeroes() external {
        uint256[] memory z = new uint256[](5);
        z[0] = 0;
        z[1] = 0;
        z[2] = 1;
        z[3] = 0;
        z[4] = 0;

        assertEq(mean.mean(z), 0, "expected mean of arr 'z' is 0");
    }

    function testMeanSingleElement() external {
        uint256[] memory singleElement = new uint256[](1);
        singleElement[0] = 42;
        assertEq(
            mean.mean(singleElement),
            42,
            "expected 42, because the answer to ultimate question of life is 42. Also, mean of a single-element array should be element itself"
        );
    }

    function testMeanLargeNumbers() external {
        uint256[] memory largeNumbers = new uint256[](3);
        largeNumbers[0] = 1e42;
        largeNumbers[1] = 1e42;
        largeNumbers[2] = 1e42;

        assertEq(
            mean.mean(largeNumbers),
            1e42,
            "Mean of large numbers should be the large number itself"
        );
    }

    function testMeanEmptyArray() external {
        uint256[] memory emptyArray = new uint256[](0);
        vm.expectRevert(abi.encodeWithSignature("Panic(uint256)", 0x12));
        mean.mean(emptyArray);
    }
}
