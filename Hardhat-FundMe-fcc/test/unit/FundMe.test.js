const { ethers } = require("hardhat");
const { getNamedAccounts } = require("hardhat");
const {
	isCallTrace,
} = require("hardhat/internal/hardhat-network/stack-traces/message-trace");
const { assert } = require("chai");
/**
 * @abstract: This file is used to test smart contracts in a local environment
 */

/**
 * This function is used for whole of the smart contract
 */
describe("FundMe", async function() {
	// Variable to store FundMe contract, deployer, MockV3Aggregator
	let FundMe;
	let deployer;
	let MockV3Aggregator;
	/**
	 * beforeEach is basically used to initialize the smart contract and taking into consideration of things which are needed for smart contract to run
	 */
	beforeEach(async function() {
		deployer = (await getNamedAccounts()).deployer;
		await deployments.fixture(["all"]);
		// Fetching FundMe and MockV3Aggregrator from the deployments folder
		FundMe = await ethers.getContract("FundMe", deployer);
		MockV3Aggregator = await ethers.getContract("MockV3Aggregator", deployer);
	});

	/**
	 * This function is used to test constructor
	 */
	describe("constructor", async function() {
		/**
		 * it here is a test to the contract.
		 * This is used to check whether the constructor sets the Chainlink oracle's address correctly or not.
		 * @Note :This is possible only when the contract address stored is public
		 *
		 */
		it("sets the aggregator addresses correctly", async function() {
			// getting contract address from the deployed FundMe contract
			const response = await FundMe.contractInstance();
			// Checking whether the Chainlink oracle's contract address stored in the constructor is equal to actual contract address
			assert.equal(response, MockV3Aggregator.address);
		});
	});
});
