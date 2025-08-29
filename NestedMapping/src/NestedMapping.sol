// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract NestedMapping {
    /* This exercise assumes you know how nested mappings work.
        1. Create a public nested mapping of (address => uint256 => bool).
        2. The name of the mapping must be `nestedBool`
        3. Set the boolean value of the arguments to `true` in the 'setNestedDetails' function
        4. use the 'returnNestedDetails' function to return the values of a nested data
    */
    mapping(address=>mapping(uint256=>bool)) public nestedBool;
    function setNestedDetails(address _addr, uint256 _num) public {
        // your code here
        nestedBool[_addr][_num]=true;
    }

    function returnNestedDetails(
        address _addr,
        uint256 _num
    ) public view returns (bool) {
        // your code here
        return nestedBool[_addr][_num];
    }
}
