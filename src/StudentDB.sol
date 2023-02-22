// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract StudentDB {
    /* This exercise assumes you know how structs works.
   create a data for a student who's name is `John` and age is `12`.
   Return John's age in the function below*/

    constructor() {
        createStudent("John", 12);
    }

    // create John's data
    function createStudent(string memory _name, uint32 _age) public {}

    // return John's age only
    function getJohnsAge() public view returns (uint32) {}
}
