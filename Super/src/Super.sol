// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

// You may not modify this contract
contract HelloWorld {
    function greetings() public pure virtual returns (string memory) {
        return "Hello World";
    }
}

contract Super is HelloWorld {
    /*
        This exercise assumes you know how `super` keyword works.
        1. Create a function `getGreetings` that returns the value in 
           `greetings` function.
    */

    function greetings() public pure override returns (string memory) {
        return "Hi there!";
    }

    // your code here
}
