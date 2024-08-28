// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract hotelBooking {
    address manager;

    struct rooms {
        bool availabel;
        uint256 price;
        string name;
        // address payable owner;
    }
    mapping(uint256 => rooms) availRooms;
    mapping(uint256 => bool) bookedRooms;
    uint256 numOfRooms = 0;

    mapping(address => uint256) public user;

    constructor() {
        manager = msg.sender;
    }

    function addRoom(string memory name) public {
        require(msg.sender == manager, "only manager is allow to add room");
        availRooms[numOfRooms] = rooms(true, 5 ether, name);

        numOfRooms++;
    }

    function bookRoom(uint256 roomIndex) public payable {
        require(availRooms[roomIndex].availabel == true, "alrdy booked");
        require(numOfRooms > roomIndex, "rooms is not present");
        require(
            msg.value < availRooms[roomIndex].price,
            "Must grtr than 5 ether"
        );

        availRooms[roomIndex].availabel = false;

        user[msg.sender] = roomIndex;
    }

    function checkOut(uint256 index) public payable {
        availRooms[index].availabel = true;
    }
}
