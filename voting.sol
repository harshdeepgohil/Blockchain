// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract voting {
    address[] public voters = [
        0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
        0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
        0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db,
        0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB
    ];

    string[] party = ["a", "b", "c"];
    mapping(address => bool) votedVoters;
    address manager;
    mapping(uint256 => uint256) noOfVotesToParty;

    constructor() {
        manager = msg.sender;
    }

    function voting_process(uint256 partyNumber) public {
        require(votedVoters[msg.sender] == true, "you Already voted");

        votedVoters[msg.sender] = true;
        noOfVotesToParty[partyNumber] += 1;
        votedVoters[msg.sender] = false;
    }

    function winner() public view returns (string memory) {
        if (
            noOfVotesToParty[0] > noOfVotesToParty[1] &&
            noOfVotesToParty[0] > noOfVotesToParty[2]
        ) {
            return party[0];
        } else if (noOfVotesToParty[1] > noOfVotesToParty[2]) {
            return party[1];
        } else {
            return party[2];
        }
    }
}
