// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

// You may modify this contract
contract Parent {
    uint256 private _value;
}

contract Child is Parent {
    /*
        This exercise assumes you understand how access modifiers works.
        1. `_value` variable is private and can only be accessed by `Parent` contract. Make the variable accessible
           to `Parent` and `Child` contract ONLY.
    */

    function setValue(uint256 newValue) public {
        _value = newValue;
    }

    function getValue() public view returns (uint256) {
        return _value;
    }
}
