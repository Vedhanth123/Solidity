// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// We do need to import our contract file into this smart contract to inherit from it
import "./FourthContract.sol";

// In this smart contract we are trying to inherit from FourthContract.sol and override the functions of it
contract SixthContract is FourthContract{

    // To override the functions we need to use two keywords: override, virtual
    // override is used in child smart contract
    // virtual is used in parent smart contract

    function AddingValuesToDictionary(string memory _name, uint256 number) public override {

        // Now we have overriden the function of the smart contract
        Mydictionary[_name] = number + 5;
    }
    
}