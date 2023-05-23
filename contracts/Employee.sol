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
        string[] techStack;
        string location;
        string remarks;
    }

    event NewEmployee(EmployeeData);

    mapping(string => EmployeeData) public employeeList;
    uint public employeeCount = 0;

    function addEmployee(EmployeeData memory _employee) public payable {
        employeeList[_employee.id] = _employee;
        employeeCount++;
        emit NewEmployee(_employee);
    }
}
