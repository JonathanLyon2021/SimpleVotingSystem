//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Voting {

    mapping (bytes32 => uint8) public votesReceived; // this will keep track of each candidates votes

    string[] public candidateList; //this array will store the list of candidates

    function addCandidate(string memory candidateNames) public {
        //this method will add candidates to the array
        candidateList.push(candidateNames);
    }

    function voteForCandidate(string memory candidate) public {
        //this method votes for a given candidate
        require(validCandidate(candidate), "Must be valid candidate");
        votesReceived[keccak256(bytes (candidate))] += 1;
    }

    function totalVotesFor(string memory candidate) public view returns (uint8) {
        //this method returns the total votes a candidate has received so far
        require(validCandidate(candidate), "Must be valid candidate");
        return votesReceived[keccak256(bytes (candidate))];
    }

    function validCandidate(string memory candidate) public view returns (bool) {
        //this method checks whether the given candidate is contained in the array
        for(uint i = 0; i < candidateList.length; i++) {
            if (keccak256(bytes (candidateList[i])) == keccak256(bytes (candidate))) {
                return true;
            }
        }
        return false;
    }
}
