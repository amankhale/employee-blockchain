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
    event DeletedEmployee(string);
    event UpdatedEmployee(EmployeeData);

    EmployeeData[] employeeList;

    uint public employeeCount = 0;

    function getEmployeeList() public view returns (EmployeeData[] memory) {
        return employeeList;
    }

    function addEmployee(EmployeeData memory _employee) public payable {
        employeeList.push(_employee);
        employeeCount++;
        emit NewEmployee(_employee);
    }

    function getEmployeeById(
        string memory _id
    ) public view returns (EmployeeData memory) {
        EmployeeData memory _employee;
        for (uint256 index = 0; index < employeeList.length; index++) {
            if (compareString(employeeList[index].id, _id)) {
                _employee = employeeList[index];
                break;
            }
        }
        return _employee;
    }

    function editEmployee(EmployeeData memory _employee) public payable {
        for (uint256 index = 0; index < employeeCount; index++) {
            if (compareString(employeeList[index].id, _employee.id)) {
                employeeList[index] = _employee;
                break;
            }
        }
        emit UpdatedEmployee(_employee);
    }

    function deleteEmployee(string memory _id) public payable {
        for (uint256 index = 0; index < employeeCount; index++) {
            if (compareString(employeeList[index].id, _id)) {
                deleteArrayElement(index);
                break;
            }
        }
        emit DeletedEmployee(_id);
    }

    function compareString(
        string memory a,
        string memory b
    ) internal pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }

    function deleteArrayElement(uint _indexOfElement) public payable {
        if (_indexOfElement >= employeeCount) return;
        if (_indexOfElement == employeeList.length - 1) {
            employeeList.pop();
            employeeCount--;
            return;
        }
        for (
            uint256 index = _indexOfElement;
            index < employeeList.length - 1;
            index++
        ) {
            employeeList[index] = employeeList[index + 1];
        }
        employeeList.pop();
        employeeCount--;
    }
}
