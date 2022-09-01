// In this script we will be writing code to deploy mock chainlink contracts so that we can get ETH/USD data despite we are not using a testnet

const { network } = require("hardhat");
const {
	developmentNetworks,
	DECIMALS,
	INITIAL_AMOUNT,
} = require("../helper-hardhat-config");

module.exports = async ({ getNamedAccounts, deployments }) => {
	// we then extract deploy, log functions from deployments
	const { deploy, log } = deployments;
	// we then extract our deployer address from getNamedAccounts function
	const { deployer } = await getNamedAccounts();

	// now we need to deploy our mock contract but only if we are working on localhost or hardhat environmnet
	if (developmentNetworks.includes(network.name)) {
		log("Local network detected! Deploying mocks...");
		await deploy("MockV3Aggregator", {
			contract: "MockV3Aggregator",
			log: true,
			from: deployer,
			args: [DECIMALS, INITIAL_AMOUNT],
		});
		log("Mocks deployed!");
		log(
			"-------------------------------------------------------------------------"
		);
	}
};

module.exports.tags = ["all", "mocks"];
