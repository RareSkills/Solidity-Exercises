// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FizzBuzz {
    function fizzBuzz(uint256 n) public pure returns (string memory) {
        // if n is divisible by 3, return "fizz"
        if (n%5==0 && n%3==0){
            return "fizz buzz";
        }else if (n%5==0){
            return "buzz";
        }else if(n%3==0){
            return "fizz";
        }{
            return "";
        }
        // if n is divisible by 5, return "buzz"
        // if n is divisible be 3 and 5, return "fizz buzz"
        // otherwise, return an empty string
    }
}
