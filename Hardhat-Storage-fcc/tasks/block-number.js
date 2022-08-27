// this file is used to get the current block number of whatever blockchain we are working with

// import the tasks function
const { task } = require("hardhat/config");

// constructor which takes task name and desscription of the task
task("block-number", "Prints the current block number").setAction(
	// The above line is similar to
	// const blockTask = async function() => {}
	// async function blockTask() {}
	async (taskArgs, hre) => {
		// getting block number from hardhat.ethers
		const blockNumber = await hre.ethers.provider.blockNumber;
		console.log(`Block Number: ${blockNumber}`);
	}
);
