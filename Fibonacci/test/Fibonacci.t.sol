// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Fibonacci.sol";

contract FibonacciTest is Test {
    Fibonacci public fibonacci;

    function setUp() public {
        fibonacci = new Fibonacci();
    }

    function testFibonacci() external {
        uint256 result = fibonacci.fibonacci(4);
        uint256 result1 = fibonacci.fibonacci(10);
        uint256 result2 = fibonacci.fibonacci(20);
        uint256 result3 = fibonacci.fibonacci(1);

        assertEq(result, 3, "expected result to be 3");
        assertEq(result1, 55, "expected result to be 55");
        assertEq(result2, 6765, "expected result to be 6765");
        assertEq(result3, 1, "expected result to be 1");
    }
}
