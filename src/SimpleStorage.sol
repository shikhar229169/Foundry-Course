// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 private num;

    struct Pokemon {
        string name;
        uint256 rank;
    }

    Pokemon[] public pokemon;

    mapping (string => uint256) public pokemonToRank;

    function setNum(uint256 newNum) public {
        num = newNum;
    }

    function getNum() public view returns (uint256) {
        return num;
    }

    function addPokemon(string memory name, uint256 rank) public {
        require(rank != 0, "Rank should start from 1");
        require(pokemonToRank[name] == 0, "Already exist");

        pokemon.push(Pokemon(name, rank));
        pokemonToRank[name] = rank;
    }
}
