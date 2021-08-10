const swapperArtifact = artifacts.require("Swapper");
const tokenAArtifact = artifacts.require("TokenA");
const tokenBArtifact = artifacts.require("TokenB");

module.exports = function (deployer) {
  deployer.deploy(swapperArtifact);
  deployer.deploy(tokenAArtifact);
  deployer.deploy(tokenBArtifact);
};