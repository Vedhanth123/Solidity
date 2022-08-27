// SPDX-License-Identifier: MIT

// Contract which does these things:
// 1) Users send ether into this contract to store their ether
// 2) Owner can withdraw the amount
// 3) Users can take their ether back from this contract

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    address public immutable Owner;
    address[] public Users;
    mapping (address => uint) public AddressToValue;
    int256 public minimumEth;
    address contractAddress = 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e;
    AggregatorV3Interface contractInstance = AggregatorV3Interface(contractAddress);

    // Constructor which acts when the contract is being deployed and stores the address of the Owner in a variable
    constructor() {
        Owner = payable(msg.sender);
    }

    // 1) Users send ether into this contract
    function sendEth () public payable returns (string memory) {

        // We are setting the minimum amount that a user need to send to this contract
        require(msg.value >= uint(minimumEth), "Eth amount too low!");
        
        // Storing the users addresses in an array
        Users.push(msg.sender);

        return "Eth sent successfully!";
    } 

    // 2) Owner can withdraw the amount
    function OwnerWithdraw () public payable {

        // Only the Owner can withdraw the amount
        require(msg.sender == Owner, "You cannot withdraw all the funds only Owner can withdraw all the funds");

        // To send Eth from contract to the Owner use call method
        // convert address of the Owner to payable
        (bool success, bytes memory data) = Owner.call{value: address(this).balance}("");

        // We then update the balances of all the users in the contract
        for (uint i = 0; i < Users.length; i++) {
            AddressToValue[Users[i]] = 0;
        }

    }

    // 3) Users can take their money back from this contract
    function userWithdraw () public {

        // Convert the user address to payable address
        address UserAddress = msg.sender;
        (bool success, bytes memory data) = UserAddress.call{value: AddressToValue[UserAddress]}("");

    }

    // function which gets data about value of ETH for 10$
    function getValueOfEth() public payable {

        (
            ,
            int256 _answer,
            ,
            ,
            
        ) = contractInstance.latestRoundData();
        minimumEth = _answer / (10 ** 8);

        minimumEth = (10**18) * 10/minimumEth;

    }
}
