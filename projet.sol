// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendeurAppartements {
    
    struct Appartement {
        uint256 id;
        string adresse;
        uint256 prix;
        
    }
    
    struct Vendeur {
        address adresseVendeur;
        Appartement[] appartements;
    }
    
    mapping (address => Vendeur) vendeurs;
    
    function ajouterAppartement(string memory _adresse, uint256 _prix) public {

        Appartement memory nouvelAppartement = Appartement({

            id:    vendeurs[msg.sender].appartements.length + 1,
            adresse: _adresse,
            prix: _prix

        });
        vendeurs[msg.sender].appartements.push(nouvelAppartement);
    }
    
    //Liste des appartements du vendeur
    function getAppartementsDuVendeur() public view returns (Appartement[] memory) {
        return vendeurs[msg.sender].appartements;
    }

    // Achat d'un appartement :  client 
    
    // Liste des appartements vendus pour un vendeur

    
}






// Des vendeurs qui mettront leurs biens en vente
//Ils doivent mettre la description de leur biens.

// Les acheteurs qui selectionne un bien puis l'achète.

// Les biens vont être stockés dans une structure.

// la fonction pour trensférer le bien _to

// la fonction pour spécifier le propriétaire du bien _by.