pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable public employeeOne;
    address payable public employeeTwo;
    address payable public employeeThree;
    
    address payable OWNER = msg.sender;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employeeOne = _one;
        employeeTwo = _two;
        employeeThree = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        require (msg.sender == OWNER, "You do not have permission to call this function.");
        // @TODO: Split `msg.value` into three
        uint amount = msg.value / 3;

        // @TODO: Transfer the amount to each employee
        employeeOne.transfer(amount);
        employeeTwo.transfer(amount);
        employeeThree.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        uint remainder = msg.value - (amount * 3);
        msg.sender.transfer(remainder);
    }

    function() external payable {
       deposit();
    }
}