// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

/*
Build two ERC20 contracts: RareCoin and SkillsCoin (you can change the name if you like).
Anyone can mint SkillsCoin, but the only way to obtain RareCoin is to send SkillsCoin to the RareCoin contract.
You'll need to remove the restriction that only the owner can mint SkillsCoin.

Here is the workflow:
- mint() SkillsCoin to yourself
- SkillsCoin.approve(address rareCoinAddress, uint256 yourBalanceOfSkillsCoin) RareCoin to take coins from you.
- RareCoin.trade() This will cause RareCoin to SkillsCoin.transferFrom(address you, address RareCoin, uint256 yourBalanceOfSkillsCoin) Remember, RareCoin can known its own address with address(this)
- RareCoin.balanceOf(address you) should return the amount of coin you originally minted for SkillsCoin.

Remember ERC20 tokens(aka contract) can own other ERC20 tokens. So when you call RareCoin.trade(), it should call SkillsCoin.transferFrom and transfer your SkillsCoin to itself, I.e. address(this).
*/

contract SkillsCoin {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol) {
        // your code here
    }

    function mint(address to, uint256 amount) public {
        // your code here
    }

    function transfer(address to, uint256 amount) private returns (bool) {
        // your code here
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        // your code here
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        // your code here
    }
}

contract RareCoin {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol, address _skillsCoin) {
        // your code here
    }

    function transfer(address to, uint256 amount) private returns (bool) {
        // your code here
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        // your code here
    }

    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        // your code here
    }

    function trade(uint256 amount) public {
        // some code
        // you can pass the address of the deployed SkillsCoin contract as a parameter to the constructor of the RareCoin contract as 'source'
        // (bool ok, bytes memory result) = source.call(abi.encodeWithSignature("transferFrom(address,address,uint256)", msg.sender, address(this), amount));
        // this will fail if there is insufficient approval or balance
        // require(ok, "call failed");
        // more code
    }
}
