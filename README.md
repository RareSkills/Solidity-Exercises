# Solidity Exercises

This is a set of exercises created by [RareSkills](https://www.rareskills.io) so you can learn Solidity by doing bite-sized exercises.

## Installation

Install foundry

```
curl -L https://foundry.paradigm.xyz | bash
```

Clone this repository

```
git clone https://github.com/rareSkills/solidity-exercises.git
```

Complete the exercises in order and test with

```
cd <Problem Name>
forge test -vvv
```

for example, open `src/1_Add` and change the code so it compiles. The solution is

```solidity
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
```

Save your changes, then test it with

```
forge test -vvv
```
