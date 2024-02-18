// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";


contract MintBasicNft is Script {
    string public constant PUG = "ipfs://Qmeb1XTxKTN2wprxcGe4VLA7ve2q6uvbjjaCp2Hg6G5Vis";

    function run() external {
        // the devops doesn't really work
        // address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        address MOST_RECENTLY_DEPLOYED = 0x029858839b2B2530E3f2AE516B91245EdeF1DE67;
        
        mintNftOnContract(MOST_RECENTLY_DEPLOYED);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}


contract MintMoodNft is Script {
    function run() external {
        // Change those as needed
        address MOST_RECENTLY_DEPLOYED = 0x5FbDB2315678afecb367f032d93F642f64180aa3;

        mintNftOnContract(MOST_RECENTLY_DEPLOYED);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}


contract FlipMoodNft is Script {
    function run() external {
        // Change those as needed
        address MOST_RECENTLY_DEPLOYED = 0x5FbDB2315678afecb367f032d93F642f64180aa3;
        uint256 TOKEN_ID = 0;
        
        flipMoodNftOnContract(MOST_RECENTLY_DEPLOYED, TOKEN_ID);
    }

    function flipMoodNftOnContract(address contractAddress, uint256 tokenId) public {
        vm.startBroadcast();
        MoodNft(contractAddress).flipMood(tokenId);
        vm.stopBroadcast();
    }
}