// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SellAppartments {
    
    /// State variables ///
    struct Appartment {

        uint256 id;
        address owner;
        string city;
        uint256 price;
        bool isSell;
    }

    uint countAppart = 0;
    mapping (uint => Appartment) public appartments;
    /// Events ///

    /// Modifiers ///

   

    /// Mutable functions ///
    function addAppart(string memory _city, uint256 _price) public {
        Appartment memory newAppartment = Appartment({
            id:    countAppart + 1,
            owner: msg.sender,
            city: _city,
            price: _price,
            isSell : false
        });

        appartments[countAppart] = newAppartment; 

        countAppart++;
    }

    function buyAppartment(uint appartId) public payable {

        // Get the current owner before selling
        address payable seller =  payable (appartments[appartId].owner);

        // Check if Seller != Client
        require(seller != msg.sender, "You can't buy your own product");

        // Check if apprtID exist
        require(appartId <= countAppart, "This appartment is not exist");
     
        //Check if appartment is available
        require(appartments[appartId].isSell == false, "This appartment is already selled");

        // Get price of appartment
        uint _amount = appartments[appartId].price;

        // Check if the amount of client is enough 
        require(msg.value >= _amount, "Not much money");

        // Transfer money to Seller
        seller.transfer(msg.value);

        // Update the new owner of appartment
        appartments[appartId].owner = msg.sender;
        appartments[appartId].isSell = true;
        
        // Event

    }


}
