const swapperArtifact = artifacts.require("Swapper");

module.exports = function (deployer) {
  deployer.deploy(swapperArtifact);
};