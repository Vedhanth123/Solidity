const networkConfig = {
	4: {
		name: "rinkeby",
		ethUsdPriceFeedAddress: "",
	},
	5: {
		name: "goerli",
		ethUsdPriceFeedAddress: "0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e",
	},
	80001: {
		name: "mumbai-testnet",
		ethUsdPriceFeedAddress: "0x0715A7794a1dc8e42615F059dD6e406A6594651A",
	},
};

developmentNetworks = ["localhost", "hardhat"];
const DECIMALS = 8;
const INITIAL_AMOUNT = 200000000000;

module.exports = {
	networkConfig,
	developmentNetworks,
	DECIMALS,
	INITIAL_AMOUNT,
};
