const { ethers } = require("hardhat");

/**
 * Example deployment script for the SimpleVault.
 * Assumes an underlying ERC-20 token is already deployed.
 */
async function main() {
  const [deployer] = await ethers.getSigners();
  const underlyingAssetAddress = "0x..."; // Address of the token to be deposited

  console.log("Deploying Vault with account:", deployer.address);

  const SimpleVault = await ethers.getContractFactory("SimpleVault");
  const vault = await SimpleVault.deploy(
    underlyingAssetAddress,
    "Yield Bearing USDC",
    "yUSDC"
  );

  await vault.waitForDeployment();

  console.log("Vault deployed to:", await vault.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
