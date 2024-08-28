// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Auction {
    address public auctioneer; // Address of the auctioneer
    address public highestBidder; // Address of the highest bidder
    uint256 public highestBid=10; // Highest bid amount

    mapping(address => uint256) public bids; // Mapping to store bids of each bidder


    // Constructor to initialize the auction
    constructor() {
        auctioneer = msg.sender;
    }

    // Function to place a bid
    function placeBid() external payable{
        require(msg.value > highestBid, "Bid must be higher than the current highest bid");

        if (msg.value >highestBid) {

             highestBidder = msg.sender;
        highestBid = msg.value;
        bids[msg.sender] += msg.value;
        }   
       
    }

    // Function to get the winner of the auction
    function getWinner() external view returns (address) {
        return highestBidder;
    }

    //Function to withdraw bid
    function withdrawBid() public{
        require(msg.sender!=highestBidder,"highest bidder cant withdraw");
        uint256 amount=bids[msg.sender];
        require(amount>0,"No Amount To Be WithDraw");

        if(amount>0){
            payable(msg.sender).transfer(amount);
        }
    }
}
