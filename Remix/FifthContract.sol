// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// In order to call another smart contract into this contract we have to import that smart contract into this one
import "./FourthContract.sol";

contract FifthContract {

    // In solidity smart contracts can call each other themselves and run a smart contract within another
    // smart contract this technique is called composability

    // To call that smart contract we have to create object in this smart contract
    FourthContract public AnotherContract;

    // We can also create Array of smart contracts
    // ----> This line represents array of smart contracts 
    // FourthContract[] public ArrayOfSmartContracts;

    // Let us create a function
    function CallingaContract() public {
        
        // Let us call a constructor to initialize the object
        AnotherContract = new FourthContract();

        // We have successfully created the smart contract object.
    }

    // We are creating a function to insert values to the Smart contract
    // Accessing functions of smart contract is similar to accessing methods from an object in languages like Java, Python, Javascript etc...
    function insertValuesToSmartContract(string memory StringToBeGivenToSmartContract, uint256 NumberToBeGivenSmartContract) public {
        AnotherContract.AddingValuesToDictionary(StringToBeGivenToSmartContract, NumberToBeGivenSmartContract);
    }

    // creating a function to retrieve values from the Smart contract
    function retrieveValuesFromSmartContract(string memory StringToBeGivenToSmartContract) public view returns(uint256) {
        return AnotherContract.RetrievingValuesFromDictionary(StringToBeGivenToSmartContract);
    }
}