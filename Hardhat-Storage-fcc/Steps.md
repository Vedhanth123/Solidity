# Sample Hardhat Project

Step 1: Download hardhat using npm 
``` shell
npm install --save-dev hardhat
```

Step 2: set up hardhat.
```shell
npx hardhat
```

Step 3: Hardhat project will be created

1) scripts -> for storing all the scripts for running and using a project 
2) contracts -> for storing all the solidity files 
3) cache [after compiling the contracts] -> storing the compilation details of the contracts
4) artifacts [after compiling the contracts] -> storing the compilation details of the contracts
5) hardhat-confit.js file -> changing and creating new settings in hardhat for this project
6) test -> stores all the files necessary for testing
7) node_modules -> stores all the node modules required to run a project successfully 

Step 3: copy private key from Metamask

Step 4: create .env file in the project folder
```bash
touch .env #for linux
```
```powershell
New-Item .env #for windows
```

Step 5: Store private key into .env file

Step 6: Complete the deploy.js file in scripts and also configure the hardhat-config.js file as your needs of the projects are.

Step 7: Run hardhat
```shell
npx hardhat run .\scripts\deploy.js --network <network-name>
```

Steps 8: You can create custom tasks in .\tasks folder
