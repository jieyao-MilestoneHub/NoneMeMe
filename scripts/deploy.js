const { ethers, upgrades } = require("hardhat");

async function main() {
  const initialSupply = 1000000;
  const initialDream = "In the vast void, your dream is all that matters.";

  console.log("🚀 Starting deployment...");

  try {
    // Load the contract factory
    const NoneMeMe = await ethers.getContractFactory("NoneMeMe");
    console.log("✅ Contract factory loaded.");

    // Deploy the proxy contract (no need for manual .deployed())
    const proxy = await upgrades.deployProxy(NoneMeMe, [initialSupply, initialDream], {
      initializer: "initialize",
    });

    console.log("🎉 NoneMeMe (proxy) deployed at address:", proxy.address);

  } catch (error) {
    console.error("❌ Deployment failed:", error);
    process.exitCode = 1;
  }
}

main();
