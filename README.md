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


# Problem 2. Setup the Development Environment

1. Install ganache-cli:
Remember, you may need administrator permissions if errors occur.

                    npm install –g ganache-cli@6.12.2
                    
2. Run ganache-cli:
Do not close this terminal. Let it run in the background as we continue with other tasks.

                    ganache-cli
                    
3. On a new terminal in your workspace, run node.

# Problem 3 Compiling the Contract 

1. Require the web3 library:

                    Web3 = require('web3')
                    
2. Initialize the provider. You have to set the number of confirmations, timeout and defaultBlock:

                    const OPTIONS = {defaultBlock :"latest", transactionConfirmationBlocks: 1,
                    transactionBlockTimeout: 5}
                    
                    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"), null, OPTIONS)
                    
* Tip: If the console gets messy due to long outputs, press CTRL + L to clear the console.*

3. Retrieve and store all our available accounts. We can do that with web3.eth.getAccounts(). This returns a
promise, so what we are going to do is to store the data in an accounts array for easy access.

                    web3.eth.getAccounts().then(web3Accounts => {accounts = web3Accounts})
                    
                    accounts
                    
4. Read the contract and store it as a variable so we can have an easy access for later use:

                    code = fs.readFileSync('contracts/Voting.sol').toString()
                    
                    
5. Require solidity compiler (solc):

                    solc = require('solc')
                    
6. Compile the code. At this point, you would already have the bytecode, metadata, interface, and so on:

                    compiledCode = solc.compile(code)
                    
If you run into solc compiler issues,
Copy the code below (otherwise, disregard and continue):
                    
                    var solcInput = {
                    language: "Solidity",
                    sources: {
                    contract: {
                    content: code
                    }
                    },
                    settings: {
                    optimizer: {
                    enabled: true
                    },
                    evmVersion: "byzantium",
                    outputSelection: {
                    "*": {
                    "": ["legacyAST", "ast"],
                    "*": [
                    "abi",
                    "evm.bytecode.object",
                    "evm.bytecode.sourceMap",
                    "evm.deployedBytecode.object",
                    "evm.deployedBytecode.sourceMap",
                    "evm.gasEstimates"
                    ]
                    }
                    }
                    }
                    };
                    solcInput = JSON.stringify(solcInput);
                    compiledCode = solc.compile(solcInput);
                    
If you’re curious on what each property does, see the docs here:
https://solidity.readthedocs.io/en/v0.5.0/using-the-compiler.html#compiler-input-and-output-json-description

# Problem 4 Deploy the Contract 
Retrieve the abiDefinition in JSON format by calling the command:

                    abiDefinition = JSON.parse(compiledCode)['contracts']['contract']['Voting']['abi']
                    
                    

