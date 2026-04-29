// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Voting.sol";

contract VotingTest is Test {
    Voting voting;

    function setUp() public {
        voting = new Voting();
        voting.addCandidate("Alice");
    }

    function testAddCandidate() public {
        assertEq(voting.candidatesCount(), 1);
    }

    function testVoting() public {
        voting.vote(1);
        assertTrue(voting.hasVoted(address(this)));
    }
}