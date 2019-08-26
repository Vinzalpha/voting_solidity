pragma solidity >=0.5.0 <0.7.0;

contract Voting {
    address administrateur;
    constructor() public {
        administrateur = msg.sender;
    }

    // Modeliser un candidat

    struct Candidat {
        uint candidatNumero;
        string nom;
        uint nombreDeVote;
    }

    mapping(uint => Candidat) candidats;
    mapping(address => bool) public electeurs;

    uint public nombreDeCandidat;

    // Ajouter un Candidat
    
    // Initialiser les élections
    function Election() public {
        ajouterCandidat("Candidat 1");
        ajouterCandidat("Candidat 2");
    }

    function ajouterCandidat(string memory _nom) public {
        require(administrateur == msg.sender);
        nombreDeCandidat++;
        Candidat memory unCandidat = Candidat(nombreDeCandidat, _nom, 0);
        candidats[nombreDeCandidat] = unCandidat;
    }

    

    // Rechercher un Candidat (enlever le nombre de Vote)

    function rechercherCandidat(uint _candidatNumero) public view returns(string memory, uint) {
        return(candidats[_candidatNumero].nom, candidats[_candidatNumero].nombreDeVote);
    } 

    // Voter
    function voter(uint _candidatNumero) public {
        require(!electeurs[msg.sender]);
        require(_candidatNumero > 0 && _candidatNumero <= nombreDeCandidat);
        electeurs[msg.sender] = true;
        candidats[_candidatNumero].nombreDeVote++;
    }

}