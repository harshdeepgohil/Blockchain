// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;


contract stud_Detail{

    address sir;

    struct stud{
        string name;
        uint256 enroll_no;
        string program;
        uint256 semester;
        uint256 marks;
    }

    mapping(uint256=>stud) students;

    uint256 numOfstud = 1;

    constructor(){
        sir=msg.sender;
    }

    function addStud(string memory name,uint256 enr_no,string memory prog,uint256 sem,uint256 marks)public{
        require(msg.sender==sir,"Only Sir Can Add Student");
        students[numOfstud]=stud(name,enr_no,prog,sem,marks);

        numOfstud++;
    }

    function verify(uint256 numStud,uint256 enroll)public view returns (string memory){
        require(msg.sender==sir,"Only Sir Can verify");
        if(students[numStud].enroll_no==enroll){
            return "Student Is Availabl !!!!";
        }else{
            return"No Availbl !!!!!!!!!!!!!!!!!!";
        }
    }


}