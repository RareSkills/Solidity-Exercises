// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TripleNestedMapping {
    /* 
        This exercise assumes you know how mappings work.
        1. Create a public TRIPLE nested mapping of 
           (string(_name) => uint256(_password) => uint256(_pin) => bool).
        2. The name of the mapping must be `isLoggedIn` and it should be public.
        3. Set the boolean value of the arguments to `true` in the 'setLogin' function.
    */

    function setLogin(
        string memory _name,
        uint256 _password,
        uint256 _pin
    ) public {
        // your code here
    }
}
