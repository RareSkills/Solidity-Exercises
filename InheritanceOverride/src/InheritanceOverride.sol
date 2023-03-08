// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

// You may not modify this contract
contract Number {
    function getNumber() public view virtual returns (uint256) {
        return 3;
    }
}

contract InheritanceOverride is Number {
    /*
        This exercise assumes you know how overriding a function works.
        1. Override `getNumber` function in the parent contract.
        2. `getNumber` function should return uint 10.
    */
    
    // prettier-ignore
    // your code here
}
