const { ethers } = require("hardhat");

async function main() {
  /*
  A contract in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistedContract here is a factory for instances of our Whitelist contract 
  */

const whitelistContract = await ethers.getContractFactory("Whitelist");

// here we deploy the contract 
const deployedWhitelistContract = await whitelistContract.deploy(10);
// 10 is the max number of whitelisted wallets allowed

//wait for it to finish deploying 
await deployedWhitelistContract.deployed();

//print the address of the deployed contract 
console.log("whitelist contract address:", deployedWhitelistContract.address);

}

main() 
.then(() => process.exit(0))
.catch((error) => {
console.error(error);
process.exit(1);
})
