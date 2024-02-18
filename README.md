# Foundry NFT

We create 2 different kinds of NFTs.

1. An IPFS Hosted NFT (BasicNft.sol)
   - See it [here](https://testnets.opensea.io/assets/sepolia/0x029858839b2B2530E3f2AE516B91245EdeF1DE67/0)
   - Sepolia contract address: 0x029858839b2B2530E3f2AE516B91245EdeF1DE67
3. An SVG NFT (Hosted 100% on-chain) (MoodNft.sol)
   - See it [here](https://testnets.opensea.io/assets/sepolia/0xf4EAC916c50F25F26AFD94A6483DeC5c79e4BAc3/0)
   - Sepolia contract address: 0xf4EAC916c50F25F26AFD94A6483DeC5c79e4BAc3


# Getting Started

## Requirements

- git
- foundry


## Quickstart

```
git clone https://github.com/Cyfrin/foundry-nft-f23
cd foundry-nft-f23
forge install
forge build
```


# Usage

## Start a local node

```
make anvil
```

## Deploy

This will default to your local node. You need to have it running in another terminal in order for it to deploy.

```
make deploy
```

## Deploy - Other Network

[See below](#deployment-to-a-testnet-or-mainnet)

## Testing

There are 4 test tiers. 

1. Unit
2. Integration
3. Forked
4. Staging

In this repo we cover #1 and #3. 

```
forge test
```

or 

```
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test Coverage

```
forge coverage
```


# Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

2. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some tesnet ETH. You should see the ETH show up in your metamask.

3. Deploy (IPFS NFT)

```
make deploy ARGS="--network sepolia"
```

4. Deploy (SVG NFT)

```
make deployMood ARGS="--network sepolia"
```

5. After deploying make take a note of the contract address so you can use it with cast or in Interactions.s.sol file.


## Scripts

After deploying to a testnet or local net, you can run the scripts. 

Using cast deployed locally example: 

```
cast send <MoodNft_CONTRACT_ADDRESS> "mintNft()" --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL
```

or, to mint an NFT on sepolia:

```
make mint ARGS="--network sepolia"
```

## Base64

To get the base64 of an image, you can use the following command:

```
echo "data:image/svg+xml;base64,$(base64 -i ./images/dynamicNft/happy.svg)"
```

Then, you can get the base64 encoding of the json object by placing the imageURI into `happy_image_uri.json` then running:

```
echo "data:application/json;base64,$(base64 -i ./images/dynamicNft/happy_image_uri.json)"
```


## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see and output file called `.gas-snapshot`


# Formatting


To run code formatting:
```
forge fmt
```
