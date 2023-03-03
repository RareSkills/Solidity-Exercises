// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Stack.sol";

contract StackTest is Test {
    Stack public stack;

    function setUp() public {
        uint256[] memory _stack = new uint256[](4);
        _stack[0] = 2;
        _stack[1] = 7;
        _stack[2] = 4;
        _stack[3] = 1;

        stack = new Stack(_stack);
    }

    function testPush() external {
        stack.push(3);
        uint256[] memory _stack = stack.getStack();
        assertEq(_stack.length, 5, "Error pushing to stack");
    }

    function testPeek() external {
        uint256[] memory _stack = stack.getStack();
        if (_stack.length == 0) revert();
        uint256 peekValue = stack.peek();
        assertEq(peekValue, 1, "Error peeking from stack");
    }

    function testPop() external {
        uint256[] memory _stack = stack.getStack();
        if (_stack.length == 0) revert();
        uint256 popValue = stack.pop();
        _stack = stack.getStack();
        assertEq(popValue, 1, "Error peeking from stack");
        assertEq(_stack.length, 3, "Error popping from stack");
    }

    function testSize() external {
        uint256 size = stack.size();
        assertEq(size, 4, "Expected size to be 4");
    }
}
