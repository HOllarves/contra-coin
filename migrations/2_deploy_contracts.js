const ContraCoin = artifacts.require("ContraCoin");

module.exports = function (deployer) {
  deployer.deploy(ContraCoin);
};
