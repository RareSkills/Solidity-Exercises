// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/3_FizzBuzz.sol";

contract FizzBuzzTest is Test {
    FizzBuzz public fizzBuzz;

    function setUp() public {
        fizzBuzz = new FizzBuzz();
    }

    function testFizzBuzz() external {
        string memory res1 = fizzBuzz.fizzBuzz(6);
        string memory res2 = fizzBuzz.fizzBuzz(10);
        string memory res3 = fizzBuzz.fizzBuzz(15);
        string memory res4 = fizzBuzz.fizzBuzz(17);

        assertEq(res1, "fizz");
        assertEq(res2, "buzz");
        assertEq(res3, "fizz buzz");
        assertEq(res4, "");
    }
}
