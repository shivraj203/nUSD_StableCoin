const nUSDStablecoin = artifacts.require("nUSDStablecoin");

module.exports = function (deployer) {
  const priceFeedAddress = "0x694AA1769357215DE4FAC081bf1f309aDC325306"; // Replace with the actual Chainlink price feed address

  deployer.deploy(nUSDStablecoin, priceFeedAddress).then(async () => {
    const deployedContract = await nUSDStablecoin.deployed();
    console.log("Contract address:", deployedContract.address);
  });
};
