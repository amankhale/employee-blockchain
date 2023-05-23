// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Employee {
    struct EmployeeData {
        string id;
        string firstName;
        string lastName;
        string email;
        string date;
        string education;
        string designation;
        string[3] techStack;
        string location;
        string remarks;
    }

    event NewEmployee(EmployeeData);

    mapping(uint => EmployeeData) public employeeList;
    uint public employeeCount = 0;

    function addEmployee(EmployeeData memory _employee) public payable {
        employeeList[employeeCount] = _employee;
        employeeCount++;
        emit NewEmployee(_employee);
    }
}
