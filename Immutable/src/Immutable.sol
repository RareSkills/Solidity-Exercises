// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

/*
    This exercise assumes you know how to declare immutable variables.
    1. Make the variable `value` immutable.
*/

contract ContractImmutable {
    uint256 immutable public value;

    constructor(uint256 _value) {
        value = _value;
    }
}
