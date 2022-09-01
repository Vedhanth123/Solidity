// ----------------------------------------- documentation ------------------------------------------------

const { networks } = require("../hardhat.config");

// We don't need to have main function as hardhat-deploy package won't run main functions running in this file

// we need to export whatever functions we are trying to run
// so in order to run a function we need to write like below example
/**
 * module.exports.default = <function>
 *              or
 * module.exports = async (hre) => {
 *     const { getNamedAccounts, deployments } = hre
 * } // => is nothing but arrow functions in javascript which are familiar to lambda functions in python
 *              or
 * module.exports = asynt ({getNamedAccounts, deployments}) => {
 *     ....
 *     ....
 * }
 */

// --------------------------------------- main code ----------------------------------------------------

const { networkConfig } = require("../helper-hardhat-config");
const { network } = require("hardhat");
const { developmentNetworks } = require("../helper-hardhat-config.js");
const verify = require("../utils/verify");

module.exports = async ({ getNamedAccounts, deployments }) => {
	// we then extract deploy, log functions from deployments
	const { deploy, log } = deployments;
	// we then extract our deployer address from getNamedAccounts function
	const { deployer } = await getNamedAccounts();
	// We then extract our chainid from network.config.chainId
	const chainId = network.config.chainId;
	let contractAddress;
	// We then extract contractAddress which is present in that chainId
	// If we are in localhost or hardhat network then we can't get PriceFeedAddress
	if (developmentNetworks.includes(network.name)) {
		// deployments.get is used to get recently deployed contract
		const mockContract = await deployments.get("MockV3Aggregator");
		contractAddress = await mockContract.address;
	} else {
		contractAddress = await networkConfig[chainId]["ethUsdPriceFeedAddress"];
	}

	// When going for localhost or hardhat testing we need to mock Chainlink oracle so that we can still get the price of Eth

	// When we are going to change chains then we need to maintain different types of contract addresses as one address won't work for all the chains. THe best way to do that is to send the address of chainlink oracle to constructor so at the time of deploying the solidity code can interact with the proper contract and get proper results

	// We then deploy our contract
	const FundMe = await deploy("FundMe", {
		from: deployer,
		args: [contractAddress], // contractAddress,
		log: true,
	});
	log(
		"-------------------------------------------------------------------------------------------------"
	);

	// After deploying our contract we then verify our contract.
	// We will only verify our contract if this is deployed to a testnet or mainnet
	if (
		!developmentNetworks.includes(network.name) &&
		process.env.ETHERSCAN_API_KEY
	) {
		// We need to verify our contract.
		await verify(FundMe.address, [contractAddress]);
	}
};

module.exports.tags = ["all", "fundme"];
