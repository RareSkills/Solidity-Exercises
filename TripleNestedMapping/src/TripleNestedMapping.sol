// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TripleNestedMapping {
    /* 
        This exercise assumes you know how mappings work.
        1. Create a public TRIPLE nested mapping of (address => string => uint256 => bool).
        2. The name of the mapping must be `isLoggedIn`.
        3. Set the boolean value of the arguments to `true` in the 'setLogin' function.
        4. use the 'checkLogin' function to check if a user is logged in.
    */

    function setLogin(string memory _name, uint256 _password) public {
        // your code here
    }

    function checkLogin(string memory _name, uint256 _password)
        public
        view
        returns (bool)
    {
        // your code here
    }
}
