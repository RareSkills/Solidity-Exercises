// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/FizzBuzz.sol";

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

        assertEq(res1, "fizz", "expected res1 to beturn 'fizz'");
        assertEq(res2, "buzz", "expected res2 to beturn 'buzz'");
        assertEq(res3, "fizz buzz", "expected res3 to beturn 'fizz buzz'");
        assertEq(res4, "", "expected res4 to return ''");
    }
}
