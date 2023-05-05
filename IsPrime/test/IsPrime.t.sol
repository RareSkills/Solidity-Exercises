// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/IsPrime.sol";

contract IsPrimeTest is Test {
    IsPrime public isPrime;

    function setUp() public {
        isPrime = new IsPrime();
    }

    function testIsPrime() public {
        assertEq(isPrime.isPrime(1), false, "1 isn't a prime number");
        assertEq(isPrime.isPrime(2), true, "2 is a prime number");
        assertEq(isPrime.isPrime(8), false, "8 isn't a prime number");
        assertEq(isPrime.isPrime(11), true, "11 is a prime number");
        assertEq(isPrime.isPrime(16), false, "16 isn't a prime number");
        assertEq(isPrime.isPrime(23), true, "23 is a prime number");
        assertEq(isPrime.isPrime(101), true, "101 is a prime number");
        assertEq(isPrime.isPrime(202), false, "202 isn't a prime number");
    }
}
