// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract ThirdContract {
    
    // We are learning about arrays and structs in Solidity

    // Structs are similar to structs in C language where in which you create a user defined data type
    // and store different types of elements collectively.

    // creating a People struct
    struct People {
        uint256 number;
        string name;
    }

    // creating people variable
    // People public p1 = People({number : 16, name : "Lenovo"});

    // Here we are creating an array of People structs
    People[] public p1;

    // Arrays in solidity have 3 types of methods


    // Here we are creating a function to store data into our newly created array
    function store (uint256 _number, string memory _name) public {

        // This line represents adding of new elements to a array
        // People is a constructor which is used to create people variable and then the data is stored into the array
        p1.push(People({number : _number, name : _name}));


    }
}