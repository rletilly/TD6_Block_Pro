const Migrations = artifacts.require("Migrations");
const Moncontrat = artifacts.require("OurContract")
module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Moncontrat);
};
