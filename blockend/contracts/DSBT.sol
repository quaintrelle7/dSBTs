//SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 <0.9.0;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";
/*
Can't Be Evil license from a16z https://a16zcrypto.com/wp-content/uploads/2022/08/Cant-Be-Evil-Licenses.pdf
License Version CBE-CC0 https://7q7win2vvm2wnqvltzauqamrnuyhq3jn57yqad2nrgau4fe3l5ya.arweave.net/_D9kN1WrNWbCq55BSAGRbTB4bS3v8QAPTYmBThSbX3A/0
*/
import {LicenseVersion, CantBeEvil} from "../node_modules/@a16z/contracts/licenses/CantBeEvil.sol";

contract DSBT is ERC721, ERC721URIStorage, Ownable, CantBeEvil(LicenseVersion.CBE_CC0) {

    using Counters for Counters.Counter;
    Counters.Counter public _tokenIdCounter;

    address public admin;

    constructor() ERC721("CourseSBT", "CSBT") {
        admin = msg.sender;
    }

//event to keep track of minted SBTs
    event SBTMinted(address indexed USER, uint256 indexed TOKENID, string indexed URI);

//mapping of user address to tokenID and tokenID to hash
    mapping(address => uint256) internal userToTokenId;

//safeMint to mint tokens by owner of the contract to users
    function safeMint(address to, string memory uri) public onlyOwner {
        require(balanceOf(to) == 0, "Already Minted to Address!");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        userToTokenId[to] = tokenId;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        emit SBTMinted(to, tokenId, uri);
    }

//updateURI function to update metadata of SBT
    function updateURI(uint256 tokenId, string memory updatedURI) public returns (string memory) {
        //add conditions to verify
        _setTokenURI(tokenId, updatedURI);
        return updatedURI;
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory){
        return super.tokenURI(tokenId);
    }

//revoke function that burns the token
    function burn(address user, uint256 tokenId) public onlyOwner{
        require(balanceOf(user) == 1, "User Don't Exists!");
        _burn(tokenId);
        delete userToTokenId[user];
    }

// The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

//supportsInterface as two or more base classes define function with same name and parameter types.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, CantBeEvil)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

}