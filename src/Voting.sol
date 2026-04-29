// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Security: Using OpenZeppelin's standard for access control
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Voting is Ownable {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    uint256 public candidatesCount;

    // Set the deployer as the initial owner
    constructor() Ownable(msg.sender) {}

    function addCandidate(string memory _name) public onlyOwner {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        require(!hasVoted[msg.sender], "You already voted.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate.");

        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;
    }
}