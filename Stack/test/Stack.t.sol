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
        assertEq(_stack.length, 5, "Stack length after pushing 3 should be 5");
        assertEq(_stack[4], 3, "Top element after push should be 3");
    }

    function testPeek() external {
        uint256[] memory _stack = stack.getStack();
        if (_stack.length == 0) revert();
        uint256 peekValue = stack.peek();
        assertEq(
            peekValue,
            1,
            "Peek value should be the last element in the stack"
        );
    }

    function testPeekEmptyStack() external {
        // Empty the stack first
        for (uint256 i = 0; i < 4; i++) {
            stack.pop();
        }
        // Expect peek to revert
        vm.expectRevert();
        stack.peek();
    }

    function testPop() external {
        uint256[] memory _stack = stack.getStack();
        if (_stack.length == 0) revert();
        uint256 popValue = stack.pop();
        _stack = stack.getStack();
        assertEq(
            popValue,
            1,
            "Pop value should be the last element in the stack"
        );
        assertEq(_stack.length, 3, "Stack length after pop should be 3");
    }

    function testPopEmptyStack() external {
        // Empty the stack first
        for (uint256 i = 0; i < 4; i++) {
            stack.pop();
        }
        // Expect pop to revert
        vm.expectRevert();
        stack.pop();
    }

    function testSize() external {
        uint256 size = stack.size();
        assertEq(size, 4, "Initial size to be 4");

        // Push an element and check size
        stack.push(5);
        assertEq(stack.size(), 5, "Size after push should be 5");

        // Pop an element and check size
        stack.pop();
        assertEq(stack.size(), 4, "Size after pop should be 4");
    }

    function testGetStack() external {
        uint256[] memory _stack = stack.getStack();
        assertEq(_stack.length, 4, "Initial stack length should be 4");
        assertEq(_stack[0], 2, "First element should be 2");
        assertEq(_stack[1], 7, "Second element should be 7");
        assertEq(_stack[2], 4, "Third element should be 4");
        assertEq(_stack[3], 1, "Fourth element should be 1");

        // Push an element and verify
        stack.push(6);
        _stack = stack.getStack();
        assertEq(_stack.length, 5, "Stack length after push should be 5");
        assertEq(_stack[4], 6, "Fifth element should be 6");

        // Pop an element and verify
        stack.pop();
        _stack = stack.getStack();
        assertEq(_stack.length, 4, "Stack length after pop should return to 4");
    }
}
