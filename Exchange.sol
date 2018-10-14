pragma solidity ^0.4.25;

contract Exchange {
    
    //variables
    address buyer;
    uint priceOfItem;
    uint halfPriceOfItem;
    
    function Exchange(address _seller, address buyerAddress, uint finneyConversion) payable public{
        //Set the buyer
        buyer = msg.sender;
        buyer = buyerAddress;
        
        //Half the price of the item in finneys
        priceOfItem = finneyConversion;
        halfPriceOfItem = finneyConversion / 2;
        
        // Send 50% of priceOfItem to _seller
        _seller.transfer(halfPriceOfItem);
        
    }
    
    function send(address _escrow) payable {
    (address of escrow)= _escrow //Sends 50% of priceOfItem to escrow account 
    _escrow.send(msg.value);
    }
  
    //Sends an x number of ether
    function sendEth(address _seller, uint numFinney) payable public{
        // Sends the seller num finneys
        _seller.transfer(numFinney);
    }
    