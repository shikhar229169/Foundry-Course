// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeploySimpleStorage} from "../script/deploy-SimpleStorage.s.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract TestSimpleStorage is Test {
    SimpleStorage public simpleStorage;

    function setUp() external {
        DeploySimpleStorage deployScript = new DeploySimpleStorage();
        simpleStorage = deployScript.run();
    }

    function testSetAndGetNum() external {
        uint256 myNum = 229169;
        simpleStorage.setNum(myNum);
        assert(myNum == simpleStorage.getNum());
    }

    function testAddingPokemon() external {
        string memory name = "Pikachu";
        uint256 rank = 1;

        simpleStorage.addPokemon(name, rank);

        assert(rank == simpleStorage.pokemonToRank(name));
    }
}