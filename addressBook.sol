// SPDX-License-Identifier: MIT
pragma solidity> 0.8.0;


contract maintainAddBook{

    address manager;

    struct addressBook{
        string name;
        address accountAddress;
    }

    mapping(address=>addressBook) addressBooks;

    constructor(){
            manager=msg.sender;
    }

    function addAddress(string memory name,address account) public{
        require(msg.sender==manager,"Only manager can add the details");

        require(addressBooks[account].accountAddress==account,"alerady present ");

       addressBooks[account] =addressBook(name,account);
    }

    function getName(address account)public view returns(string memory){
        return addressBooks[account].name;
    }
}