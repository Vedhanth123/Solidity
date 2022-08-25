// imports
const { ethers, run, network } = require("hardhat");

// async main
async function main() {
	// importing contract details from artifacts
	const SimpleStorageFactory = await ethers.getContractFactory("Storage");

	// deploying the contract
	console.log("Deploying contract...");
	const simpleStorage = await SimpleStorageFactory.deploy();
	await simpleStorage.deployed();
	console.log(`Deployed contract to: ${simpleStorage.address}`);

	// Checking if the contract deployed to is on testnet or not
	if (network.config.chainId === 5 && process.env.ETHERSCAN_API_KEY) {
		console.log("Waiting for block confirmations...");
		await simpleStorage.deployTransaction.wait(6);

		// calling verify function in this script
		await verify(simpleStorage.address, []);
	}

	// interacting with the contract
	const currentValue = await simpleStorage.retrieve();
	console.log(`Current Value is: ${currentValue}`);

	// Update the current value
	const transactionResponse = await simpleStorage.store(7);
	await transactionResponse.wait(1);
	const updatedValue = await simpleStorage.retrieve();
	console.log(`Updated Value is: ${updatedValue}`);
}

// verify function is used to verify the contract immediately the contract is deployed to the chain
// async function verify(contractAddress, args) {
const verify = async (contractAddress, args) => {
	console.log("Verifying contract...");

	// Run function is used to run hardhat function from hardhat repository
	try {
		await run("verify:verify", {
			address: contractAddress,
			constructorArguments: args,
		});
	} catch (e) {
		if (e.message.toLowerCase().includes("already verified")) {
			console.log("Already Verified!");
		} else {
			console.log(e);
		}
	}
};

// main
main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error);
		process.exit(1);
	});
