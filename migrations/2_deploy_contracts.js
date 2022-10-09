var Voting = artifacts.require("./Voting.sol");

modulke.exports = function(deployer) {
    deployer.deploy(Voting);
}
