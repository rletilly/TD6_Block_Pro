pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
import "./Context.sol";
import "./IERC721.sol";
import "./IERC721Receiver.sol";
import "./SafeMath.sol";
import "./Address.sol";
import "./Counters.sol";
import "./ERC165.sol";
import "./ERC721.sol";
contract OurContract is ERC721
{
    struct waterdoggos
    {
        uint age;
        string name;
        uint under_water_time;
        bool friendly;
        bool gender;
    }
    address Bigboss;
    address ERC721ad;
    //Mapping form owner address to bool 
    mapping(address => bool) private _Breeder;
    mapping(address => waterdoggos) Yourdoggo;
    constructor () public {
        Bigboss = msg.sender;
    }
    function setERC721ad(address erc) public
    {
        require(msg.sender == Bigboss);
        ERC721ad = erc;
    }
    //We'll put most of our work here in this part of the contract 
    function registerBreeder(address newOwner, uint tokenID) public{
        require(Bigboss == msg.sender);
        _Breeder[newOwner] = true;
        ERC721(ERC721ad).ownerOf(tokenID);
        ERC721(ERC721ad)._safeMint(newOwner, tokenID);
    }

    //Let's create our animal type 
    function declareAnimal (address owner, uint _age, string memory _name, uint _time,bool cool, bool _gender) public{
        require(Bigboss==msg.sender);
        //waterdoggos memory age = _age;
        waterdoggos memory yourdoggo = waterdoggos({
            age : _age,
            name : _name,
            under_water_time : _time,
            friendly : cool,
            gender : _gender
        }
        );
        require(_Breeder[owner]==true);
        Yourdoggo[owner] = yourdoggo;
    }

    //What if one of them died ?
    function deadAnimal(address owner, waterdoggos memory doggo, uint tokenID) public 
    {
        require(msg.sender == owner);
        require(doggo.age>15);
        ERC721(ERC721ad)._burn(tokenID);
    }

}