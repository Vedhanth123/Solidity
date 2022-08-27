require("dotenv").config();
require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require("@nomiclabs/hardhat-etherscan");
require("solidity-coverage");
require(".\\tasks\\block-number");

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more
/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const GOERLI_RPC_URL =
	"https://eth-goerli.g.alchemy.com/v2/zg9VoSKAXvvBs7eMj58t9KmL1BKt9k1o";
const PRIVATE_KEY =
	"418d6b508ff8edbfd088ce53d1102b0f14225a59f3af9a7741ad20425f900d24";
const ETHERSCAN_API_KEY = "23API9JW6MHWKTCIJ73ZC1D94EEPBAG526";

module.exports = {
	defaultNetwork: "hardhat",
	networks: {
		hardhat: {},
		goerli: {
			url: GOERLI_RPC_URL,
			accounts: [PRIVATE_KEY],
			chainId: 5,
		},
		localhost: {
			url: "http://localhost:8545",
			chainId: 31337,
		},
	},
	solidity: "0.8.8",
	etherscan: {
		apiKey: ETHERSCAN_API_KEY,
	},
};
