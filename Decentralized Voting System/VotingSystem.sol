//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;
pragma experimental ABIEncoderV2;
contract Ballot {
    struct Voter {
        string name;
        uint weight; 
        bool voted;   
    }
    struct Proposal {
        string name;  
        uint voteCount; 
    }
    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[]  proposals;

    constructor(string[] memory proposalNames) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }
    function giveRightToVote(address voter) external {
        require(
            msg.sender == chairperson,
            "Only chairperson can give right to vote."
        );
        require(
            !voters[voter].voted,
            "The voter already voted."
        );
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }

    function vote(uint proposal) external {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        sender.voted = true;

        proposals[proposal].voteCount += sender.weight;
    }
    function getProposals() public view returns (Proposal[] memory) {
    return proposals;
     }
    function winningProposal() private view
            returns (uint winningProposal_)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }
    function winnerName() external view
            returns (string memory winnerName_ ,uint winnerVoteCount_)
    { 
        
        winnerVoteCount_=proposals[winningProposal()].voteCount;
        require(winnerVoteCount_!=0,"Voting not started Yet..!");
        winnerName_ = proposals[winningProposal()].name;
    }
}