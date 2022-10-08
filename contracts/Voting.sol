//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Voting {

    mapping (bytes32 => uint8) public votesReceived; // this will keep track of each candidates votes

    string[] public candidateList; //this array will store the list of candidates
    
     function addCandidate(string memory candidateNames) public {
       //this method will add candidates to the array
       candidateList.push(candidateNames);
    }
    
     function validCandidate(string memory candidate) public view returns (bool) {
        //this method checks whether the given candidate is contained in the array
        for(uint i = 0; i < candidateList.length; i++) {
         if (keccak256(bytes (candidateList[i])) == keccak256(bytes (candidate))) {
                return true;
            }
        }
    }
    
     function voteForCandidate(string memory candidate) public {
        //this method votes for a given candidate
        require(validCandidate(candidate), "Must be valid candidate");
        votesReceived[keccak256(bytes (candidate))] += 1;
    }
}
