// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract mintC{
    address manager;
    mapping(address=>uint256) public passbook;

    constructor(){
        manager=msg.sender;

    }

    function mint(address receiver,uint256 amount)public {
        require(msg.sender==manager,"only manager can mint");

        passbook[receiver]+=amount;
    }

    function transfer(address receiver,uint256 amount)public {
        require(amount<=passbook[msg.sender],"Insufficient balance");

        passbook[msg.sender]-=amount;
        passbook[receiver]+=amount;
    }
}