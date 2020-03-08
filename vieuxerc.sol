pragma solidity ^0.4.18;

contract ERC721 {
    // Mapping from token ID to owner
    /* erc721 est un token qui regroupe une liste d'addresses chaque token est un animal relié à une address, chaque token a un ID*/

    mapping (uint256 => address) private _tokenOwner;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private _tokenApprovals;

    // Mapping from owner to number of owned token
    mapping (address => Counters.Counter) private _ownedTokensCount;

    // Mapping from owner to operator approvals
    mapping (address => mapping (address => bool)) private _operatorApprovals;
    // Required methods

    function totalSupply() public view returns (uint256 total);
    function balanceOf(address _owner) public view returns (uint256 balance)
    {
        require(_owner == msg.sender);
        return _ownedTokensCount[_owner];
    }
    function ownerOf(uint256 _tokenId) external view returns (address owner)
    {
        address owner = _tokenOwner[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");
        return owner;
    }
    function approve(address _to, uint256 _tokenId) external
    {
        address owner = ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");
        require(_msgSender() == owner || isApprovedForAll(owner, _msgSender()), "ERC721: approve caller is not owner nor approved for all");
        _approve(to, tokenId);
    }
    function transfer(address _to, uint256 _tokenId) external
    {
        require(_tokenOwner[_tokenId]==msg.sender);
        _tokenOwner[_tokenId] = _to;
        _ownedTokensCount[msg.sender] -=1;
        _ownedTokensCount[_to] +=1;
        emit Transfer(msg.sender, to, value);
    }
    function transferFrom(address _from, address _to, uint256 _tokenId) external
    {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
        _transferFrom(from, to, tokenId);
    }


    function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        return _operatorApprovals[owner][operator];
    }
    function _exists(uint256 tokenId) internal view returns (bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }
    function _approve(address to, uint256 tokenId) private {
        _tokenApprovals[tokenId] = to;
        emit Approval(ownerOf(tokenId), to, tokenId);
    }
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        address owner = ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
    }


    // Events
    event Transfer(address from, address to, uint256 tokenId);
    event Approval(address owner, address approved, uint256 tokenId);

    // Optional
    // function name() public view returns (string name);
    // function symbol() public view returns (string symbol);
    // function tokensOfOwner(address _owner) external view returns (uint256[] tokenIds);
    // function tokenMetadata(uint256 _tokenId, string _preferredTransport) public view returns (string infoUrl);

}