// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OriginVsSender {
    /**
     * In this exercise the task is to require that the caller of
     * the function "setNumber(uint256)" is the initiator of the transaction using tx.origin and msg.sender keywords
     */

    uint256 public number;

    function setNumber(uint256 num) external {
        /// your code here
    }
}
