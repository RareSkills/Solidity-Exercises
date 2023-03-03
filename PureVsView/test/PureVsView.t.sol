// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PureVsView.sol";

contract PureVsViewTest is Test {
    PureVsView public pureVsView;

    function setUp() public {
        pureVsView = new PureVsView();
    }

    function testGetX() external {
        assertEq(
            pureVsView.getX(),
            24,
            "expected (pureVsView.getX() to return 24"
        );
    }

    function testGetY() external {
        assertEq(
            pureVsView.getY(),
            42,
            "expected (pureVsView.getY() to return 42"
        );
    }
}
