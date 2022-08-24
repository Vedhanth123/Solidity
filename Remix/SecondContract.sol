// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract SecondContract {

    // In this file we are going to discuss about functions in Solidity

    // functions in solidity are similar to functions in java, javascript, python etc...

    // We have 4 types of functions
    // 1) internal -> can only be accessed by this smart contract and inherited smart contracts
    // 2) external -> visible only externally
    // 3) private -> can only be accessed by this smart contract
    // 4) public -> can be accessed by anyone

    // view, pure functions are the types of functions which don't need gas fees to be called upon
    // pure funcitions are the type of functions which don't allow the inner data to be shown

    // There is also another thing to tell. The cost of the gas fees to interact with the pure and view functions
    // will be given only if the function in the smart contract calls the view or pure functions

    // The more number of lines we write in a function the more gas fees we have to pay for it to be deployed

    // Let's write some examples of functions here.

    uint256 public myvariable;

    function Myfunction(uint256 _myvariable) public {
        myvariable = _myvariable;
    }

    function ViewMyVariable() public view returns(uint256) {
        return myvariable;
    }
}