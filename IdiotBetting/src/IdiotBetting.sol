// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */
    uint256 latestDeposit;
    uint256 lastDepositTime;
    address PotentialWinner;
    function bet() public payable {
        // your code 
        if(msg.value>latestDeposit)
{

        latestDeposit = msg.value;
        lastDepositTime = block.timestamp;
        PotentialWinner = msg.sender;
        }
    }

    function claimPrize() public {
        // your code here
        require(PotentialWinner==msg.sender,"You are not the winner");
        require(block.timestamp - lastDepositTime>1 hours,"Require more than 1 hour passed");
        (bool ok,)=msg.sender.call{value:address(this).balance}("");
        require(ok,"Transaction Reverted");
    }
}
