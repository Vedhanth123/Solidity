# Steps for deploying FundMe contract

Aim:

1) Deploy FundMe contract
2) FundMe contract must be able to deploy to many testnets
3) FundMe contract uses chainlink smart contracts
4) We provide chainlink contract addresses to deploy scripts which help us to deploy to many testnets
5) We then create a mock contract which helps us to provide the price of Eth to localhost also
6) We then make some minor changes to the smart contract

Step 1: Copy your FundMe contract from github or your own remix code

Step 2: Your FundMe contract uses Chainlink oracle and the code to that oracle is stored on github/npm so you need to download that npm module and import it into your code.

Step 3: Install hardhat-deploy package which helps us in easier deployment of our code
```shell
yarn add --dev hardhat-deploy
```

Step 4: Create a new folder named ".\deploy"
```powershell
mkdir deploy
```

Step 5: Install "hardhat-deploy-ethers". This is basically our ethers.js package but for hardhat-deploy
```powershell
yarn add --dev @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers
```
This overrides the basic ethers package with hardhat-deploy-ethers which is very helpful in deploying our smartcontracts very easily.

Step 6: Create a new file named "helper-hardhat-config.js". This file basically helps hardhat to configure things.

Step 7: Create another folder called mock in contracts folder and save your mock contracts in it

Step 8: Create deploy scripts for deploying mocks and for deploying smart contracts on to the testnet 

Step 9: Create utils folder to store utility scripts like verify etc...

