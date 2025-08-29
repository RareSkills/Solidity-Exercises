// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ReducingPayout {
    uint256 public immutable depositedTime;
    uint256 public constant DURATION = 24 hours;
    uint256 public immutable initialDeposit;

    constructor() payable {
        require(msg.value == 1 ether, "Must deposit 1 ether");
        depositedTime = block.timestamp;
        initialDeposit = msg.value;
    }

    function withdraw() public {
        uint256 elapsed = block.timestamp - depositedTime;

        uint256 withdrawAmount;
        if (elapsed >= DURATION) {
            withdrawAmount = 0; // at 24h, nothing left
        } else {
            withdrawAmount = 1 ether - ((elapsed* 0.0011574 ether) / 100);
        }

        (bool ok, ) = msg.sender.call{value: withdrawAmount}("");
        require(ok, "tx reverted");
    }
}
