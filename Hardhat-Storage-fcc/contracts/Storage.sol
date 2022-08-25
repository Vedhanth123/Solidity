// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

// This smart contract just takes in information from the users and stores them in the memory

contract Storage {

    // In this session we are going to learn about mappings datatype in solidity

    // Mappings are similar to dictionaries in python
    // Here we map a single value to another value

    // This line represents a dictionary "mapping(string => uint256)" this represents a datatype, "Mydictionary" represents a variable name
    mapping(string => uint256) public Mydictionary;

    // by default the values of uint256 [RHS] values will be their solidity defined NULL values in this case its 0

    // creating a function to insert values into dictionary
    function AddingValuesToDictionary(string memory _name, uint256 number) public virtual {

        // this line is similar to saying "Mydictionary["Vedhanth"] = 111"
        Mydictionary[_name] = number;
    }

    function RetrievingValuesFromDictionary(string memory _name) public virtual view returns(uint256) {
        return Mydictionary[_name];
    }

    // We have successfully created a mapping datatype and added values to it.
}