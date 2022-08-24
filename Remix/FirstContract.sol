// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8; // here we are defining the version of solidity to be compiled

contract FirstContract { // contracts in Solidity are similar to Classes in javascript

    // we have datatypes in solidity as similar to other programming languages

    // uint8 is 8 bits long or 1 byte long and can only store positive values
    uint8 Myvariable = 1;

    // int256 is 256 bits long or 32 bytes long and can store both positive and negative values
    int256 Myanothervariable = 523432; 

    // Mybyte is another of datatype which is used to store any datatype in it and it is a byte long.
    // Bytes data start from '0x'
    bytes4 Mybyte = "Web3";

    // strings are also byte but they can only store letters and numbers in then
    string Mystring = "Solidity"; 

    // This is another datatype which is used to store address.
    // This type is extensively used while writing smart contracts as we would be always
    // transferring money, crypt, NFTs or something or the other thing in our contracts
    address Myaddress = 0x521337b262972857537400B901486E42b3f91b47;
}