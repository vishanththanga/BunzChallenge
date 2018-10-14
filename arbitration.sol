pragma solidity ^0.4.25;

contract Arbitration {
    //Arbitration contract acts as an escrow, if no action is taken then money is released to seller 
    
    //Variables
    address buyer;
    address seller; 
    address arbitrator1;
    address arbitrator2;
    address arbitrator3;
    
    uint priceOfItem;
    uint halfPriceOfItem;
    uint arbitrationFee; //15% of item value that both buyer and seller use 
    uint arbitratorStake; //10% of item amount for each arbitrator 
    bool checkClaimStatus; //If buyer 
    uint buyerCount;
    
    //variables used to accept Eth from buyer address
    address public owner;
    uint public bal;
    uint public price;
    mapping (address => uint) balance;

    function AcceptEth() {
        // set owner as the address of the one who created the contract
        owner = msg.sender;
        // set the price to 2 ether
        price = halfPriceOfItem;
    }

    //Accepts halfPriceOfItem from the buyer 
    function accept() payable returns(bool success) {
        // deducts ether from the one person who executed the contract
        balance[msg.sender] -= price;
        // sends ether to the owner of this contract
        balance[owner] += price;
        return true;
    }
}

    /*Checks if there were no disputes after 14 days, remaining money in escrow automatically sends to 
    seller */
    function noBuyerClaim (address _seller, uint start, uint daysAfter) public payable {
        
        if (now >= start + daysAfter * 14 days) {
            
            if (checkClaimStatus == 0) {
                _seller.transfer(halfPriceOfItem);
            }
            
            else {
                break
            }
    }
    
    //Checks if there was a dispute within 14 days, if there was then it enters the court
    function buyerClaim (address _buyer, address _seller, address _arbitrator1, address _arbitrator2, address _arbitrator3) {
        
        /* claim status will be opened and voters/arbitrators will send money to contract, 
        arbitrationFees will also be sent. */
        if (checkClaimStatus == 1) {
            balance[_buyer] -= arbitrationFee;
            balance[_seller] -= arbitrationFee;
            balance[_arbitrator1] -= arbitratorStake;
            balance[_arbitrator2] -= arbitratorStake;
            balance[_arbitrator3] -= arbitratorStake;
            function voteForCandidate(address _buyer, address _arbitrator) public {
                votesReceived[_buyer] += 1;
                record[_buyer].push(_arbitrator);
            }

            function validCandidate(address _buyer) view public  (bool) {
                for(uint i = 0; i < 4) {
                 if (candidateList[i] == _buyer) {
                    buyerCount += 1;
                }
            }
            return false;
         }
            }
            
    }
    
    function outcome(_buyerCount) {
        if (buyerCount = 4) {
            balance[_buyer] += halfPriceOfItem;
            balance[_arbitrator1] += arbitratorStake + arbitrationFee/3;
            balance[_arbitrator2] += arbitratorStake + arbitrationFee/3;
            balance[_arbitrator3] += arbitratorStake + arbitrationFee/3;
        else if  (buyerCount = 3) 
            balance[_buyer] += halfPriceOfItem;
            balance[_arbitrator1] += arbitratorStake + arbitrationFee;
            balance[_arbitrator2] += arbitratorStake + arbitrationFee/3;
            balance[_arbitrator3] += arbitratorStake - arbitrationFee/3;
        else if  (buyerCount = 2) 
            balance[_buyer] -= arbitrationFee;
            balance[_seller] += arbitrationFee + halfPriceOfItem;
            balance[_arbitrator1] += arbitratorStake + arbitrationFee;
            balance[_arbitrator2] += arbitratorStake + arbitrationFee/3;
            balance[_arbitrator3] += arbitratorStake - arbitrationFee/3;
        else if  (buyerCount = 1) 
            balance[_buyer] -= arbitrationFee;
            balance[_seller] += arbitrationFee + halfPriceOfItem;
            balance[_arbitrator1] += arbitratorStake + arbitrationFee/2;
            balance[_arbitrator2] += arbitratorStake + arbitrationFee/2;
            balance[_arbitrator3] -= arbitrationFee;

        } 

    }
    
}