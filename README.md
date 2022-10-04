# SimpleVotingSystem
This is Exercise 12 from MI4 in Kingsland Universities Blockchain Developer Program.

# Goals
You will build a voting application where you will initialize a set of candidates who will be contesting in the election
and then vote for the candidates. The votes will be stored on the blockchain. You will go through the process of
implementing the voting contract, deploying to the local test blockchain, and interacting with the contract methods.

# Prerequisites

• NodeJS v16.15.0: https://nodejs.org/en/ <br>
• Ganache CLI v6.12.2 <br>
• Truffle v5.4.15 <br>
• Solc v0.8.13 <br>
• Web3 v3.0.0-rc.5 <br>
• Windows Build Tools <br>

          npm install --global --production windows-build-tools
          
# Problem 1. Create the Smart Contract

1. Create a new folder named “Voting System”.
a. Open your command prompt and go in the folder. We will now refer to this as your workspace.

2. In your workspace, initialize a truffle and node project:
                    
                    truffle init
                    npm init
                
3. 3. Install solc and web3 on your workspace.

                    npm install solc@0.8.13
                    npm install web3@3.0.0-rc.5
                    
4. 4. Create a new contract called Voting.sol and put it in the contracts/ folder. <br>
a. Implement a public field, which will keep track of each candidate’s votes. <br>
b. Implement a public array to store every candidate. <br>
c. Implement an addCandidate(string) function, which adds the candidate to an array. <br>
d. Implement a validCandidate(string) function, which checks whether the given candidate is contained in <br>
the array. <br>
e. Implement a voteForCandidate(string) function, which votes for a given candidate. <br>
f. Implement a totalVotesFor(string) function, which returns the count of votes for a candidate. <br>
g. To be able to compare strings we can first hash them with keccak256() and compare their hashes. <br>
