// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract FundMe {

    // This is a basic contract which can be used to deposit value to and withdraw value from this contract

    // Know the value of the ETH in terms of USD

    // Creating an object for AggregatorV3Interface contract
    AggregatorV3Interface internal priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }
    // writing a function to deposit to the contract
    function deposit(int256 _payment) public view returns (int256 quotient, int256 remainder) { // payable keyword is used to denote that the function takes money and you need to specify the value field in Remix or while using
  
        
        // First get the price of the ETH in terms of USD by calling getLatestPrice function
        (int256 price) = getLatestPrice();
        int256 quotient = _payment/price;
        
        int256 factor = 10**8;
        remainder = (_payment * factor / price) % factor;
        result;


        // ---------------------------------------------- require function in Solidity ----------------------------------
        // In order to request user to send some minimum amount of ETH to this smart contract then you can setup a conditon
        // require(msg.value >= 1e16); // Here e18 represents exponent to 18 which boils down to 1 ETH
        // Here msg is a global variable and it contains all the data of the transaction like, to, from, value, gas, gas limit and etc.......

        // ----------------------------------------------  Revert ----------------------------------------------------------
        // If the user fails to send this amount to the smart contract then the smart contract will revert back the function.
        // WHich means the function will execute till the line the error occurs and the gas will be used to execute these lines before the error.
        // The lines after the error will not be executed and the gas which must have been used by the upcoming lines will be given back to the user and the 
        // changed values will be reverted back to the original state.

        
        // ------------------------------------------------ Oracle --------------------------------------------------------
        // If you also want to check the value of ETH in terms of USD.
        // You need to link an oracle to this smart contract which will fetch data from the offchain and can use this data in the smart contract.

        // The blockchains are deterministic in nature which means they can't talk with outside world and need some sort of help to talk with outside world
        // Oracles come into play. They help blockchains talk with the outside world and also create events for the blockchains.

        // Oracles are also a type of decentralized network where each and every node in the oracle fetches data from different sources which are outside the world
        // Then they collect this data and send it to blockchain for usage. 

    }

    // writing a function to withdraw from the contract
    function withdraw() public {

        // To withdraw from the contract you need to specify which wallet has deposited and how much value has been deposited by the wallet
        // You can check that by using message attributes.


    }
}

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Rinkeby
     * Aggregator: ETH/USD
     * Address: 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
     */
    constructor() {
        priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }
}
