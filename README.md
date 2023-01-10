****Decentralized-Voting-System****

This repository contains the Solidity smart contract for a decentralized voting system on the Ethereum blockchain. The contract allows for community members to vote on proposals, manage voters and check the results of the vote.

***Features***

1.Manage voters and give them the right to vote

2.Community members can vote on proposals.

3.Transparent and decentralized decision making with the help of smart contracts

4.Check the winning proposal and number of votes

***contract methods***

giveRightToVote(address voter) : This function can only be called by the chairperson, it gives right to vote to the address passed as a parameter.

vote(uint proposal): To vote for a specific proposal.

getProposals() : Get all proposals available for voting.

winnerName() : gives the name of the winning proposal and number of votes.
