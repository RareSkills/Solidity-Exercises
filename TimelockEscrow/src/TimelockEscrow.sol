//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract TimelockEscrow {
    address public seller;

    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */

    constructor() {
        seller = msg.sender;
    }

    struct Order{
        address buyer;
        uint256 amount;
        uint256 time;
        bool active;
    }
    mapping(address=>Order) order;
    /**
     * creates a buy order between msg.sender and seller
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
        Order storage o = order[msg.sender];
        require(!o.active, "Order exists");

        o.active = true;
        o.amount = msg.value;
        o.buyer = msg.sender;
        o.time = block.timestamp;
    }

    /**
     * allows seller to withdraw after 3 days of the escrow with @param buyer has passed
     */
    function sellerWithdraw(address buyer) external {
        // your code here
       Order storage o = order[buyer];
        require(o.active, "Order inactive");
        require(block.timestamp >= o.time + 3 days, "Too early");

        uint256 amount = o.amount;
        o.active = false; // prevent reentrancy
        o.amount = 0;

        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "Transfer failed");
    }

    /**
     * allows buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
        // your code here
        Order storage o = order[msg.sender];
          require(o.active, "Order inactive");
        require(msg.sender == o.buyer, "Not buyer");
        require(block.timestamp < o.time + 3 days, "Too late");

        uint256 amount = o.amount;
        o.active = false;
        o.amount = 0;

        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "Transfer failed");
        
    }

    // returns the escrowed amount of @param buyer
    function buyerDeposit(address buyer) external view returns (uint256) {
        // your code here
        return order[buyer].amount;
    }
}

