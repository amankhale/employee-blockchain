const Employee = artifacts.require("Employee");

module.exports = function (deployer) {
  deployer.deploy(Employee);
};
